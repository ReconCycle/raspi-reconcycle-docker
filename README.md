# raspi-reconcycle-docker
Standalone repository and instructions for the custom ros docker used on a raspbeerypi in the reconcycle projet


## Build docker image

'''sh
$ docker build -t raspi:active .
$ docker run -it -v /home/ubuntu/catkin_ws/src:/ros_ws/src --device /dev/mem --privileged --name ros1_devel raspi:devel
'''
