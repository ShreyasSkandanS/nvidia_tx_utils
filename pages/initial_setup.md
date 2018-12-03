## Initial Setup

STEP 1: When you boot up the Jetson TX1/TX2 for the first time a terminal window will appear. To    use the Ubuntu via the GUI, install the Nvidia Linux drive.

From the home directory (use username: **ubuntu** and password: **ubuntu**)

for the NVIDIA TX-2 : username : **nvidia** and password: **nvidia**

```
cd NVIDIA-INSTALLER
sudo ./installer.sh
```

STEP 2: After the installation completes reboot the device,
```
$ sudo reboot <br/>
```

STEP 3: You should now be able to log into the Ubuntu GUI

## Installing JetPack
Link - https://developer.nvidia.com/embedded/jetpack

STEP 1: Download **JetPack** on the Host Machine by joining *Embedded System Developer* programme   on NVIDIA page

The latest verson at the time of writing was *JetPack-L4T-3.3-linux-x64.run*
UPDATE: The latest version at the time of writing (TX-2) was *JetPack-L4T-3.3-linux-x64.run*

STEP 2: Connect HOST (*Ubuntu 16.04 with JetPack 3*) machine to router (switch)

STEP 3: Connect Jetson (TX1/TX2) to router (switch)

STEP 4: Navigate to download folder of JetPack file and give executability rights to the installer  file:

```
$ chmod +x JetPack-L4T-(ver)-linux-x64.run
```

STEP 5: Run the installer file:

```
./JetPack-L4T-(ver)-linux-x64.run
```

STEP 6: Select Jetson platform when prompted (here: Jetson TX1/TX2 with Ubuntu Host)

STEP 7: Enter administrator password

STEP 8: Select Standard or Full in Component Manager and accept all Terms and Conditions

STEP 9: Once the installation completes on th
e Host machine, you will see a message "Completed Host installation, Installer will continue with   Device/Post installation."

STEP 10: In the *networking layout* option, select the first option as mentioned in the above       instructions (Device accesses Internet via router/switch.)

STEP 11: Put the Jetson TX1/TX2 in *Force USB Recovery Mode* by following the instructions on the   screen

STEP 12: The device will proceed to get flashed. Wait until you see the message "Finished Flashing  OS". Then hit the reset button on the device and wait till it enters the Ubuntu GUI.

STEP 13: Hit enter to continue on the host machine and set the IP address using ifconfig of         prompted.

STEP 14: Remove all packages from the host (y/n) - decide accordingly

**NOTE:**
Previously on the TX-2, the installation process resulted in failure to install VisionWorks 1.6 on  the host machine. This happens due to a missing cudart library file. To work around this, the folks over at the NVIDIA dev-talk forums suggested the following installation steps (requiring manual     selection):
```
Visionworks 1.6.0 on host can be successfully installed with following manually steps:
1.Install Jetpack with full options first
2.Remove Visionworks by custom options ( visionworks only )
3.Install Visionworks by custom options ( visionworks only )
```

You might not need to do this with JetPack 3.3.
