;; Auto-generated. Do not edit!


(when (boundp 'dcl_slam::uncertainty_point)
  (if (not (find-package "DCL_SLAM"))
    (make-package "DCL_SLAM"))
  (shadow 'uncertainty_point (find-package "DCL_SLAM")))
(unless (find-package "DCL_SLAM::UNCERTAINTY_POINT")
  (make-package "DCL_SLAM::UNCERTAINTY_POINT"))

(in-package "ROS")
;;//! \htmlinclude uncertainty_point.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass dcl_slam::uncertainty_point
  :super ros::object
  :slots (_position _uncertainty_index ))

(defmethod dcl_slam::uncertainty_point
  (:init
   (&key
    ((:position __position) (instance geometry_msgs::Point :init))
    ((:uncertainty_index __uncertainty_index) 0.0)
    )
   (send-super :init)
   (setq _position __position)
   (setq _uncertainty_index (float __uncertainty_index))
   self)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:uncertainty_index
   (&optional __uncertainty_index)
   (if __uncertainty_index (setq _uncertainty_index __uncertainty_index)) _uncertainty_index)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _position
    (send _position :serialization-length)
    ;; float64 _uncertainty_index
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _position
       (send _position :serialize s)
     ;; float64 _uncertainty_index
       (sys::poke _uncertainty_index (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; float64 _uncertainty_index
     (setq _uncertainty_index (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get dcl_slam::uncertainty_point :md5sum-) "3b0f3eb68d085982d1550926c4bc6aa6")
(setf (get dcl_slam::uncertainty_point :datatype-) "dcl_slam/uncertainty_point")
(setf (get dcl_slam::uncertainty_point :definition-)
      "geometry_msgs/Point position
float64 uncertainty_index

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :dcl_slam/uncertainty_point "3b0f3eb68d085982d1550926c4bc6aa6")


