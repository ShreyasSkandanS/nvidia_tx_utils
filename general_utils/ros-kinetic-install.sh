#!/bin/bash
# ROS Kinetic Installation Instructions - wiki.ros.org/kinetic/installation

# STEP 1 - Setup sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# STEP 2 - Setup keys
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116

# STEP 3 - Installation
sudo apt-get update

# Barebones ROS Install
#sudo apt-get install ros-kinetic-ros-base -y

# or Desktop Full Installation
sudo apt-get install ros-kinetic-desktop-full -y

# or Desktop Installation
#sudo apt-get install ros-kinetic-desktop -y

# STEP 4 - Initialize rosdep
sudo rosdep init
rosdep update
# Note: the installer may prompt you to fix permissions, which is done as follows
#sudo rosdep fix-permissions
#rosdep update

# STEP 5 - Setup your Environment
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# STEP 6 - Getting rosinstall
sudo apt-get install python-rosinstall -y


