# This script allows you to start ROS/Gazebo on a remote server
# with X11 and OpenGL (mesa) in nvidia-docker 1
# There is NO Nvidia OpenGL support right now

#For X11 through docker/ssh
XAUTH=$HOME/.Xauthority
touch $XAUTH
echo $XAUTH

nvidia-docker run -it \
  --env DISPLAY=$DISPLAY \
  --env QT_X11_NO_MITSHM=1 \
  --volume "/etc/localtime/:/etc/localtime:ro" \
  --volume $XAUTH:/root/.Xauthority \
  --volume "/tmp/.X11-unix:/tmp/.X11-unix" \
  --volume "/tmp/.gazebo/:/root/.gazebo/" \
  --volume "/dev/input:/dev/input" \
  --net=host \
  --privileged \
  --rm=true \
sim_ahl:cuda_384.111 /bin/bash -c "source auto_start.sh $SIMULATION_APPLICATION $SIMULATION_LAUNCHFILE"

