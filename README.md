# raspi-reconcycle-docker

Docker image for ROS package https://github.com/ReconCycle/raspi_ros

## Install docker-compose on RPi, if it's not installed yet

```bash
sudo apt-get install libffi-dev libssl-dev
sudo apt install python3-dev
sudo apt-get install -y python3 python3-pip
sudo pip3 install docker-compose
```

## Change ENV variables in the docker-compose file

In the docker-compose file, change the ENV variables of ROS\_MASTER\_URI, this Raspberry IP (ROS\_IP) (find it with ifconfig) and this node name (THIS\_RAS\_NAME).

```yaml
environment:
- ROS_MASTER_URI : 000.000.000.000
- NODE_IP : 000.000.000.000
- NODE_NAME : 'Setname'
```

## Build Docker image

```bash
docker build -t raspi:active .
```

<!--
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
-->

# Use Docker

```
docker-compose up
```
