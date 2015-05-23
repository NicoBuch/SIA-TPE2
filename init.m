more off;
format long;

load ourFunctionHomogenic.txt values;
x = -15 : 0.2 : 15
y = sin(x) + 6 * (cos(x) .^ 2);
% y  = (sin(x) .* x.^3 + x/2);
% y = (sin(x) .* (x .^ 3) + x ./ 2);
y = y ./ max(abs(y));
values = [x' y'];
layerSizes = [1 2];
eta = 0.1;
gValue = 1;
betaValue = 0.75;
error = 0.001;
momentum = 0.5;
etaAdaptativo = 0;
a = 0.0005;
b = 0.1;
minimumDeltaError = 0;
noisePercentage = 0;
W = initializeWeights(layerSizes);
max_ages = 100;
% clf;
multiLayerPerceptron(max_ages,W,values, layerSizes, eta, gValue, betaValue, error, momentum, etaAdaptativo, a, b, minimumDeltaError, noisePercentage);
