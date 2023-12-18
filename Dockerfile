FROM ros:kinetic

# Install pip
RUN apt update && apt install -y \
    python-pip \
    screen \
    vim \
    nano \
    net-tools \
    iputils-ping \
    git \
    wget
    

RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
RUN python get-pip.py
RUN pip install --upgrade "pip < 21.0"


RUN pip install catkin_tools

#For raspberry
RUN pip install RPi.GPIO

RUN pip install gpiozero==1.6.2
#For saving config msgs
RUN apt-get install ros-kinetic-rospy-message-converter


# Initialize the catkin workspace
WORKDIR /ros_ws/src

#RUN git clone https://github.com/ReconCycle/robot_module_msgs.git

#--branch ros1_devel
RUN git clone  https://github.com/ReconCycle/digital_interface_msgs.git
RUN git clone  https://github.com/ReconCycle/raspi_ros.git
#RUN git --git-dir=/ros_ws/src/digital_interface_msgs/.git rev-parse --short HEAD
#RUN git --git-dir=/ros_ws/src/raspi_ros/.git rev-parse --short HEAD
#RUN git --git-dir=/ros_ws/src/robot_module_msgs/.git rev-parse --short HEAD




WORKDIR /ros_ws
RUN catkin init
# Source stuff
SHELL ["/bin/bash", "-c"] 


RUN source /opt/ros/$ROS_DISTRO/setup.bash  && catkin build

RUN source devel/setup.bash


# Clear apt cache.
RUN apt clean

# Set the workspace variable
ENV ROS_WORKSPACE=/ros_ws

# We source the ros_ws workspace as well when entering the container
RUN cp /ros_entrypoint.sh /tmp_entrypoint.sh
RUN (head -n -1 /ros_entrypoint.sh && echo 'source "/ros_ws/devel/setup.bash"' && tail -n 1 /ros_entrypoint.sh;) > /tmp_entrypoint.sh
RUN mv /tmp_entrypoint.sh /ros_entrypoint.sh




# Add a file to help out sourcing the workspaces
RUN echo "source \"/opt/ros/$ROS_DISTRO/setup.bash\"" >> /source_ws.sh
RUN echo "source \"/ros_ws/devel/setup.bash\"" >> /source_ws.sh


#Set startup file
RUN mkdir -p $HOME/reconcycle_config 
COPY dynamic_startup.sh $HOME/reconcycle_config/ 
#RUN chmod +x $HOME/reconcycle_config/dynamic_startup.sh
#&& touch $HOME/reconcycle_config/dynamic_startup.sh  && chmod +x $HOME/reconcycle_config/dynamic_startup.sh  && echo "echo \"No dynamic startup!\"" >> $HOME/reconcycle_config/dynamic_startup.sh && echo "exec \"$@\"" >> $HOME/reconcycle_config/dynamic_startup.sh 




ENTRYPOINT ["/reconcycle_config/dynamic_startup.sh"]
