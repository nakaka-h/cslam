; Auto-generated. Do not edit!


(cl:in-package dcl_slam-msg)


;//! \htmlinclude global_descriptor.msg.html

(cl:defclass <global_descriptor> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (index
    :reader index
    :initarg :index
    :type cl:integer
    :initform 0)
   (values
    :reader values
    :initarg :values
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass global_descriptor (<global_descriptor>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <global_descriptor>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'global_descriptor)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dcl_slam-msg:<global_descriptor> is deprecated: use dcl_slam-msg:global_descriptor instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <global_descriptor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:header-val is deprecated.  Use dcl_slam-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'index-val :lambda-list '(m))
(cl:defmethod index-val ((m <global_descriptor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:index-val is deprecated.  Use dcl_slam-msg:index instead.")
  (index m))

(cl:ensure-generic-function 'values-val :lambda-list '(m))
(cl:defmethod values-val ((m <global_descriptor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:values-val is deprecated.  Use dcl_slam-msg:values instead.")
  (values m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <global_descriptor>) ostream)
  "Serializes a message object of type '<global_descriptor>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'values))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'values))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <global_descriptor>) istream)
  "Deserializes a message object of type '<global_descriptor>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'index) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'values) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'values)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<global_descriptor>)))
  "Returns string type for a message object of type '<global_descriptor>"
  "dcl_slam/global_descriptor")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'global_descriptor)))
  "Returns string type for a message object of type 'global_descriptor"
  "dcl_slam/global_descriptor")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<global_descriptor>)))
  "Returns md5sum for a message object of type '<global_descriptor>"
  "2f823b303f7c022fcb757cc77326186f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'global_descriptor)))
  "Returns md5sum for a message object of type 'global_descriptor"
  "2f823b303f7c022fcb757cc77326186f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<global_descriptor>)))
  "Returns full string definition for message of type '<global_descriptor>"
  (cl:format cl:nil "# keyFreature descriptor~%Header header~%~%int32 index~%~%float32[] values~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'global_descriptor)))
  "Returns full string definition for message of type 'global_descriptor"
  (cl:format cl:nil "# keyFreature descriptor~%Header header~%~%int32 index~%~%float32[] values~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <global_descriptor>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'values) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <global_descriptor>))
  "Converts a ROS message object to a list"
  (cl:list 'global_descriptor
    (cl:cons ':header (header msg))
    (cl:cons ':index (index msg))
    (cl:cons ':values (values msg))
))
