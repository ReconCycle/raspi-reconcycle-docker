# raspi-reconcycle-docker
Standalone repository and instructions for the custom ros docker used on a raspbeerypi in the reconcycle projet


## Build docker image

```sh
$ docker build -t raspi:active .
$ docker build -t raspi:devel .
```


# Develope

```sh 
$ docker run -it -v /home/ubuntu/catkin_ws/src:/ros_ws/src --device /dev/mem --privileged --name ros1_devel raspi:devel
$ catkin build
$ source /source_ws.sh
$ export ROS_MASTER_URI=http://Rok-PC:11311/
```

# Use docker

```sh

docker run -d -v $HOME/reconcycle_config/:/reconcycle_config/ --net=host --restart always --device /dev/mem --privileged --name ros1_active raspi:active
docker run -it --device /dev/mem --privileged --net=host --name ros1_active1 raspi:active bash 


docker run -it --net=host raspi:devel
$ docker run -it -v /home/ubuntu/catkin_ws/src:/ros_ws/src --device /dev/mem --privileged --name ros1_devel raspi:devel
```

```sh
docker run -it -v $HOME/reconcycle_config/active_config:/ros_ws/src/raspi_ros/active_config --device /dev/mem --privileged --name ros1_active raspi:active
```



[Problem with sudo docker](https://docs.docker.com/engine/install/linux-postinstall/)



```sh
docker build -t raspi:devel .





docker run -it reconcycle2:devel

docker run -it -v /home/rok/reconcycle/raspi_ros:/ros_ws/src/raspi_ros --name ros2_devel reconcycle2:devel 


docker exec -it ros2_devel bash

colcon build
rosdep install -i --from-path src --rosdistro foxy -y
. install/setup.bash


```


```sh
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
```




