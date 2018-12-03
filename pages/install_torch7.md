## Installing Torch7 on NVIDIA TX1/TX2

To install Torch7 on the Jetson TX1/TX2, I recommend using [dusty-nv](https://github.com/dusty-     nv)'s installation script.

Click [here](https://github.com/dusty-nv/jetson-reinforcement) to go to the Torch7 installation     repository. Follow the instructions and you should have Torch7 successfully running on the TX1 in   under 45 minutes. You can skip the gazebo install and that should make the process quicker.

The actual installation script can be found [here](https://github.com/dusty-nv/jetson-reinforcement/blob/master/CMakePreBuild.sh).

The above script did not automatically update my bash profile, so don't forget to do that if it     hasn't done it for you automatically.

Adding the following to your $PATH variable should work:

```
/home/ubuntu/jetson-reinforcement/build/torch/bin
```
