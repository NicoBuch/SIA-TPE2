more off;
load puntosEsquinas10.txt values;
layerSizes = [1 40 30 20 15 20 30 40];
eta = 0.1;
gValue = 1;
betaValue = 0.5;
error = 1;
momentum = 0;
etaAdaptativo = 0;
a = 0.01;
b = 0.1;
W = initializeWeights(layerSizes);
multiLayerPerceptron(W,values, layerSizes, eta, gValue, betaValue, error, momentum, etaAdaptativo, a, b);
