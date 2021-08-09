# raspi-reconcycle-docker

Docker image for ROS package https://github.com/ReconCycle/raspi_ros

## Change ENV variables in the docker-compose file

In the docker-compose file, change the ENV variables of ROS\_MASTER\_URI, this Raspberry IP (ROS\_IP) (find it with ifconfig) and this node name (THIS\_RAS\_NAME).

>environment:
>- ROS_MASTER_URI : 000.000.000.000
>- NODE_IP : 000.000.000.000
>- NODE_NAME : 'Setname'


## Build Docker image

```sh
$ docker build -t raspi:active .
```


# Develop with Docker

```sh 
$ docker run -it -v /home/ubuntu/catkin_ws/src:/ros_ws/src -v $HOME/reconcycle_config/:/reconcycle_config/ --device /dev/mem --net=host --privileged --name ros1_devel raspi:active bash
```

```sh 
$ docker run -it -v /home/ubuntu/catkin_ws/src:/ros_ws/src  --device /dev/mem --net=host --privileged --name ros1_devel raspi:active bash
```

First execute in the terminal:

```sh
$ catkin build
$ source /source_ws.sh
$ export ROS_MASTER_URI=http://localhost:11311/
```

# Use Docker

```sh

docker run -d -v $HOME/reconcycle_config/:/reconcycle_config/ --net=host --device /dev/mem --privileged --name ros1_active raspi:active

```
docker-compose up





