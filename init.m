more off;
format long;
load ourFunctionHomogenic.txt values;
x = -15 : 0.2 : 15
y = sin(x) + 6 * (cos(x) .^ 2);
values = [x' y'];
layerSizes = [1 256 128 128 64 32 16];
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
