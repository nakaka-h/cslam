; Auto-generated. Do not edit!


(cl:in-package dcl_slam-msg)


;//! \htmlinclude neighbor_estimate.msg.html

(cl:defclass <neighbor_estimate> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (receiver_id
    :reader receiver_id
    :initarg :receiver_id
    :type cl:fixnum
    :initform 0)
   (estimation_done
    :reader estimation_done
    :initarg :estimation_done
    :type cl:fixnum
    :initform 0)
   (initialized
    :reader initialized
    :initarg :initialized
    :type cl:fixnum
    :initform 0)
   (anchor_offset
    :reader anchor_offset
    :initarg :anchor_offset
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (pose_id
    :reader pose_id
    :initarg :pose_id
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (estimate
    :reader estimate
    :initarg :estimate
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass neighbor_estimate (<neighbor_estimate>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <neighbor_estimate>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'neighbor_estimate)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dcl_slam-msg:<neighbor_estimate> is deprecated: use dcl_slam-msg:neighbor_estimate instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <neighbor_estimate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:header-val is deprecated.  Use dcl_slam-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'receiver_id-val :lambda-list '(m))
(cl:defmethod receiver_id-val ((m <neighbor_estimate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:receiver_id-val is deprecated.  Use dcl_slam-msg:receiver_id instead.")
  (receiver_id m))

(cl:ensure-generic-function 'estimation_done-val :lambda-list '(m))
(cl:defmethod estimation_done-val ((m <neighbor_estimate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:estimation_done-val is deprecated.  Use dcl_slam-msg:estimation_done instead.")
  (estimation_done m))

(cl:ensure-generic-function 'initialized-val :lambda-list '(m))
(cl:defmethod initialized-val ((m <neighbor_estimate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:initialized-val is deprecated.  Use dcl_slam-msg:initialized instead.")
  (initialized m))

(cl:ensure-generic-function 'anchor_offset-val :lambda-list '(m))
(cl:defmethod anchor_offset-val ((m <neighbor_estimate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:anchor_offset-val is deprecated.  Use dcl_slam-msg:anchor_offset instead.")
  (anchor_offset m))

(cl:ensure-generic-function 'pose_id-val :lambda-list '(m))
(cl:defmethod pose_id-val ((m <neighbor_estimate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:pose_id-val is deprecated.  Use dcl_slam-msg:pose_id instead.")
  (pose_id m))

(cl:ensure-generic-function 'estimate-val :lambda-list '(m))
(cl:defmethod estimate-val ((m <neighbor_estimate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:estimate-val is deprecated.  Use dcl_slam-msg:estimate instead.")
  (estimate m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <neighbor_estimate>) ostream)
  "Serializes a message object of type '<neighbor_estimate>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'receiver_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'estimation_done)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'initialized)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'anchor_offset))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'anchor_offset))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pose_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'pose_id))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'estimate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'estimate))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <neighbor_estimate>) istream)
  "Deserializes a message object of type '<neighbor_estimate>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'receiver_id) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'estimation_done) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'initialized) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'anchor_offset) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'anchor_offset)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pose_id) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pose_id)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'estimate) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'estimate)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<neighbor_estimate>)))
  "Returns string type for a message object of type '<neighbor_estimate>"
  "dcl_slam/neighbor_estimate")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'neighbor_estimate)))
  "Returns string type for a message object of type 'neighbor_estimate"
  "dcl_slam/neighbor_estimate")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<neighbor_estimate>)))
  "Returns md5sum for a message object of type '<neighbor_estimate>"
  "070b606f57d52fcad04bff2934c82ffb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'neighbor_estimate)))
  "Returns md5sum for a message object of type 'neighbor_estimate"
  "070b606f57d52fcad04bff2934c82ffb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<neighbor_estimate>)))
  "Returns full string definition for message of type '<neighbor_estimate>"
  (cl:format cl:nil "# estimate~%Header header~%~%int8 receiver_id~%int8 estimation_done~%int8 initialized~%~%float32[] anchor_offset~%~%int32[] pose_id~%~%float32[] estimate~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'neighbor_estimate)))
  "Returns full string definition for message of type 'neighbor_estimate"
  (cl:format cl:nil "# estimate~%Header header~%~%int8 receiver_id~%int8 estimation_done~%int8 initialized~%~%float32[] anchor_offset~%~%int32[] pose_id~%~%float32[] estimate~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <neighbor_estimate>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'anchor_offset) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pose_id) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'estimate) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <neighbor_estimate>))
  "Converts a ROS message object to a list"
  (cl:list 'neighbor_estimate
    (cl:cons ':header (header msg))
    (cl:cons ':receiver_id (receiver_id msg))
    (cl:cons ':estimation_done (estimation_done msg))
    (cl:cons ':initialized (initialized msg))
    (cl:cons ':anchor_offset (anchor_offset msg))
    (cl:cons ':pose_id (pose_id msg))
    (cl:cons ':estimate (estimate msg))
))
