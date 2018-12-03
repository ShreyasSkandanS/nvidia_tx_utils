# TensorFlow and TX2

Installing TensorFlow on the TX2 is fairly simple thanks to a wheel provided by NVIDIA

For Python3.5
```
pip3 install --extra-index-url=https://developer.download.nvidia.com/compute/redist/jp33 tensorflow-gpu
```

For Python2.7
```
pip install --extra-index-url=https://developer.download.nvidia.com/compute/redist/jp33 tensorflow-gpu
```

And the actual wheel (Python3.5) can be found in the **wheels** folder of this repository.
