#!/usr/bin/env bash
echo "Dynamic startup"
source /source_ws.sh
echo Using ROS_MASTER_URI=$ROS_MASTER_URI
echo Using ROS_IP=$ROS_IP
roslaunch --wait raspi_ros reconcycle.launch

exec "$@"

