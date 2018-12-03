## Verifying OpenCV installation

You can verify that openCV has been successfully installed by running a quick example. Refer to *   opencv_stuff/test-working/* for source code

STEP 1: Make sure you have a text editor (I use gedit)

STEP 2: Install cmake
```
sudo apt-get install cmake
```

STEP 3: After creating helloworld.cpp and CMakeLists.txt create a build directory
```
mkdir build
```

STEP 4: Enter build directory and run cmake
```
cd build/
cmake ..
```

STEP 5: Run the make command from the build directory
```
make
```

STEP 5(o): If you encounter a missing library binding error such as this
```
/usr/bin/ld: cannot find -lopencv_dep_cudart
```

You might need to manually specify the location of the library before executing the make command

STEP 5(o): You can do this by navigating to the links.txt file
```
cd ~/nvidia-tx1/opencv_stuff/test-working/build/CMakeFiles/cv_hello.dir/
gedit links.txt
```

STEP 5(o): Replace -lopencv_dep_cudart with the location of the libcudart.so file (/usr/local/cuda- 8.0/lib64/libcudart.so)

STEP 5(o): Run the make command from the build directory

STEP 6: You will generate an executable named cv_hello. You can now run the example and should see  a similar output.

```
./cv_hello
```

**NOTE:** Previously with JetPack 3 and OpenCV **(OpenCV4Tegra)** for the TX2 were compiled with    the wrong GPU architecutre. Instead of *compute_62* and *sm_62* it has been compiled with *         compute_53* and *sm_53* resulting in the failure to use any of opencv's gpu functions with          OpenCV4Tegra. You can build OpenCV from source which is a work around for this problem until the    next update.

![OpenCVExample](https://github.com/ShreyasSkandan/nvidia-tx1/blob/master/imgs/opencvexample.png)
