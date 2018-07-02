FROM opencv3-gymgazebo:latest

MAINTAINER Ajith Krishnan

# #--------------------
# # Install dependencies
# #--------------------

RUN mkdir -p ~/catkin_ws/src/dependencies

RUN apt-get update && apt-get install -f -y \
    build-essential \
    ros-kinetic-common-msgs \
    ros-kinetic-diagnostics \
    ros-kinetic-geometry2 && \
    rm -rf /var/lib/apt/lists/*

# RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros-simulation/gazebo_ros_pkgs
# RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros/common_msgs
# RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/vmayoral/dynamic_reconfigure
# RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/erlerobot/orocos_kinematics_dynamics
# RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros/geometry2
# RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros/nodelet_core
# RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros/bond_core
# #--------------------
# # catkin_make
# #--------------------

RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash; cd ~/catkin_ws; catkin_make"

RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros-perception/image_common.git
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros-perception/vision_opencv.git
# RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros/diagnostics
# RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros-controls/ros_control

# #--------------------
# # catkin_make
# #--------------------

RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash; cd ~/catkin_ws; catkin_make"

RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/stonier/ecl_core.git -b release/0.61-indigo-kinetic
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/stonier/ecl_lite.git -b release/0.61-indigo-kinetic
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/stonier/ecl_navigation.git -b release/0.60-indigo-kinetic
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/stonier/ecl_tools.git -b release/0.61-indigo-kinetic
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/turtlebot/turtlebot.git
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/turtlebot/turtlebot_create.git
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/turtlebot/turtlebot_simulator.git
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros-drivers/joystick_drivers.git
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/yujinrobot/kobuki.git -b kinetic
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/yujinrobot/kobuki_core.git -b kinetic
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/erlerobot/kobuki_desktop.git -b kinetic
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/yujinrobot/kobuki_msgs.git -b kinetic

# #--------------------
# # catkin_make
# #--------------------

RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash; cd ~/catkin_ws; catkin_make"


RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros-planning/navigation
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros-perception/perception_pcl.git
# RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros/xacro
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/yujinrobot/yocs_msgs
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/yujinrobot/yujin_ocs

RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros-drivers/driver_common.git
RUN apt-get install -y libftdi-dev
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros-visualization/rqt_robot_dashboard
# installing pcl-dev causes some conflicts
RUN apt-get install -y libpcl-dev; exit 0
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros-perception/pcl_msgs
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros-perception/pcl_conversions
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros-gbp/bfl-release -b release/kinetic/bfl
# # CATKIN_IGNORE kobuki_gazebo_plugins
# RUN cd ~/catkin_ws/src/dependencies/kobuki_desktop/kobuki_gazebo_plugins && touch CATKIN_IGNORE
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/yujinrobot/kobuki_desktop -b devel
# Fix obtained from https://aur.archlinux.org/packages/ros-indigo-kobuki-gazebo-plugins/
# checkout version 0.5.1, which compiles
# RUN cd ~/catkin_ws/src/dependencies/kobuki_desktop && git checkout 3d837662928748cf1e229d2e0b0d98f1031ed4a4
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros-perception/laser_geometry
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros-planning/navigation_msgs
# RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros/roslint
# CATKIN_IGNORE wiimote
# RUN cd ~/catkin_ws/src/dependencies/joystick_drivers/wiimote && touch CATKIN_IGNORE
# # CATKIN_IGNORE yocs_ar_marker_tracking
# RUN cd ~/catkin_ws/src/dependencies/yujin_ocs/yocs_ar_marker_tracking && touch CATKIN_IGNORE
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros-perception/ar_track_alvar
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros/resource_retriever
# CATKIN_IGNORE kobuki test suites
# RUN cd ~/catkin_ws/src/dependencies/kobuki/kobuki_testsuite && touch CATKIN_IGNORE
# RUN cd ~/catkin_ws/src/dependencies/kobuki_desktop/kobuki_qtestsuite && touch CATKIN_IGNORE
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros/robot_state_publisher
RUN cd ~/catkin_ws/src/dependencies && git clone https://github.com/ros/kdl_parser

# #--------------------
# # catkin_make
# #--------------------

RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash; cd ~/catkin_ws; catkin_make"
# Compile the again the workspace
# RUN cd ~/catkin_ws && ./src/catkin/bin/catkin_make_isolated -DPYTHON_VERSION=3.5 \
#         --install -DCMAKE_BUILD_TYPE=Release -DCATKIN_ENABLE_TESTING=OFF


COPY ros_entrypoint.sh /
RUN chmod +x ros_entrypoint.sh
ENTRYPOINT [ "/ros_entrypoint.sh" ]

CMD ["bash"]