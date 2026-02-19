#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""CoppeliaSim to DCL-SLAM Bridge Node  (FAST-LIO2 向け)
====================================
CoppeliaSim から publish されるセンサデータを DCL-FAST-LIO 向けに変換する。

1) LiDAR PointCloud2:
   - 部分スキャン (~90°, 20Hz) を4回蓄積し 360° フルスキャン (5Hz) で publish
   - intensity / ring / time フィールドを付加 (VelodynePointXYZIRT 形式)
   - time フィールドはミリ秒 (timestamp_unit: 1)
   - FAST-LIO sync_packages がスキャン末尾の time から lidar_end_time を算出し
     IMU データが揃うまで待機 → 自動的に IMU と同期される
   - ワールド座標系 → ボディ座標系に変換
   - lidar_max_range 超の点 (far clipping plane) を除外
2) IMU: 20Hz → 200Hz に線形補間（orientation は SLERP）

CoppeliaSim 側:
  /<prefix>/velodyne_points_raw  (ワールド座標系 PointCloud2, xyz only)
  /<prefix>/imu/data_raw         (sensor_msgs/Imu, 20Hz)
  TF: map -> <prefix>/base_link  (真値姿勢, sim_ros_interface)

本ノードが publish:
  /<prefix>/velodyne_points      (ボディ座標系 PointCloud2, VelodynePointXYZIRT)
  /<prefix>/imu/data             (sensor_msgs/Imu, 200Hz 補間)
"""

import struct
import rospy
import numpy as np
import tf2_ros
from sensor_msgs.msg import PointCloud2, PointField, Imu
from std_msgs.msg import Header


def slerp(q0, q1, t):
    """球面線形補間。q = [x, y, z, w]"""
    dot = np.dot(q0, q1)
    if dot < 0:
        q1 = -q1
        dot = -dot
    dot = min(dot, 1.0)
    if dot > 0.9995:
        result = q0 + t * (q1 - q0)
        return result / np.linalg.norm(result)
    theta_0 = np.arccos(dot)
    sin_theta_0 = np.sin(theta_0)
    theta = theta_0 * t
    s0 = np.cos(theta) - dot * np.sin(theta) / sin_theta_0
    s1 = np.sin(theta) / sin_theta_0
    result = s0 * q0 + s1 * q1
    return result / np.linalg.norm(result)


# VelodyneVPL-16 の ring テーブル (仰角 → ring ID)
# 仰角: -15, -13, -11, -9, -7, -5, -3, -1, 1, 3, 5, 7, 9, 11, 13, 15 度
_VLP16_ELEVATIONS_DEG = np.array(
    [-15, -13, -11, -9, -7, -5, -3, -1, 1, 3, 5, 7, 9, 11, 13, 15],
    dtype=np.float64)
_VLP16_ELEVATIONS_RAD = np.deg2rad(_VLP16_ELEVATIONS_DEG)


def compute_ring_vlp16(x, y, z):
    """xyz (numpy arrays) から VLP-16 ring ID (0-15) をベクトル演算で計算"""
    dist = np.sqrt(x * x + y * y + z * z)
    # ゼロ除算回避
    safe_dist = np.where(dist > 1e-6, dist, 1.0)
    elev = np.arcsin(z / safe_dist)
    # 最も近い仰角の ring を選択
    diff = np.abs(elev[:, np.newaxis] - _VLP16_ELEVATIONS_RAD[np.newaxis, :])
    ring = np.argmin(diff, axis=1).astype(np.uint16)
    return ring


class CoppeliaBridge(object):
    def __init__(self):
        rospy.init_node('coppelia_bridge', anonymous=True)

        # --- パラメータ ---
        self.prefix = rospy.get_param('~prefix', 'a')
        self.body_frame = rospy.get_param('~body_frame',
                                          self.prefix + '/base_link')
        self.world_frame = rospy.get_param('~world_frame', 'map')
        self.imu_target_rate = int(rospy.get_param('~imu_target_rate', 200))
        # VelodyneVPL16 のスキャン周波数 (CoppeliaSim 側の frequency)
        self.lidar_frequency = float(rospy.get_param('~lidar_frequency', 5.0))
        self.scan_period = 1.0 / self.lidar_frequency  # 0.2s per full rotation
        self.scan_period_ms = self.scan_period * 1000.0  # 200ms
        # 最大距離フィルタ (far clipping plane の点を除外)
        self.lidar_max_range = float(rospy.get_param('~lidar_max_range', 4.1))

        # --- TF ---
        self.tf_buffer = tf2_ros.Buffer(rospy.Duration(5.0))
        self.tf_listener = tf2_ros.TransformListener(self.tf_buffer)

        # --- IMU 共分散設定 ---
        acc_noise = rospy.get_param('~acc_noise', 0.1)
        gyro_noise = rospy.get_param('~gyro_noise', 0.1)
        orient_noise = rospy.get_param('~orient_noise', 0.1)

        self.orientation_cov = self._diagonal_cov(orient_noise)
        self.angular_velocity_cov = self._diagonal_cov(gyro_noise)
        self.linear_acceleration_cov = self._diagonal_cov(acc_noise)

        # --- IMU 補間用 ---
        self.prev_imu = None

        # --- LiDAR スキャン蓄積用 ---
        self.acc_points_xyz = []    # list of (x, y, z, intensity, ring) tuples
        self.acc_n_points = []      # 各部分スキャンの点数
        self.acc_stamps = []        # 各部分スキャンのタイムスタンプ
        self.acc_start_stamp = None # 蓄積開始時刻 (rospy.Time)
        self.acc_elapsed = 0.0      # 蓄積済み時間 [s]
        self._tf_ready = False      # TF が利用可能か

        # --- VelodynePointXYZIRT の PointField 定義 ---
        self.vlp_fields = [
            PointField(name='x',         offset=0,  datatype=PointField.FLOAT32, count=1),
            PointField(name='y',         offset=4,  datatype=PointField.FLOAT32, count=1),
            PointField(name='z',         offset=8,  datatype=PointField.FLOAT32, count=1),
            PointField(name='intensity', offset=12, datatype=PointField.FLOAT32, count=1),
            PointField(name='ring',      offset=16, datatype=PointField.UINT16,  count=1),
            PointField(name='time',      offset=18, datatype=PointField.FLOAT32, count=1),
        ]
        # x(4)+y(4)+z(4)+intensity(4)+ring(2)+time(4) = 22 bytes
        # ただし C++ 構造体アラインメントにより VelodynePointXYZIRT は
        # PCL_ADD_POINT4D(16) + intensity(4) + time(4) + ring(2) + padding(2) = 28
        # しかし pcl::fromROSMsg は fields の offset に従うので 22 で問題ない
        self.vlp_point_step = 22
        self.vlp_dtype = np.dtype([
            ('x', '<f4'), ('y', '<f4'), ('z', '<f4'),
            ('intensity', '<f4'), ('ring', '<u2'), ('time', '<f4')
        ])

        # --- Publisher ---
        ns = '/' + self.prefix + '/'
        self.pc_pub = rospy.Publisher(
            ns + 'velodyne_points', PointCloud2, queue_size=5)
        self.imu_pub = rospy.Publisher(
            ns + 'imu/data', Imu, queue_size=50)

        # --- Subscriber ---
        self.pc_sub = rospy.Subscriber(
            ns + 'velodyne_points_raw', PointCloud2,
            self.pc_callback, queue_size=10)
        self.imu_sub = rospy.Subscriber(
            ns + 'imu/data_raw', Imu,
            self.imu_callback, queue_size=50)

        rospy.loginfo('[Bridge %s] FAST-LIO mode: world=%s  body=%s  max_range=%.1f m',
                      self.prefix, self.world_frame, self.body_frame,
                      self.lidar_max_range)
        rospy.loginfo('[Bridge %s] IMU rate=%d Hz, noise: acc=%.3f gyro=%.3f orient=%.3f',
                      self.prefix, self.imu_target_rate, acc_noise, gyro_noise, orient_noise)
        rospy.loginfo('[Bridge %s] Accumulating 4 partial scans -> 1 full rotation (%.1f Hz)',
                      self.prefix, self.lidar_frequency)
        rospy.loginfo('[Bridge %s] time field: 0~%.0f ms (FAST-LIO sync_packages uses this for IMU sync)',
                      self.prefix, self.scan_period_ms)

    @staticmethod
    def _diagonal_cov(val):
        """3x3 対角共分散行列を 9要素リストで返す"""
        cov = [0.0] * 9
        cov[0] = val * val
        cov[4] = val * val
        cov[8] = val * val
        return cov

    # ========================================
    # ユーティリティ
    # ========================================
    @staticmethod
    def quat_to_rot(qx, qy, qz, qw):
        return np.array([
            [1-2*(qy*qy+qz*qz), 2*(qx*qy-qz*qw),   2*(qx*qz+qy*qw)],
            [2*(qx*qy+qz*qw),   1-2*(qx*qx+qz*qz),  2*(qy*qz-qx*qw)],
            [2*(qx*qz-qy*qw),   2*(qy*qz+qx*qw),    1-2*(qx*qx+qy*qy)]
        ])

    @staticmethod
    def _pc2_dtype(fields, point_step):
        type_map = {1:'i1', 2:'u1', 3:'<i2', 4:'<u2',
                    5:'<i4', 6:'<u4', 7:'<f4', 8:'<f8'}
        return np.dtype({
            'names':   [f.name for f in fields],
            'formats': [type_map[f.datatype] for f in fields],
            'offsets': [f.offset for f in fields],
            'itemsize': point_step
        })

    # ========================================
    # IMU コールバック  (20Hz → 200Hz 補間)
    # ========================================
    def imu_callback(self, msg):
        if self.prev_imu is None:
            self.prev_imu = msg
            out = Imu()
            out.header = msg.header
            out.orientation = msg.orientation
            out.angular_velocity = msg.angular_velocity
            out.linear_acceleration = msg.linear_acceleration
            out.orientation_covariance = self.orientation_cov
            out.angular_velocity_covariance = self.angular_velocity_cov
            out.linear_acceleration_covariance = self.linear_acceleration_cov
            self.imu_pub.publish(out)
            return

        t0 = self.prev_imu.header.stamp.to_sec()
        t1 = msg.header.stamp.to_sec()
        dt_orig = t1 - t0
        if dt_orig <= 0:
            self.prev_imu = msg
            return

        dt_target = 1.0 / self.imu_target_rate
        n_steps = max(int(round(dt_orig / dt_target)), 1)

        q0 = np.array([self.prev_imu.orientation.x,
                        self.prev_imu.orientation.y,
                        self.prev_imu.orientation.z,
                        self.prev_imu.orientation.w])
        q1 = np.array([msg.orientation.x,
                        msg.orientation.y,
                        msg.orientation.z,
                        msg.orientation.w])
        p = self.prev_imu

        for i in range(n_steps):
            a = (i + 1.0) / n_steps
            t_interp = t0 + a * dt_orig

            out = Imu()
            out.header.stamp = rospy.Time.from_sec(t_interp)
            out.header.frame_id = msg.header.frame_id

            qi = slerp(q0, q1, a)
            out.orientation.x = qi[0]
            out.orientation.y = qi[1]
            out.orientation.z = qi[2]
            out.orientation.w = qi[3]

            out.angular_velocity.x = (1-a)*p.angular_velocity.x + a*msg.angular_velocity.x
            out.angular_velocity.y = (1-a)*p.angular_velocity.y + a*msg.angular_velocity.y
            out.angular_velocity.z = (1-a)*p.angular_velocity.z + a*msg.angular_velocity.z

            out.linear_acceleration.x = (1-a)*p.linear_acceleration.x + a*msg.linear_acceleration.x
            out.linear_acceleration.y = (1-a)*p.linear_acceleration.y + a*msg.linear_acceleration.y
            out.linear_acceleration.z = (1-a)*p.linear_acceleration.z + a*msg.linear_acceleration.z

            out.orientation_covariance = self.orientation_cov
            out.angular_velocity_covariance = self.angular_velocity_cov
            out.linear_acceleration_covariance = self.linear_acceleration_cov

            self.imu_pub.publish(out)

        self.prev_imu = msg

    # ========================================
    # PointCloud2 コールバック
    #   部分スキャン蓄積 → 1回転分で publish
    #   FAST-LIO sync_packages が time (curvature/1000) で
    #   lidar_end_time を計算し IMU データ待ちを行うため
    #   自動的に IMU と同期される
    # ========================================
    def pc_callback(self, msg):
        try:
            if msg.point_step == 0 or len(msg.data) == 0 or msg.width == 0:
                return

            # --- 入力の xyz を取得 ---
            in_dt = self._pc2_dtype(msg.fields, msg.point_step)
            raw_points = np.frombuffer(msg.data, dtype=in_dt)
            if len(raw_points) == 0:
                return

            n = len(raw_points)
            x = raw_points['x'].astype(np.float32)
            y = raw_points['y'].astype(np.float32)
            z = raw_points['z'].astype(np.float32)

            # intensity
            if 'intensity' in in_dt.names:
                intensity = raw_points['intensity'].astype(np.float32)
            else:
                intensity = np.full(n, 100.0, dtype=np.float32)

            # ring
            if 'ring' in in_dt.names:
                ring = raw_points['ring'].astype(np.uint16)
            else:
                ring = compute_ring_vlp16(x, y, z)

            # --- 蓄積 ---
            if self.acc_start_stamp is None:
                self.acc_start_stamp = msg.header.stamp
                self.acc_elapsed = 0.0

            self.acc_points_xyz.append((x, y, z, intensity, ring))
            self.acc_n_points.append(n)
            self.acc_stamps.append(msg.header.stamp)

            msg_time_sec = msg.header.stamp.to_sec()
            dt_chunk = 1.0 / 20.0  # 20Hz partial scan
            self.acc_elapsed = msg_time_sec - self.acc_start_stamp.to_sec() + dt_chunk

            # --- 1回転分蓄積完了？ ---
            if self.acc_elapsed >= self.scan_period - 0.001:
                self._publish_full_scan()

        except Exception as e:
            rospy.logwarn_throttle(5, '[Bridge %s] PC: %s' %
                                  (self.prefix, str(e)))

    def _publish_full_scan(self):
        """蓄積した部分スキャンを結合し、座標変換して publish

        各部分スキャンを **個別のTF** でボディ座標系に変換する。
        これにより各点が実際のキャプチャ時刻のボディ座標系に正しく配置され、
        FAST-LIO の UndistortPcl が正確な歪み補正を行える。

        time フィールド: 各部分スキャンの実キャプチャ時刻に基づく [ms]
        - Scan 1 (t+0ms):   0 ~ 50 ms
        - Scan 2 (t+50ms):  50 ~ 100 ms
        - Scan 3 (t+100ms): 100 ~ 150 ms
        - Scan 4 (t+150ms): 150 ~ 200 ms
        """
        if not self.acc_points_xyz or self.acc_start_stamp is None:
            self._reset_accumulation()
            return

        try:
            stamp = self.acc_start_stamp
            chunk_ms = 1000.0 / 20.0  # 50ms per partial scan
            max_r_sq = self.lidar_max_range * self.lidar_max_range

            transformed_scans = []

            for i, (pts, scan_stamp) in enumerate(
                    zip(self.acc_points_xyz, self.acc_stamps)):
                x, y, z, intensity, ring = pts
                n = len(x)
                if n == 0:
                    continue

                # --- 各部分スキャンの TF でワールド → ボディ座標変換 ---
                try:
                    trans = self.tf_buffer.lookup_transform(
                        self.body_frame, self.world_frame,
                        scan_stamp, rospy.Duration(0.05))

                    q = trans.transform.rotation
                    t = trans.transform.translation
                    R = self.quat_to_rot(q.x, q.y, q.z, q.w)
                    T = np.array([t.x, t.y, t.z])

                    xyz_w = np.vstack([x.astype(np.float64),
                                       y.astype(np.float64),
                                       z.astype(np.float64)])
                    xyz_b = R @ xyz_w + T.reshape(3, 1)

                    x_b = xyz_b[0].astype(np.float32)
                    y_b = xyz_b[1].astype(np.float32)
                    z_b = xyz_b[2].astype(np.float32)

                except (tf2_ros.LookupException,
                        tf2_ros.ConnectivityException,
                        tf2_ros.ExtrapolationException):
                    # TF 取得失敗 → この部分スキャンをスキップ
                    continue

                # --- 最大距離フィルタ (ボディ座標系 = センサ原点基準) ---
                dist_sq = x_b * x_b + y_b * y_b + z_b * z_b
                mask = dist_sq <= max_r_sq
                x_b = x_b[mask]
                y_b = y_b[mask]
                z_b = z_b[mask]
                int_f = intensity[mask]
                ring_f = ring[mask]
                n_filt = len(x_b)
                if n_filt == 0:
                    continue

                # --- 時間オフセット割り当て ---
                # 各部分スキャンのキャプチャ時刻に基づき、
                # スキャン内の点は chunk_ms (50ms) に渡って均等に分布
                dt_start_ms = (scan_stamp.to_sec()
                               - stamp.to_sec()) * 1000.0
                dt_end_ms = min(dt_start_ms + chunk_ms,
                                self.scan_period_ms)
                time_scan = np.linspace(
                    dt_start_ms, dt_end_ms, n_filt, endpoint=False
                ).astype(np.float32)

                transformed_scans.append(
                    (x_b, y_b, z_b, int_f, ring_f, time_scan))

            if not transformed_scans:
                if not self._tf_ready:
                    rospy.loginfo_throttle(5,
                        '[Bridge %s] Waiting for TF (map->%s)...',
                        self.prefix, self.body_frame)
                self._reset_accumulation()
                return

            if not self._tf_ready:
                rospy.loginfo(
                    '[Bridge %s] TF available — per-scan transform active',
                    self.prefix)
                self._tf_ready = True

            # --- 全部分スキャンを結合 ---
            all_x = np.concatenate([s[0] for s in transformed_scans])
            all_y = np.concatenate([s[1] for s in transformed_scans])
            all_z = np.concatenate([s[2] for s in transformed_scans])
            all_int = np.concatenate([s[3] for s in transformed_scans])
            all_ring = np.concatenate([s[4] for s in transformed_scans])
            time_offsets = np.concatenate(
                [s[5] for s in transformed_scans])
            n_total = len(all_x)

            if n_total == 0:
                self._reset_accumulation()
                return

            # VelodynePointXYZIRT 形式の structured array を構築
            out_arr = np.empty(n_total, dtype=self.vlp_dtype)
            out_arr['x'] = all_x
            out_arr['y'] = all_y
            out_arr['z'] = all_z
            out_arr['intensity'] = all_int
            out_arr['ring'] = all_ring
            out_arr['time'] = time_offsets

            # --- PointCloud2 メッセージ構築・publish ---
            out = PointCloud2()
            out.header.stamp = stamp
            out.header.frame_id = self.body_frame
            out.height = 1
            out.width = n_total
            out.fields = self.vlp_fields
            out.is_bigendian = False
            out.point_step = self.vlp_point_step
            out.row_step = self.vlp_point_step * n_total
            out.data = out_arr.tobytes()
            out.is_dense = True
            self.pc_pub.publish(out)

        except Exception as e:
            rospy.logwarn_throttle(5, '[Bridge %s] publish error: %s' %
                                  (self.prefix, str(e)))

        self._reset_accumulation()

    def _reset_accumulation(self):
        """蓄積状態をリセット"""
        self.acc_points_xyz = []
        self.acc_n_points = []
        self.acc_stamps = []
        self.acc_start_stamp = None
        self.acc_elapsed = 0.0


if __name__ == '__main__':
    try:
        bridge = CoppeliaBridge()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
