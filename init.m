more off;
format long;
load ourFunctionHomogenic.txt values;
layerSizes = [1 512 256 128 64 32 16 8];
eta = 0.0001;
gValue = 1;
betaValue = 0.75;
error = 1;
momentum = 0.5;
etaAdaptativo = 0;
a = 0.0005;
b = 0.1;
W = initializeWeights(layerSizes);
multiLayerPerceptron(W,values, layerSizes, eta, gValue, betaValue, error, momentum, etaAdaptativo, a, b);
