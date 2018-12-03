# Install Basic Tools and Packages

## Basic Tools

```
sudo apt-get update
sudo apt-get install -y htop
sudo apt-get install -y tmux
sudo apt-get install -y vim
sudo apt-get install -y python3-pip
sudo apt-get install -y openssh-server
sudo apt-get install -y openssh-client
sudo apt-get install -y git
sudo apt-get install -y gfortran
sudo apt-get install -y protobuf-compiler
sudo apt-get install -y libprotoc-dev
sudo apt-get install -y python-imaging
sudo apt-get install -y cmake
sudo apt-get install -y libfreetype6-dev
sudo apt-get install -y pkg-config
sudo apt-get install -y libpng12-dev
sudo apt-get install -y libblas3 libblas-dev
sudo apt-get install -y liblapack3 liblapack-dev
sudo apt-get install -y libjpeg-dev zlib1g-dev
sudo apt-get install -y python-catkin-tools
sudo apt-get install -y ros-kinetic-pcl-ros ros-kinetic-image-view
sudo apt-get install -y python3-empy
sudo apt-get install -y libgpgme11-dev
```

or,

```
./ubuntu_packages.sh
```

### Python related libraries
```
sudo pip3 install Cython
sudo pip3 install scikit-image
sudo pip3 install numpy
sudo pip3 install onnx
sudo pip3 install rosdep
sudo pip3 install rosinstall_generator
sudo pip3 install wstool
sudo pip3 install rosinstall
```


or,

```
./python3_packages.sh
```

## Change *HOSTNAME*

Replace *tegra-ubuntu* or whatever existing hostname with your desired hostname:
```
sudo vim /etc/hostname
```
also in the following file:
```
sudo vim /etc/hosts
```



