local torch = require 'torch'
require 'paths'

if (not paths.filep("cifar10torchsmall.zip")) then
	os.execute('wget -c https://s3.amazonaws.com/torch7/data/cifar10torchsmall.zip --no-check-certificate')
	os.execute('unzip cifar10torchsmall.zip')
end

trainset = torch.load('cifar10-train.t7')
testset = torch.load('cifar10-test.t7')
