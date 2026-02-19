#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
CoppeliaSim to DCL-SLAM IMU Bridge Node
========================================
CoppeliaSim の simROS で publish された生の IMU トピックを受信し、
DCL-SLAM (LIO-SAM / FAST-LIO2) が期待する形式に変換して再 publish する。

CoppeliaSim Lua スクリプト側では以下のように publish する想定:
  - simROS.advertise('/<prefix>/imu/data_raw', 'sensor_msgs/Imu')
  - imuMsg の内容:
      orientation:          ワールド座標系のクォータニオン [qx,qy,qz,qw]
      angular_velocity:     ボディ座標系の角速度
      linear_acceleration:  ボディ座標系の加速度（重力反力込み）

本ノードの処理:
  1. CoppeliaSim からの IMU メッセージを subscribe
  2. covariance の付与、frame_id の確認
  3. DCL-SLAM 用トピックとして再 publish

パラメータ:
  ~prefix        : ロボット識別子 (default: "a")
  ~input_topic   : CoppeliaSim 側の IMU トピック名 (default: "imu/data_raw")
  ~output_topic  : DCL-SLAM 側の IMU トピック名 (default: "imu/data")
"""

import rospy
import numpy as np
from sensor_msgs.msg import Imu
from geometry_msgs.msg import Vector3, Quaternion


class ImuBridge(object):
    def __init__(self):
        rospy.init_node('coppelia_imu_bridge', anonymous=True)

        # パラメータ取得
        self.prefix = rospy.get_param('~prefix', 'a')
        input_topic = rospy.get_param('~input_topic', 'imu/data_raw')
        output_topic = rospy.get_param('~output_topic', 'imu/data')
        self.frame_id = rospy.get_param('~frame_id', self.prefix + '/base_link')

        # Covariance の設定
        # 実際のIMUセンサーに近い共分散を設定
        # 値を大きくすることで、より現実的な不確実性推定が可能
        # 参考: 実際のIMUセンサー (MPU6050など) の仕様に基づく
        acc_noise = rospy.get_param('~acc_noise', 0.1)      # 0.01 -> 0.1 (10倍)
        gyro_noise = rospy.get_param('~gyro_noise', 0.1)    # 0.01 -> 0.1 (10倍)
        orient_noise = rospy.get_param('~orient_noise', 0.1) # 0.01 -> 0.1 (10倍)

        self.orientation_cov = self._diagonal_cov(orient_noise)
        self.angular_velocity_cov = self._diagonal_cov(gyro_noise)
        self.linear_acceleration_cov = self._diagonal_cov(acc_noise)

        # 前フレームの速度（数値微分用）
        self.prev_linear_vel = None
        self.prev_time = None

        # Publisher / Subscriber
        ns = '/' + self.prefix + '/'
        self.pub = rospy.Publisher(ns + output_topic, Imu, queue_size=50)
        self.sub = rospy.Subscriber(ns + input_topic, Imu, self.imu_callback, queue_size=50)

        rospy.loginfo('[IMU Bridge] %s -> %s (frame: %s)',
                      ns + input_topic, ns + output_topic, self.frame_id)

    @staticmethod
    def _diagonal_cov(val):
        """3x3 対角共分散行列を 9要素リストで返す"""
        cov = [0.0] * 9
        cov[0] = val
        cov[4] = val
        cov[8] = val
        return cov

    def imu_callback(self, msg):
        """
        CoppeliaSim からの IMU メッセージを DCL-SLAM 形式に変換して publish
        """
        out = Imu()

        # ヘッダー
        out.header.stamp = msg.header.stamp
        out.header.frame_id = self.frame_id

        # orientation（ワールド座標系、そのまま渡す）
        out.orientation = msg.orientation
        out.orientation_covariance = self.orientation_cov

        # angular_velocity（ボディ座標系、そのまま渡す）
        out.angular_velocity = msg.angular_velocity
        out.angular_velocity_covariance = self.angular_velocity_cov

        # linear_acceleration（ボディ座標系、そのまま渡す）
        out.linear_acceleration = msg.linear_acceleration
        out.linear_acceleration_covariance = self.linear_acceleration_cov

        self.pub.publish(out)

    def run(self):
        rospy.spin()


if __name__ == '__main__':
    try:
        bridge = ImuBridge()
        bridge.run()
    except rospy.ROSInterruptException:
        pass
