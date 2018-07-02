FROM ros-gazebo:latest

MAINTAINER Ajith Krishnan   

#--------------------
# Install gym
#--------------------

RUN mkdir -p /usr/local/gym

RUN pip3 install gym

#--------------------
# Install ROS-Kinetic-Dependencies
#--------------------
RUN pip3 install rospkg catkin_pkg numpy
RUN apt-get update && apt-get install -y --no-install-recommends \
    libusb-dev libftdi-dev \
    python3-defusedxml python3-vcstool \
    ros-kinetic-octomap-msgs        \
    ros-kinetic-joy                 \
    ros-kinetic-geodesy             \
    ros-kinetic-octomap-ros         \
    ros-kinetic-control-toolbox     \
    ros-kinetic-pluginlib	       \
    ros-kinetic-trajectory-msgs     \
    ros-kinetic-control-msgs	       \
    ros-kinetic-std-srvs 	       \
    ros-kinetic-nodelet	       \
    ros-kinetic-urdf		       \
    ros-kinetic-rviz		       \
    ros-kinetic-kdl-conversions     \
    ros-kinetic-eigen-conversions   \
    ros-kinetic-tf2-sensor-msgs     \
    ros-kinetic-pcl-ros \
    ros-kinetic-navigation && \
  rm -rf /var/lib/apt/lists/*

# #--------------------
# # catkin_make
# #--------------------

RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash; cd ~/catkin_ws; catkin_make"

# #--------------------
# # Install OpenCV
# #--------------------

# Compile OpenCV from sources
RUN cd ~/ && \
    git clone https://github.com/opencv/opencv.git && \
    git clone https://github.com/opencv/opencv_contrib.git && \
    cd opencv && mkdir build && cd build && \
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON .. && \
    make -j$(nproc --all) && make install 

RUN /bin/bash -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
RUN ldconfig

#--------------------
# Install Sophus
#--------------------
RUN cd ~/ && \
    git clone https://github.com/stonier/sophus -b indigo && \
    cd sophus && mkdir build && cd build && cmake .. && make

RUN cd ~/sophus/build && make install

#--------------------
# Install baselines
#--------------------
RUN pip3 install baselines netifaces

#--------------------
# Install Gym-Gazebo
#--------------------
RUN cd ~/ && \ 
    git clone https://github.com/erlerobot/gym-gazebo && \
    cd gym-gazebo && \
    pip3 install -e .

COPY ros_entrypoint.sh /
RUN chmod +x ros_entrypoint.sh
ENTRYPOINT [ "/ros_entrypoint.sh" ]

CMD ["bash"]
