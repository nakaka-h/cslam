// Auto-generated. Do not edit!

// (in-package dcl_slam.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class loop_info {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.robot0 = null;
      this.robot1 = null;
      this.index0 = null;
      this.index1 = null;
      this.noise = null;
      this.init_yaw = null;
      this.pose0 = null;
      this.pose1 = null;
      this.scan_cloud = null;
      this.pose_between = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('robot0')) {
        this.robot0 = initObj.robot0
      }
      else {
        this.robot0 = 0;
      }
      if (initObj.hasOwnProperty('robot1')) {
        this.robot1 = initObj.robot1
      }
      else {
        this.robot1 = 0;
      }
      if (initObj.hasOwnProperty('index0')) {
        this.index0 = initObj.index0
      }
      else {
        this.index0 = 0;
      }
      if (initObj.hasOwnProperty('index1')) {
        this.index1 = initObj.index1
      }
      else {
        this.index1 = 0;
      }
      if (initObj.hasOwnProperty('noise')) {
        this.noise = initObj.noise
      }
      else {
        this.noise = 0.0;
      }
      if (initObj.hasOwnProperty('init_yaw')) {
        this.init_yaw = initObj.init_yaw
      }
      else {
        this.init_yaw = 0;
      }
      if (initObj.hasOwnProperty('pose0')) {
        this.pose0 = initObj.pose0
      }
      else {
        this.pose0 = new geometry_msgs.msg.Transform();
      }
      if (initObj.hasOwnProperty('pose1')) {
        this.pose1 = initObj.pose1
      }
      else {
        this.pose1 = new geometry_msgs.msg.Transform();
      }
      if (initObj.hasOwnProperty('scan_cloud')) {
        this.scan_cloud = initObj.scan_cloud
      }
      else {
        this.scan_cloud = new sensor_msgs.msg.PointCloud2();
      }
      if (initObj.hasOwnProperty('pose_between')) {
        this.pose_between = initObj.pose_between
      }
      else {
        this.pose_between = new geometry_msgs.msg.Transform();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type loop_info
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [robot0]
    bufferOffset = _serializer.int32(obj.robot0, buffer, bufferOffset);
    // Serialize message field [robot1]
    bufferOffset = _serializer.int32(obj.robot1, buffer, bufferOffset);
    // Serialize message field [index0]
    bufferOffset = _serializer.int32(obj.index0, buffer, bufferOffset);
    // Serialize message field [index1]
    bufferOffset = _serializer.int32(obj.index1, buffer, bufferOffset);
    // Serialize message field [noise]
    bufferOffset = _serializer.float32(obj.noise, buffer, bufferOffset);
    // Serialize message field [init_yaw]
    bufferOffset = _serializer.int32(obj.init_yaw, buffer, bufferOffset);
    // Serialize message field [pose0]
    bufferOffset = geometry_msgs.msg.Transform.serialize(obj.pose0, buffer, bufferOffset);
    // Serialize message field [pose1]
    bufferOffset = geometry_msgs.msg.Transform.serialize(obj.pose1, buffer, bufferOffset);
    // Serialize message field [scan_cloud]
    bufferOffset = sensor_msgs.msg.PointCloud2.serialize(obj.scan_cloud, buffer, bufferOffset);
    // Serialize message field [pose_between]
    bufferOffset = geometry_msgs.msg.Transform.serialize(obj.pose_between, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type loop_info
    let len;
    let data = new loop_info(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [robot0]
    data.robot0 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [robot1]
    data.robot1 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [index0]
    data.index0 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [index1]
    data.index1 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [noise]
    data.noise = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [init_yaw]
    data.init_yaw = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [pose0]
    data.pose0 = geometry_msgs.msg.Transform.deserialize(buffer, bufferOffset);
    // Deserialize message field [pose1]
    data.pose1 = geometry_msgs.msg.Transform.deserialize(buffer, bufferOffset);
    // Deserialize message field [scan_cloud]
    data.scan_cloud = sensor_msgs.msg.PointCloud2.deserialize(buffer, bufferOffset);
    // Deserialize message field [pose_between]
    data.pose_between = geometry_msgs.msg.Transform.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += sensor_msgs.msg.PointCloud2.getMessageSize(object.scan_cloud);
    return length + 192;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dcl_slam/loop_info';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f1431bfa4497640b0a25a7c95cc6acc6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Loop Info
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
    # contents of the "fields" array.
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new loop_info(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.robot0 !== undefined) {
      resolved.robot0 = msg.robot0;
    }
    else {
      resolved.robot0 = 0
    }

    if (msg.robot1 !== undefined) {
      resolved.robot1 = msg.robot1;
    }
    else {
      resolved.robot1 = 0
    }

    if (msg.index0 !== undefined) {
      resolved.index0 = msg.index0;
    }
    else {
      resolved.index0 = 0
    }

    if (msg.index1 !== undefined) {
      resolved.index1 = msg.index1;
    }
    else {
      resolved.index1 = 0
    }

    if (msg.noise !== undefined) {
      resolved.noise = msg.noise;
    }
    else {
      resolved.noise = 0.0
    }

    if (msg.init_yaw !== undefined) {
      resolved.init_yaw = msg.init_yaw;
    }
    else {
      resolved.init_yaw = 0
    }

    if (msg.pose0 !== undefined) {
      resolved.pose0 = geometry_msgs.msg.Transform.Resolve(msg.pose0)
    }
    else {
      resolved.pose0 = new geometry_msgs.msg.Transform()
    }

    if (msg.pose1 !== undefined) {
      resolved.pose1 = geometry_msgs.msg.Transform.Resolve(msg.pose1)
    }
    else {
      resolved.pose1 = new geometry_msgs.msg.Transform()
    }

    if (msg.scan_cloud !== undefined) {
      resolved.scan_cloud = sensor_msgs.msg.PointCloud2.Resolve(msg.scan_cloud)
    }
    else {
      resolved.scan_cloud = new sensor_msgs.msg.PointCloud2()
    }

    if (msg.pose_between !== undefined) {
      resolved.pose_between = geometry_msgs.msg.Transform.Resolve(msg.pose_between)
    }
    else {
      resolved.pose_between = new geometry_msgs.msg.Transform()
    }

    return resolved;
    }
};

module.exports = loop_info;
