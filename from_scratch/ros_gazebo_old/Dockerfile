FROM tensorflow_and_cuda:latest

MAINTAINER Ajith Krishnan

#---------------
# INSTALL DEPENDENCIES
#---------------

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
    python \
    python-pip \
    # python3-numpy \
    # python3-scipy \
    # python3-pyglet \
    python3-setuptools \
    libpq-dev \
    libjpeg-dev \
    wget \
    curl \
    cmake \
    git \
    mesa-utils \
 && apt-get clean \
&& rm -rf /var/lib/apt/lists/*

#---------------
# INSTALL GAZEBO
#---------------

RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable xenial main" > /etc/apt/sources.list.d/gazebo-stable.list'

RUN wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -

RUN apt-get update && apt-get install -y \
    gazebo9 \
    libgazebo9-dev \
&& rm -rf /var/lib/apt/lists/*
# RUN apt-get install -y libglib2.0-dev libgts-dev libgts-dev

# setup environment
EXPOSE 11345

#---------------
# INSTALL ROS
#---------------

# install packages
RUN apt-get update && apt-get install -q -y \
    dirmngr \
    gnupg2 \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# setup keys
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 421C365BD9FF1F717815A3895523BAEEB01FA116

# setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    python-rosdep \
    python-rosinstall \
    python-vcstools \
    && rm -rf /var/lib/apt/lists/*

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# bootstrap rosdep
RUN rosdep init \
    && rosdep update

# install ros packages
ENV ROS_DISTRO kinetic
RUN apt-get update && apt-get install -y \
    ros-kinetic-ros-core=1.3.2-0* \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y \
    ros-kinetic-ros-base=1.3.2-0* \
&& rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y \
    ros-kinetic-robot=1.3.2-0* \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y \
    ros-kinetic-desktop=1.3.2-0* \
    && rm -rf /var/lib/apt/lists/*

# setup entrypoint
#COPY ./ros_entrypoint.sh /

# setup environment
EXPOSE 11311

RUN mkdir -p /root/catkin_ws/src

#ENTRYPOINT ["/ros_entrypoint.sh"]

CMD [ "bash" ]