; Auto-generated. Do not edit!


(cl:in-package dcl_slam-msg)


;//! \htmlinclude loop_info.msg.html

(cl:defclass <loop_info> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (robot0
    :reader robot0
    :initarg :robot0
    :type cl:integer
    :initform 0)
   (robot1
    :reader robot1
    :initarg :robot1
    :type cl:integer
    :initform 0)
   (index0
    :reader index0
    :initarg :index0
    :type cl:integer
    :initform 0)
   (index1
    :reader index1
    :initarg :index1
    :type cl:integer
    :initform 0)
   (noise
    :reader noise
    :initarg :noise
    :type cl:float
    :initform 0.0)
   (init_yaw
    :reader init_yaw
    :initarg :init_yaw
    :type cl:integer
    :initform 0)
   (pose0
    :reader pose0
    :initarg :pose0
    :type geometry_msgs-msg:Transform
    :initform (cl:make-instance 'geometry_msgs-msg:Transform))
   (pose1
    :reader pose1
    :initarg :pose1
    :type geometry_msgs-msg:Transform
    :initform (cl:make-instance 'geometry_msgs-msg:Transform))
   (scan_cloud
    :reader scan_cloud
    :initarg :scan_cloud
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2))
   (pose_between
    :reader pose_between
    :initarg :pose_between
    :type geometry_msgs-msg:Transform
    :initform (cl:make-instance 'geometry_msgs-msg:Transform)))
)

(cl:defclass loop_info (<loop_info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <loop_info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'loop_info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dcl_slam-msg:<loop_info> is deprecated: use dcl_slam-msg:loop_info instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <loop_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:header-val is deprecated.  Use dcl_slam-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'robot0-val :lambda-list '(m))
(cl:defmethod robot0-val ((m <loop_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:robot0-val is deprecated.  Use dcl_slam-msg:robot0 instead.")
  (robot0 m))

(cl:ensure-generic-function 'robot1-val :lambda-list '(m))
(cl:defmethod robot1-val ((m <loop_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:robot1-val is deprecated.  Use dcl_slam-msg:robot1 instead.")
  (robot1 m))

(cl:ensure-generic-function 'index0-val :lambda-list '(m))
(cl:defmethod index0-val ((m <loop_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:index0-val is deprecated.  Use dcl_slam-msg:index0 instead.")
  (index0 m))

(cl:ensure-generic-function 'index1-val :lambda-list '(m))
(cl:defmethod index1-val ((m <loop_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:index1-val is deprecated.  Use dcl_slam-msg:index1 instead.")
  (index1 m))

(cl:ensure-generic-function 'noise-val :lambda-list '(m))
(cl:defmethod noise-val ((m <loop_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:noise-val is deprecated.  Use dcl_slam-msg:noise instead.")
  (noise m))

(cl:ensure-generic-function 'init_yaw-val :lambda-list '(m))
(cl:defmethod init_yaw-val ((m <loop_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:init_yaw-val is deprecated.  Use dcl_slam-msg:init_yaw instead.")
  (init_yaw m))

(cl:ensure-generic-function 'pose0-val :lambda-list '(m))
(cl:defmethod pose0-val ((m <loop_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:pose0-val is deprecated.  Use dcl_slam-msg:pose0 instead.")
  (pose0 m))

(cl:ensure-generic-function 'pose1-val :lambda-list '(m))
(cl:defmethod pose1-val ((m <loop_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:pose1-val is deprecated.  Use dcl_slam-msg:pose1 instead.")
  (pose1 m))

(cl:ensure-generic-function 'scan_cloud-val :lambda-list '(m))
(cl:defmethod scan_cloud-val ((m <loop_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:scan_cloud-val is deprecated.  Use dcl_slam-msg:scan_cloud instead.")
  (scan_cloud m))

(cl:ensure-generic-function 'pose_between-val :lambda-list '(m))
(cl:defmethod pose_between-val ((m <loop_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:pose_between-val is deprecated.  Use dcl_slam-msg:pose_between instead.")
  (pose_between m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <loop_info>) ostream)
  "Serializes a message object of type '<loop_info>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'robot0)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'robot1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'index0)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'index1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'noise))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'init_yaw)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose0) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose1) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'scan_cloud) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose_between) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <loop_info>) istream)
  "Deserializes a message object of type '<loop_info>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot0) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot1) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'index0) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'index1) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'noise) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'init_yaw) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose0) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose1) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'scan_cloud) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose_between) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<loop_info>)))
  "Returns string type for a message object of type '<loop_info>"
  "dcl_slam/loop_info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'loop_info)))
  "Returns string type for a message object of type 'loop_info"
  "dcl_slam/loop_info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<loop_info>)))
  "Returns md5sum for a message object of type '<loop_info>"
  "f1431bfa4497640b0a25a7c95cc6acc6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'loop_info)))
  "Returns md5sum for a message object of type 'loop_info"
  "f1431bfa4497640b0a25a7c95cc6acc6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<loop_info>)))
  "Returns full string definition for message of type '<loop_info>"
  (cl:format cl:nil "# Loop Info~%Header header~%~%int32 robot0~%int32 robot1~%int32 index0~%int32 index1~%float32 noise~%int32 init_yaw~%geometry_msgs/Transform pose0~%geometry_msgs/Transform pose1~%sensor_msgs/PointCloud2 scan_cloud~%geometry_msgs/Transform pose_between~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'loop_info)))
  "Returns full string definition for message of type 'loop_info"
  (cl:format cl:nil "# Loop Info~%Header header~%~%int32 robot0~%int32 robot1~%int32 index0~%int32 index1~%float32 noise~%int32 init_yaw~%geometry_msgs/Transform pose0~%geometry_msgs/Transform pose1~%sensor_msgs/PointCloud2 scan_cloud~%geometry_msgs/Transform pose_between~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <loop_info>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose0))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose1))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'scan_cloud))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose_between))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <loop_info>))
  "Converts a ROS message object to a list"
  (cl:list 'loop_info
    (cl:cons ':header (header msg))
    (cl:cons ':robot0 (robot0 msg))
    (cl:cons ':robot1 (robot1 msg))
    (cl:cons ':index0 (index0 msg))
    (cl:cons ':index1 (index1 msg))
    (cl:cons ':noise (noise msg))
    (cl:cons ':init_yaw (init_yaw msg))
    (cl:cons ':pose0 (pose0 msg))
    (cl:cons ':pose1 (pose1 msg))
    (cl:cons ':scan_cloud (scan_cloud msg))
    (cl:cons ':pose_between (pose_between msg))
))
