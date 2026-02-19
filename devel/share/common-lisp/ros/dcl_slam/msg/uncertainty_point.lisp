; Auto-generated. Do not edit!


(cl:in-package dcl_slam-msg)


;//! \htmlinclude uncertainty_point.msg.html

(cl:defclass <uncertainty_point> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (uncertainty_index
    :reader uncertainty_index
    :initarg :uncertainty_index
    :type cl:float
    :initform 0.0))
)

(cl:defclass uncertainty_point (<uncertainty_point>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <uncertainty_point>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'uncertainty_point)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dcl_slam-msg:<uncertainty_point> is deprecated: use dcl_slam-msg:uncertainty_point instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <uncertainty_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:position-val is deprecated.  Use dcl_slam-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'uncertainty_index-val :lambda-list '(m))
(cl:defmethod uncertainty_index-val ((m <uncertainty_point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dcl_slam-msg:uncertainty_index-val is deprecated.  Use dcl_slam-msg:uncertainty_index instead.")
  (uncertainty_index m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <uncertainty_point>) ostream)
  "Serializes a message object of type '<uncertainty_point>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'uncertainty_index))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <uncertainty_point>) istream)
  "Deserializes a message object of type '<uncertainty_point>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'uncertainty_index) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<uncertainty_point>)))
  "Returns string type for a message object of type '<uncertainty_point>"
  "dcl_slam/uncertainty_point")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'uncertainty_point)))
  "Returns string type for a message object of type 'uncertainty_point"
  "dcl_slam/uncertainty_point")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<uncertainty_point>)))
  "Returns md5sum for a message object of type '<uncertainty_point>"
  "3b0f3eb68d085982d1550926c4bc6aa6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'uncertainty_point)))
  "Returns md5sum for a message object of type 'uncertainty_point"
  "3b0f3eb68d085982d1550926c4bc6aa6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<uncertainty_point>)))
  "Returns full string definition for message of type '<uncertainty_point>"
  (cl:format cl:nil "geometry_msgs/Point position~%float64 uncertainty_index~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'uncertainty_point)))
  "Returns full string definition for message of type 'uncertainty_point"
  (cl:format cl:nil "geometry_msgs/Point position~%float64 uncertainty_index~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <uncertainty_point>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <uncertainty_point>))
  "Converts a ROS message object to a list"
  (cl:list 'uncertainty_point
    (cl:cons ':position (position msg))
    (cl:cons ':uncertainty_index (uncertainty_index msg))
))
