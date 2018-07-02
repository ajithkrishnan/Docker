FROM tensorflow/tensorflow:latest-gpu

MAINTAINER Ajith Krishnan <ajithkrishnanbm@gmail.com>

# A Dockerfile for the gym-gazebo environment
FROM ubuntu:16.04

#--------------------
# General setup
#--------------------

# Get the dependencies
RUN apt-get update \
    && apt-get install -y xorg-dev \
    libgl1-mesa-dev \
    xvfb \
    libxinerama1 \
    libxcursor1 \
    unzip \
    libglu1-mesa \
    libav-tools \
    python3 \
    python3-pip \
    python3-numpy \
    python3-scipy \
    python3-pyglet \
    python3-setuptools \
    libpq-dev \
    libjpeg-dev \
    wget \
    curl \
    cmake \
    git \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/gym

#--------------------
# Install gym
#--------------------

# # Clone the official gym
# RUN git clone https://github.com/openai/gym
#
# # Install the gym's requirements
# RUN pip install -r gym/requirements.txt
#
# # Install the gym
# RUN ls -l
# RUN pip install -e gym/

# Install from pip
RUN pip3 install gym

# Checks
#RUN python --version
#RUN python -c "import gym"

# Debug
#RUN ls -l /usr/local/gym
#RUN ls -l /usr/local/gym/gym-gazebo
#RUN ls -l /usr/local/gym/gym

# #--------------------
# # Install Gazebo
# #--------------------
RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable xenial main" > /etc/apt/sources.list.d/gazebo-stable.list'

RUN wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -

RUN apt-get update
RUN apt-get install gazebo8 -y
# RUN apt-get install -y libglib2.0-dev libgts-dev libgts-dev
RUN apt-get install -y libgazebo8-dev

# setup environment
EXPOSE 11345

#--------------------
# Install ROS
#--------------------

# RUN apt-get install -y locales-all
# # setup environment
# RUN locale-gen en_US.UTF-8
# ENV LANG en_US.UTF-8

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# setup keys
RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 421C365BD9FF1F717815A3895523BAEEB01FA116

# setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros-latest.list
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
#
# # install ros packages
ENV ROS_DISTRO kinetic
RUN apt-get install cmake gcc g++

# # Install from repositories (for Python 2.7)
#----------------------------
# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    python-rosdep \
    python-rosinstall \
    python-rosinstall-generator \
    python-wstool \
    # python-vcstools \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y \
    ros-kinetic-ros-desktop-full && rm -rf /var/lib/apt/lists/*
#
# RUN apt-get install ros-kinetic-*
# # Install additional dependencies
RUN apt-get install -y ros-kinetic-cv-bridge
RUN apt-get install -y ros-kinetic-robot-state-publisher ros-kinetic-control-msgs

# Install from sources
#----------------------------
# RUN apt-get install python3-rosdep python3-rosinstall-generator python3-wstool \
#           python3-rosinstall build-essential
# or alternatively,
# RUN apt-get update && apt-get install libboost-all-dev -y

RUN pip3 install --upgrade pip
# RUN pip3 install -U rosdep rosinstall_generator wstool rosinstall
# RUN pip3 install rospkg catkin_pkg empy

# bootstrap rosdep
RUN rosdep init \
    && rosdep update

RUN echo "source /opt/ros/kinetic/setup.bash" >> /root/.bashrc
RUN echo "source $(pwd)/devel/setup.bash" >> /root/.bashrc
RUN /bin/bash/ -c "source ~/.bashrc"
RUN /bin/bash/ -c "source /opt/ros/kinetic/setup.bash"

RUN mkdir /root/catkin_ws
WORKDIR /root/catkin_ws
RUN catkin_make --pkg common_utilities
RUN /bin/bash -c "source devel/setup.bash"
RUN catkin_make

EXPOSE 11311
#--------------------
# Entry point
#--------------------

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
