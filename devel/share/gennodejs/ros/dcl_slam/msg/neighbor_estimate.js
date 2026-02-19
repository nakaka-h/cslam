// Auto-generated. Do not edit!

// (in-package dcl_slam.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class neighbor_estimate {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.receiver_id = null;
      this.estimation_done = null;
      this.initialized = null;
      this.anchor_offset = null;
      this.pose_id = null;
      this.estimate = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('receiver_id')) {
        this.receiver_id = initObj.receiver_id
      }
      else {
        this.receiver_id = 0;
      }
      if (initObj.hasOwnProperty('estimation_done')) {
        this.estimation_done = initObj.estimation_done
      }
      else {
        this.estimation_done = 0;
      }
      if (initObj.hasOwnProperty('initialized')) {
        this.initialized = initObj.initialized
      }
      else {
        this.initialized = 0;
      }
      if (initObj.hasOwnProperty('anchor_offset')) {
        this.anchor_offset = initObj.anchor_offset
      }
      else {
        this.anchor_offset = [];
      }
      if (initObj.hasOwnProperty('pose_id')) {
        this.pose_id = initObj.pose_id
      }
      else {
        this.pose_id = [];
      }
      if (initObj.hasOwnProperty('estimate')) {
        this.estimate = initObj.estimate
      }
      else {
        this.estimate = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type neighbor_estimate
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [receiver_id]
    bufferOffset = _serializer.int8(obj.receiver_id, buffer, bufferOffset);
    // Serialize message field [estimation_done]
    bufferOffset = _serializer.int8(obj.estimation_done, buffer, bufferOffset);
    // Serialize message field [initialized]
    bufferOffset = _serializer.int8(obj.initialized, buffer, bufferOffset);
    // Serialize message field [anchor_offset]
    bufferOffset = _arraySerializer.float32(obj.anchor_offset, buffer, bufferOffset, null);
    // Serialize message field [pose_id]
    bufferOffset = _arraySerializer.int32(obj.pose_id, buffer, bufferOffset, null);
    // Serialize message field [estimate]
    bufferOffset = _arraySerializer.float32(obj.estimate, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type neighbor_estimate
    let len;
    let data = new neighbor_estimate(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [receiver_id]
    data.receiver_id = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [estimation_done]
    data.estimation_done = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [initialized]
    data.initialized = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [anchor_offset]
    data.anchor_offset = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [pose_id]
    data.pose_id = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [estimate]
    data.estimate = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 4 * object.anchor_offset.length;
    length += 4 * object.pose_id.length;
    length += 4 * object.estimate.length;
    return length + 15;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dcl_slam/neighbor_estimate';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '070b606f57d52fcad04bff2934c82ffb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # estimate
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new neighbor_estimate(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.receiver_id !== undefined) {
      resolved.receiver_id = msg.receiver_id;
    }
    else {
      resolved.receiver_id = 0
    }

    if (msg.estimation_done !== undefined) {
      resolved.estimation_done = msg.estimation_done;
    }
    else {
      resolved.estimation_done = 0
    }

    if (msg.initialized !== undefined) {
      resolved.initialized = msg.initialized;
    }
    else {
      resolved.initialized = 0
    }

    if (msg.anchor_offset !== undefined) {
      resolved.anchor_offset = msg.anchor_offset;
    }
    else {
      resolved.anchor_offset = []
    }

    if (msg.pose_id !== undefined) {
      resolved.pose_id = msg.pose_id;
    }
    else {
      resolved.pose_id = []
    }

    if (msg.estimate !== undefined) {
      resolved.estimate = msg.estimate;
    }
    else {
      resolved.estimate = []
    }

    return resolved;
    }
};

module.exports = neighbor_estimate;
