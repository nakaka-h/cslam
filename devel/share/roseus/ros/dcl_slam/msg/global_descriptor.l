;; Auto-generated. Do not edit!


(when (boundp 'dcl_slam::global_descriptor)
  (if (not (find-package "DCL_SLAM"))
    (make-package "DCL_SLAM"))
  (shadow 'global_descriptor (find-package "DCL_SLAM")))
(unless (find-package "DCL_SLAM::GLOBAL_DESCRIPTOR")
  (make-package "DCL_SLAM::GLOBAL_DESCRIPTOR"))

(in-package "ROS")
;;//! \htmlinclude global_descriptor.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass dcl_slam::global_descriptor
  :super ros::object
  :slots (_header _index _values ))

(defmethod dcl_slam::global_descriptor
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:index __index) 0)
    ((:values __values) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _index (round __index))
   (setq _values __values)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:index
   (&optional __index)
   (if __index (setq _index __index)) _index)
  (:values
   (&optional __values)
   (if __values (setq _values __values)) _values)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _index
    4
    ;; float32[] _values
    (* 4    (length _values)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _index
       (write-long _index s)
     ;; float32[] _values
     (write-long (length _values) s)
     (dotimes (i (length _values))
       (sys::poke (elt _values i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _index
     (setq _index (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32[] _values
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _values (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _values i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get dcl_slam::global_descriptor :md5sum-) "2f823b303f7c022fcb757cc77326186f")
(setf (get dcl_slam::global_descriptor :datatype-) "dcl_slam/global_descriptor")
(setf (get dcl_slam::global_descriptor :definition-)
      "# keyFreature descriptor
Header header

int32 index

float32[] values
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

")



(provide :dcl_slam/global_descriptor "2f823b303f7c022fcb757cc77326186f")


