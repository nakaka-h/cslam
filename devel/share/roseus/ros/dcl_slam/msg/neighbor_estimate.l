;; Auto-generated. Do not edit!


(when (boundp 'dcl_slam::neighbor_estimate)
  (if (not (find-package "DCL_SLAM"))
    (make-package "DCL_SLAM"))
  (shadow 'neighbor_estimate (find-package "DCL_SLAM")))
(unless (find-package "DCL_SLAM::NEIGHBOR_ESTIMATE")
  (make-package "DCL_SLAM::NEIGHBOR_ESTIMATE"))

(in-package "ROS")
;;//! \htmlinclude neighbor_estimate.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass dcl_slam::neighbor_estimate
  :super ros::object
  :slots (_header _receiver_id _estimation_done _initialized _anchor_offset _pose_id _estimate ))

(defmethod dcl_slam::neighbor_estimate
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:receiver_id __receiver_id) 0)
    ((:estimation_done __estimation_done) 0)
    ((:initialized __initialized) 0)
    ((:anchor_offset __anchor_offset) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:pose_id __pose_id) (make-array 0 :initial-element 0 :element-type :integer))
    ((:estimate __estimate) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _receiver_id (round __receiver_id))
   (setq _estimation_done (round __estimation_done))
   (setq _initialized (round __initialized))
   (setq _anchor_offset __anchor_offset)
   (setq _pose_id __pose_id)
   (setq _estimate __estimate)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:receiver_id
   (&optional __receiver_id)
   (if __receiver_id (setq _receiver_id __receiver_id)) _receiver_id)
  (:estimation_done
   (&optional __estimation_done)
   (if __estimation_done (setq _estimation_done __estimation_done)) _estimation_done)
  (:initialized
   (&optional __initialized)
   (if __initialized (setq _initialized __initialized)) _initialized)
  (:anchor_offset
   (&optional __anchor_offset)
   (if __anchor_offset (setq _anchor_offset __anchor_offset)) _anchor_offset)
  (:pose_id
   (&optional __pose_id)
   (if __pose_id (setq _pose_id __pose_id)) _pose_id)
  (:estimate
   (&optional __estimate)
   (if __estimate (setq _estimate __estimate)) _estimate)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int8 _receiver_id
    1
    ;; int8 _estimation_done
    1
    ;; int8 _initialized
    1
    ;; float32[] _anchor_offset
    (* 4    (length _anchor_offset)) 4
    ;; int32[] _pose_id
    (* 4    (length _pose_id)) 4
    ;; float32[] _estimate
    (* 4    (length _estimate)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int8 _receiver_id
       (write-byte _receiver_id s)
     ;; int8 _estimation_done
       (write-byte _estimation_done s)
     ;; int8 _initialized
       (write-byte _initialized s)
     ;; float32[] _anchor_offset
     (write-long (length _anchor_offset) s)
     (dotimes (i (length _anchor_offset))
       (sys::poke (elt _anchor_offset i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int32[] _pose_id
     (write-long (length _pose_id) s)
     (dotimes (i (length _pose_id))
       (write-long (elt _pose_id i) s)
       )
     ;; float32[] _estimate
     (write-long (length _estimate) s)
     (dotimes (i (length _estimate))
       (sys::poke (elt _estimate i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int8 _receiver_id
     (setq _receiver_id (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _receiver_id 127) (setq _receiver_id (- _receiver_id 256)))
   ;; int8 _estimation_done
     (setq _estimation_done (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _estimation_done 127) (setq _estimation_done (- _estimation_done 256)))
   ;; int8 _initialized
     (setq _initialized (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _initialized 127) (setq _initialized (- _initialized 256)))
   ;; float32[] _anchor_offset
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _anchor_offset (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _anchor_offset i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; int32[] _pose_id
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pose_id (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _pose_id i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; float32[] _estimate
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _estimate (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _estimate i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get dcl_slam::neighbor_estimate :md5sum-) "070b606f57d52fcad04bff2934c82ffb")
(setf (get dcl_slam::neighbor_estimate :datatype-) "dcl_slam/neighbor_estimate")
(setf (get dcl_slam::neighbor_estimate :definition-)
      "# estimate
Header header

int8 receiver_id
int8 estimation_done
int8 initialized

float32[] anchor_offset

int32[] pose_id

float32[] estimate
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



(provide :dcl_slam/neighbor_estimate "070b606f57d52fcad04bff2934c82ffb")


