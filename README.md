# raspi-reconcycle-docker

Dockerfiles for ROS package https://github.com/ReconCycle/raspi_ros

Follow https://github.com/ReconCycle/raspberry_reconcycle_init for installation instructions.

<!--

## Change ENV variables in the docker-compose file

## Set up the specific raspberry 

Copy the docker-compose.yaml template and edit it.
```sh
cd raspi-reconcycle-docker
cp docker-compose-template.yaml ~/reconcycle_config/docker-compose.yaml
nano ~/reconcycle_config/docker-compose.yaml
```

Scroll to the environment variables section:

```yaml
    environment:
      - ROS_MASTER_URI=http://10.20.0.1:11311
      - ROS_IP=10.20.1.XXX
      - THIS_RAS_NAME='example'
```

1. Set `ROS_MASTER_URI` to have the correct IP of the computer that runs ROS master. The variable must include the protocol and port, for example
http://192.168.0.1:11311
2. Set `ROS_IP` to match with the Raspberry's IP. Find your Raspberry's IP with `ifconfig`, for example 192.168.0.1
3. Set the name of your tool (this will later be the name for the ROS namespace) by changing the `THIS_RAS_NAME`.

Check [network setup](http://wiki.ros.org/ROS/NetworkSetup) if you encounter the AF_INET error!


## Build Docker image

```bash
docker build -t raspi:active .
```

# Develop with Docker

```bash 
docker run -it -v /home/ubuntu/catkin_ws/src:/ros_ws/src -v $HOME/reconcycle_config/:/reconcycle_config/ --device /dev/mem --net=host --privileged --name ros1_devel raspi:active bash
```

```bash 
docker run -it -v /home/ubuntu/catkin_ws/src:/ros_ws/src  --device /dev/mem --net=host --privileged --name ros1_devel raspi:active bash
```

First execute in the terminal:

```sh
$ catkin build
$ source /source_ws.sh
$ export ROS_MASTER_URI=http://localhost:11311/
```

# Use Docker

```
docker-compose up
```
-->
