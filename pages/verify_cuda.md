## Verifying CUDA X.0 installation
By installing JetPack, you should now be able to run CUDA and all the samples that come with it

STEP 1: To check if you have successfully intalled cuda - version should say CUDA {8.0,9.0,10.0 etc}

```
nvcc -V
```

STEP 2: To run a sample, from the home directory

```
cd ~/NVIDIA_CUDA-9.0_Samples/bin/aarch64/linux/release/
```

STEP 3: You should see a list of executable scripts for all the CUDA samples
```
./smokeParticles
```

You should see the example running! I noticed a frame rate of ~38fps for this example<br/>

![CUDAExample](https://github.com/ShreyasSkandan/nvidia-tx1/blob/master/imgs/smokeparticles.png)

