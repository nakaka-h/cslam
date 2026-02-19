;; Auto-generated. Do not edit!


(when (boundp 'dcl_slam::loop_info)
  (if (not (find-package "DCL_SLAM"))
    (make-package "DCL_SLAM"))
  (shadow 'loop_info (find-package "DCL_SLAM")))
(unless (find-package "DCL_SLAM::LOOP_INFO")
  (make-package "DCL_SLAM::LOOP_INFO"))

(in-package "ROS")
;;//! \htmlinclude loop_info.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass dcl_slam::loop_info
  :super ros::object
  :slots (_header _robot0 _robot1 _index0 _index1 _noise _init_yaw _pose0 _pose1 _scan_cloud _pose_between ))

(defmethod dcl_slam::loop_info
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:robot0 __robot0) 0)
    ((:robot1 __robot1) 0)
    ((:index0 __index0) 0)
    ((:index1 __index1) 0)
    ((:noise __noise) 0.0)
    ((:init_yaw __init_yaw) 0)
    ((:pose0 __pose0) (instance geometry_msgs::Transform :init))
    ((:pose1 __pose1) (instance geometry_msgs::Transform :init))
    ((:scan_cloud __scan_cloud) (instance sensor_msgs::PointCloud2 :init))
    ((:pose_between __pose_between) (instance geometry_msgs::Transform :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _robot0 (round __robot0))
   (setq _robot1 (round __robot1))
   (setq _index0 (round __index0))
   (setq _index1 (round __index1))
   (setq _noise (float __noise))
   (setq _init_yaw (round __init_yaw))
   (setq _pose0 __pose0)
   (setq _pose1 __pose1)
   (setq _scan_cloud __scan_cloud)
   (setq _pose_between __pose_between)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:robot0
   (&optional __robot0)
   (if __robot0 (setq _robot0 __robot0)) _robot0)
  (:robot1
   (&optional __robot1)
   (if __robot1 (setq _robot1 __robot1)) _robot1)
  (:index0
   (&optional __index0)
   (if __index0 (setq _index0 __index0)) _index0)
  (:index1
   (&optional __index1)
   (if __index1 (setq _index1 __index1)) _index1)
  (:noise
   (&optional __noise)
   (if __noise (setq _noise __noise)) _noise)
  (:init_yaw
   (&optional __init_yaw)
   (if __init_yaw (setq _init_yaw __init_yaw)) _init_yaw)
  (:pose0
   (&rest __pose0)
   (if (keywordp (car __pose0))
       (send* _pose0 __pose0)
     (progn
       (if __pose0 (setq _pose0 (car __pose0)))
       _pose0)))
  (:pose1
   (&rest __pose1)
   (if (keywordp (car __pose1))
       (send* _pose1 __pose1)
     (progn
       (if __pose1 (setq _pose1 (car __pose1)))
       _pose1)))
  (:scan_cloud
   (&rest __scan_cloud)
   (if (keywordp (car __scan_cloud))
       (send* _scan_cloud __scan_cloud)
     (progn
       (if __scan_cloud (setq _scan_cloud (car __scan_cloud)))
       _scan_cloud)))
  (:pose_between
   (&rest __pose_between)
   (if (keywordp (car __pose_between))
       (send* _pose_between __pose_between)
     (progn
       (if __pose_between (setq _pose_between (car __pose_between)))
       _pose_between)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _robot0
    4
    ;; int32 _robot1
    4
    ;; int32 _index0
    4
    ;; int32 _index1
    4
    ;; float32 _noise
    4
    ;; int32 _init_yaw
    4
    ;; geometry_msgs/Transform _pose0
    (send _pose0 :serialization-length)
    ;; geometry_msgs/Transform _pose1
    (send _pose1 :serialization-length)
    ;; sensor_msgs/PointCloud2 _scan_cloud
    (send _scan_cloud :serialization-length)
    ;; geometry_msgs/Transform _pose_between
    (send _pose_between :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _robot0
       (write-long _robot0 s)
     ;; int32 _robot1
       (write-long _robot1 s)
     ;; int32 _index0
       (write-long _index0 s)
     ;; int32 _index1
       (write-long _index1 s)
     ;; float32 _noise
       (sys::poke _noise (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _init_yaw
       (write-long _init_yaw s)
     ;; geometry_msgs/Transform _pose0
       (send _pose0 :serialize s)
     ;; geometry_msgs/Transform _pose1
       (send _pose1 :serialize s)
     ;; sensor_msgs/PointCloud2 _scan_cloud
       (send _scan_cloud :serialize s)
     ;; geometry_msgs/Transform _pose_between
       (send _pose_between :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _robot0
     (setq _robot0 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _robot1
     (setq _robot1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _index0
     (setq _index0 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _index1
     (setq _index1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _noise
     (setq _noise (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _init_yaw
     (setq _init_yaw (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; geometry_msgs/Transform _pose0
     (send _pose0 :deserialize buf ptr-) (incf ptr- (send _pose0 :serialization-length))
   ;; geometry_msgs/Transform _pose1
     (send _pose1 :deserialize buf ptr-) (incf ptr- (send _pose1 :serialization-length))
   ;; sensor_msgs/PointCloud2 _scan_cloud
     (send _scan_cloud :deserialize buf ptr-) (incf ptr- (send _scan_cloud :serialization-length))
   ;; geometry_msgs/Transform _pose_between
     (send _pose_between :deserialize buf ptr-) (incf ptr- (send _pose_between :serialization-length))
   ;;
   self)
  )

(setf (get dcl_slam::loop_info :md5sum-) "f1431bfa4497640b0a25a7c95cc6acc6")
(setf (get dcl_slam::loop_info :datatype-) "dcl_slam/loop_info")
(setf (get dcl_slam::loop_info :definition-)
      "# Loop Info
Header header

int32 robot0
int32 robot1
int32 index0
int32 index1
float32 noise
int32 init_yaw
geometry_msgs/Transform pose0
geometry_msgs/Transform pose1
sensor_msgs/PointCloud2 scan_cloud
geometry_msgs/Transform pose_between
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Transform
# This represents the transform between two coordinate frames in free space.

Vector3 translation
Quaternion rotation

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: sensor_msgs/PointCloud2
# This message holds a collection of N-dimensional points, which may
# contain additional information such as normals, intensity, etc. The
# point data is stored as a binary blob, its layout described by the
# contents of the \"fields\" array.

# The point cloud data may be organized 2d (image-like) or 1d
# (unordered). Point clouds organized as 2d images may be produced by
# camera depth sensors such as stereo or time-of-flight.

# Time of sensor data acquisition, and the coordinate frame ID (for 3d
# points).
Header header

# 2D structure of the point cloud. If the cloud is unordered, height is
# 1 and width is the length of the point cloud.
uint32 height
uint32 width

# Describes the channels and their layout in the binary data blob.
PointField[] fields

bool    is_bigendian # Is this data bigendian?
uint32  point_step   # Length of a point in bytes
uint32  row_step     # Length of a row in bytes
uint8[] data         # Actual point data, size is (row_step*height)

bool is_dense        # True if there are no invalid points

================================================================================
MSG: sensor_msgs/PointField
# This message holds the description of one point entry in the
# PointCloud2 message format.
uint8 INT8    = 1
uint8 UINT8   = 2
uint8 INT16   = 3
uint8 UINT16  = 4
uint8 INT32   = 5
uint8 UINT32  = 6
uint8 FLOAT32 = 7
uint8 FLOAT64 = 8

string name      # Name of field
uint32 offset    # Offset from start of point struct
uint8  datatype  # Datatype enumeration, see above
uint32 count     # How many elements in the field

")



(provide :dcl_slam/loop_info "f1431bfa4497640b0a25a7c95cc6acc6")


