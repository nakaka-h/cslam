# 引き継ぎREADME: RACER + DCL-SLAM + CoppeliaSim 統合実験

この資料は、次の研究生が本研究環境を再現できるように作成した引き継ぎ用READMEです。

## 1. 研究概要

本研究は、以下の3要素をROSで接続した統合システムです。

- RACER (分散協調探索)
- DCL-SLAM (分散協調LiDAR SLAM)
- CoppeliaSim (シミュレーション環境)

要点: RACERとDCL-SLAMを独立動作させた上で、CoppeliaSim経由で同時実行可能な構成にしています。

## 2. 参照元リポジトリ

単体動作確認は必ず公式READMEにも従ってください。
launchファイルなどをいじる必要があるので、別でワークスペースを作って動作確認することをおすすめします。

- RACER: https://github.com/Robotics-STAR-Lab/RACER/tree/main
- DCL-SLAM: https://github.com/zhongshp/DCL-SLAM/tree/master

DCL-SLAMはREADMEに従ってもエラーが出ます。以下のサイトを参考にしてください。
https://blog.csdn.net/qq_46842599/article/details/146329373

## 3. ワークスペース構成

このPCでは、次の2ワークスペースを分離して使っています。

- `/home/hiroki/racer_ws` (RACER系)
- `/home/hiroki/cslam_ws` (DCL-SLAM系)

それぞれのコードを書き換えるときワークスペースを切り替える必要があります。
統合できたら楽だけど怖いのでやってません。
※usernameは適宜変更してください。不具合は起こらないと思います。

## 4. 前提環境

- Ubuntu 20.04
- ROS Noetic
- CoppeliaSim

RACER側の主な依存:

- NLopt v2.7.1
- LKH-3.0.6 (`/usr/local/bin/LKH` に配置)
- `libarmadillo-dev`

DCL-SLAM側の主な依存:

- `cmake`, `libboost-all-dev`, `python-wstool`, `python-catkin-tools`
- GTSAM系依存 (DCL-SLAM READMEに準拠)
- livox_ros_driver

## 5. ビルド

### 5.1 RACERワークスペース

```bash
cd /home/hiroki/racer_ws
catkin build
source devel/setup.bash
```

### 5.2 DCL-SLAMワークスペース

```bash
cd /home/hiroki/cslam_ws
catkin build
source devel/setup.bash
```

注:

- DCL-SLAM導入手順は公式README準拠 (wstoolで依存取得)。
- どちらかのWSでビルドエラーが出たら、先に単体起動確認を行ってから統合起動へ進む。

## 6. 単体追試手順

### 6.1 RACER単体

GithubのREADME通りに実行するとできます。

### 6.2 DCL-SLAM単体

https://blog.csdn.net/qq_46842599/article/details/146329373
このサイトを参考にしてもどうしてもできない場合、`home/hiroki/cslam_ws/src/DCL-SLAM/launch`の`run.launch`を複製し
パラメータを変更し、`roslaunch dcl_slam {複製したファイル名}.launch`を実行してください。

変更箇所
- /use_sim_time -> false
- set_lio_type -> 1
- number_of_robots -> 3
- rvizのconfigファイルパス -> -d $(find dcl_slam)/config/dcl_rviz.rviz
- ロボットb,cのsingle_ugv.launchの起動ノードのコメントアウトを解除
- 全ロボットのbridge.launchの起動ノードをコメントアウト
- <arg name="SYSU_bag" value="$(env HOME)/cslam_ws/data/S3E_Dormitory_1.bag"/>のコメントアウトを解除し、再生するbagファイル名を必要に応じて変更
- <node name="player2" pkg="rosbag" type="play" output="screen" args="-r 1 -q -d 8 $(arg SYSU_bag)"/>のコメントアウトを解除

## 7. 本研究の統合追試手順 (RACER + DCL-SLAM + CoppeliaSim)

以下は、現状運用している手順です。

### 7.1 事前起動
ターミナル（計6つのターミナルが必要なためTerminatorの使用推奨）を起動し、
1. ターミナルAで`roscore` を起動
2. ターミナルBで`coppelia`でcoppeliasimを起動し、`.ttt` シーンを開く

シーン一覧:
- `/home/hiroki/cslam_ws/scene/slam_dynamic_1_velodyne.ttt` 最終実験で用いたシーン
- `/home/hiroki/cslam_ws/scene/slam_dynamic_1_velodyne_sub.ttt` コードを書き換えたり検証用
- `/home/hiroki/cslam_ws/scene/slam_dynamic_1.ttt` 一方向のみのLidar使用
- `/home/hiroki/cslam_ws/scene/slam_dynamic_2.ttt` 上記の２台バージョン

### 7.2 RACER側起動

ターミナルC:

```bash
cd /home/hiroki/racer_ws
source devel/setup.bash && roslaunch exploration_manager rviz.launch
```

ターミナルD:

```bash
cd /home/hiroki/racer_ws
source devel/setup.bash && roslaunch exploration_manager swarm_exploration.launch
```

### 7.3 DCL-SLAM側起動

ターミナルE:

```bash
cd /home/hiroki/cslam_ws
source devel/setup.bash
roslaunch dcl_slam run.launch uncertainty_threshold:=1.4e-1
```

ターミナルF:

```bash
cd /home/hiroki/cslam_ws
source devel/setup.bash
rosrun dcl_slam compute_ate.py _robot_prefix:=a
```

## 8. 実験時に触ることが多いファイル

RACER側:

- `/home/hiroki/racer_ws/src/RACER/swarm_exploration/exploration_manager/launch/swarm_exploration.launch`
- `/home/hiroki/racer_ws/src/RACER/coppeliasim_bridge/launch/so3_control_bridge.launch`

DCL-SLAM側:

- `/home/hiroki/cslam_ws/src/DCL-SLAM/launch/run.launch`
- `/home/hiroki/cslam_ws/src/DCL-SLAM/scripts/compute_ate.py`
- `/home/hiroki/cslam_ws/src/cslam_coppelia_bridge/launch/bridge.launch`

## 9. 典型トラブルと確認ポイント

### 9.1 ノードが起動しない

- cppファイルなどを書き換えた場合`catkin build`済みか確認
- `source devel/setup.bash` 済みか確認

### 9.2 RACERが探索開始しない

- RVizで2D Nav Goalを送っているか確認
- `swarm_exploration.launch` の `odom_prefix` と実トピック整合を確認

### 9.3 DCL-SLAMの推定が不安定

- `uncertainty_threshold` を調整
- CoppeliaSim側センサ出力トピック名と `run.launch` / `bridge.launch` のremap整合を確認

### 9.4 ATEが出ない

- `/a` プレフィックスの軌跡がpublishされているか確認
- `compute_ate.py _robot_prefix:=a` の対象ロボット名が一致しているか確認

## 10. 引き継ぎメモ

- Coppeliasim（特にLuaスクリプト）がかなり厄介なのではやめに慣れたほうがいいです。
- 統合時の不具合は、トピック名ミスマッチ、TF不整合、起動順依存の3点が多い。
- 今後の主な展望は複数機実装とより大きな環境での実行だが、Coppeliasimのシミュレーション回るスピードが今でもだいぶ厳しいので、このLinuxをSSDに移行したり研究室に眠る100万PCを掘り起こしたりしてください。すみませんがよろしくおねがいします。
