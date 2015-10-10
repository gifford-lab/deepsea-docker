require 'torch'
require 'hdf5'
local matio = require 'matio' -- changed from mattorch


print 'Loading dataset'

train_file = 'input/train.mat'
valid_file = 'input/valid.mat'

loaded = matio.load(train_file)

tr_size = loaded['trainxdata']:size(1)

noutputs = loaded['traindata']:size(2)

trainData = {
    data = loaded['trainxdata'],
    labels = loaded['traindata'],
    size = function() return tr_size end
}

loaded = matio.load(valid_file)

te_size = loaded['validxdata']:size(1)

validData = {
    data = loaded['validxdata'],
    labels = loaded['validdata'],
    size = function() return te_size end
}
   
print 'Finished loading dataset'




