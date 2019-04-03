# Installing PyTorch on TX2

Trying to install PyTorch on the TX2 for Python3.5 is a bit of a mess since you need to build from source. If you're using Python2.7 or Python3.6, NVIDIA has been kind enough to provide wheels that you can install from. I briefly mention this process and include the wheels in [this](https://github.com/ShreyasSkandanS/xavier_utils) repository.

However, for the TX2, sadly it isn't this simple. We need to build PyTorch from source, and the latest branch of PyTorch has trouble trying to build without NCCL. 

For now, I recommend using a previous version of PyTorch such as 0.4.1 or 0.5.0.

April 2019: It appears there's a dependency that is now a private repository for pytorch==0.4.1; For **ss_segmentation** I believe pytorch==1.0.0 should also work smoothly.

```
git clone http://github.com/pytorch/pytorch
git checkout v0.4.1
cd pytorch
git submodule update --init
sudo pip3 install -U setuptools
sudo pip3 install -r requirements.txt
python setup.py build_deps
#sudo python setup.py develop
sudo python setup.py install
```

After this, you should be able to import torch and run some basic commands to verify that it's working.

```
python3
```

```
import torch
print(torch.__version__)
print(torch.cuda.is_available())
```

Test that the GPU is working fine and there's no CUDA version conflicts:
```
import torch

a = torch.ones(3,3).to('cuda')
b = torch.ones(3,3).to('cuda')

print(a + b)
```

Additionally, you will most likely need TorchVision for your project, which can be installed in a slightly easier manner:

```
pip3 install --no-deps torchvision
```

Extras:
```
pip3 install Pillow
```
