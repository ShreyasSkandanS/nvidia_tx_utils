## Verifying VisionWorks installation

In a similar manner you can test the Vision Works install
```
cd ~/VisionWorks-SFM-0.88-Samples/bin/aarch64/linux/release/
./nvx_sample_sfm
```

You should see a running example of Structure From Motion in what appears to be a parking lot.

![VisionWorksExample](https://github.com/ShreyasSkandan/nvidia-tx1/blob/master/imgs/sfm_screenshot. png)

On the NVIDIA TX-2, the process is slightly different.

The samples are saved in /usr/share/. You must move them to a desired location before you can build them.

```
./usr/share/visionworks/install_samples.sh ~
```

This will move the samples to your $HOME directory. Navigate to this folder and issue a *make*      command to build all *VisionWorks-1.6* samples as shown above.

**NOTE:** At the time of writing, I was unsuccessful in installing VisionWorks 1.6 on my most       machine. I was only able to install it on the TX-2. Code written in OpenVX using the NVXIO library  will not move over perfectly from a TX-1 to the TX-2 because the NVXIO library has now been split   into NVX and OVX, so editing of function calls and such will be required.


