more off;
load points.txt values;
layerSizes = [1 5 5];
eta = 0.01;
gValue = 1;
betaValue = 0.5;
error = 0.1;
momentum = 0;
etaAdaptativo = 0;
a = 0.05;
b = 0.2;
multiLayerPerceptron(values, layerSizes, eta, gValue, betaValue, error, momentum, etaAdaptativo, a, b);
