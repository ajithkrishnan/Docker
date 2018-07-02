FROM openai-gym:latest

#run ls -l /opt/ros/
run . /opt/ros/kinetic/setup.sh && cd ~/catkin_ws && \
              /opt/ros/kinetic/bin/catkin_make


run echo ". /opt/ros/kinetic/setup.sh; echo \"hallo kessel\"; exec $@"> /entrypoint.sh; chmod u+x /entrypoint.sh

#entrypoint /entrypoint.sh

#entrypoint "/test.sh"
#CMD ["/bin/bash -l -i"]