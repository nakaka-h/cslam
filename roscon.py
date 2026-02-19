from rosbags.rosbag2 import Reader
from rosbags.serde import deserialize_cdr
from rosbags.typesys import Stores, get_typestore

typestore = get_typestore(Stores.ROS2_FOXY)

with Reader("/home/hiroki/cslam_ws/data/S3E_Playground_1") as reader:
    connections = [x for x in reader.connections if x.topic == 'Imu']
    for connection, timestamp, rawdata in reader.messages(connections=connections):
        #msg = deserialize_cdr(rawdata, connection.msgtype)
        msg = typestore.deserialize_cdr(rawdata, connection.msgtype)
    print(msg.header.frame_id)