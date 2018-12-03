# Torch7 on Jetson TX1 

## Installing Torch7 on NVIDIA TX1

To install Torch7 on the Jetson TX1, I recommend using [dusty-nv](https://github.com/dusty-nv)'s installation script.<br/>

Click [here](https://github.com/dusty-nv/jetson-reinforcement) to go to the Torch7 installation repository. Follow the instructions and you should have Torch7 successfully running on the TX1 in under 45 minutes. You can skip the gazebo install and that should make the process quicker.

The actual installation script can be found [here](https://github.com/dusty-nv/jetson-reinforcement/blob/master/CMakePreBuild.sh).

The above script did not automatically update my bash profile, so don't forget to do that if it hasn't done it for you automatically.

Adding the following to your $PATH variable should work:

> /home/ubuntu/jetson-reinforcement/build/torch/bin

The above installation script does not install the 'cunn' library, therefore you'll have to install that manually using luarocks

>git clone https://github.com/torch/cunn

>cd cunn

>luarocks make rocks/cunn-scm-1.rockspec

## Installing OpenCV 2.4 on NVIDIA TX1

If you followed the JetPack installation you will already have OpenCV installed. You can verify this installation by running some of the samples as shown in the instructions on the previous page.

## Installing png++ on NVIDIA TX1

STEP 1: First verify the version of libpng that you have on your system. From experience I noticed that libpng1.6 does not work well with png++ version0.2.9. Therefore I would recommend downgrading your libpng version to 1.2.X and switching to the png++ version 0.2.7.

To find the version of your libpng installation:

> convert -list format | grep PNG

STEP 2: To download Png++ version=0.2.7 click [here](http://download.savannah.gnu.org/releases/pngpp/png++-0.2.7.tar.gz)

STEP 3: Unzip the folder, and install using make

> sudo make install PREFIX=$HOME

Note: sudo is cruicial to having smooth linking of library files.

STEP 2A: Alternatively, the documentation recommends first testing the installation. You can do that as follows:

> make

> make test

If you don't see any errors you should be ready to go to STEP 3 directly.
***
