# Installing ROS on TX-1 or TX-2

## Installing ROS (Kinetic for TX2)

Installing ROS on the Tegra devices is pretty straightforward, following the
instructions from the  official ROS Installer Guidelines.

Inside this repository you will find an executable shell script named
**ros-kinetic-install.sh**. This is a compilation of all the steps to install
ROS Kinetic on your TX1/TX2. This script will install the barebones version
of ROS-Kinetic. If you wish to install the full desktop version, comment
out the script that installs the **ros-base** version and uncomment the desired
version installer.

An additional note is in the initialization of **rosdep**. You may recieve a
warning requiring you  to fix your rosdep permission.

To do that, simply follow the instructions mentioned, i.e
```
sudo rosdep fix-permissions
rosdep update
source /opt/ros/ketic/setup.bash
```

At the end of the installer, you should be able to launch your **roscore** and
view your rosnode list successfully!

## Setting up CATKIN_TOOLS

I prefer to use *catkin_tools* and their package builder instead of *catkin_make*:

Setting it up is simple,
```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add - 
sudo apt-get update
sudo apt-get install python-catkin-tools
```

### Creating a workspace
```
mkdir -p /path/to/workspace_ws/src
cd /path/to/workspace_ws
catkin config --init --extend /opt/ros/kinetic
```

### CMAKE Configuration
```
catkin config --cmake-args -DCMAKE_BUILD_TYPE=Debug
```

```
catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release
```

### Make sure you have Python3 and Pip3 installed

```
sudo apt-get install python3-pip
```

### Setting up a ROS environment with Python3 for Deep Learning

Make sure you first comment out the source command for the main ROS environment (Kinetic) in your *bashrc* file.

```
cd ~
mkdir ros_py35
cd ros_py35

# Install some basic libraries needed to build ROS from source
sudo apt-get install -y python3-empy
sudo apt-get install -y libgpgme11-dev

sudo pip3 install rosdep
sudo pip3 install rosinstall_generator
sudo pip3 install rosinstall
#sudo pip3 install wstool

catkin config --init
catkin config -DCMAKE_BUILD_TYPE=Release

# The following lines build vcstools and wstool from source because of a problem reading URIs with the main branch of vcstools

git clone https://github.com/tkruse/vcstools
cd vcstools
git checkout mock_server_tar_test
python setup.py develop
cd ..
git clone https://github.com/vcstools/wstool
cd wstool
python setup.py develop

# Pull bare-bone dependencies for ROS (Melodic) and use workspace tool to initialize
rosinstall_generator ros_comm --rosdistro melodic --deps --tar > melodic-ros_comm.rosinstall
wstool init -j8 src melodic-ros_comm.rosinstall

# If you have any failed installations, fix them and continue from where you were using
wstool update -j 4 -t src

export ROS_PYTHON_VERSION=3

catkin build
```

**Note:**
* You will probably see two build errors because of inappropriately set compile flags. They will try to compile without C++11 and fail.
* You can manually go to these CMakeLists.txt files and add "std=c++11" to the compile options and build again.
* Candidate trouble makers : src/ros_comm/rosbag & src/ros_comm/rosbag_storage

**Adding other ROS Packages**

You will most likely need *Sensor_Msgs*, *Geometry_Msgs* etc, and you can download and build them into your melodic workspace like this:
```
# Add other necessary ROS-Packages using rosinstall_generator
rosinstall_generator ros_comm sensor_msgs nav_msgs geometry_msgs --rosdistro melodic --deps --tar > melodic-ros_comm.rosinstall
wstool merge -t src melodic-ros_comm.rosinstall
wstool update -t src/
```

