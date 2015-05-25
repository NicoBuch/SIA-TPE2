more off;
format long;

load ourFunctionHomogenic.txt values;
x = -1 : 0.01 : 1;
% y = sin(x) + 6 * (cos(x) .^ 2);
y = sin(x + 2*x.^2 + 3*x.^3);
% y  = (sin(x) .* x.^3 + x/2);
% y = (sin(x) .* (x .^ 3) + x ./ 2);
y = y ./ max(abs(y));
gValue = 1;

functions{1, 1} = @tanhFunc;
functions{1, 2} = @derivativeTanh;
functions{2, 1} = @exponential;
functions{2, 2} = @exponentialDerivated;
g = functions{gValue, 1};
dg = functions{gValue, 2};

values = [x' y'];
layerSizes = [1 15];
eta = 0.025;
gValue = 1;
betaValue = 1;
error = 0.001;
momentum = 0.75;
etaAdaptativo = 0;
a = 0.0005;
b = 0.1;
minimumDeltaError = 0;
noisePercentage = 0;
W = initializeWeights(layerSizes);
max_ages = 2000;
clf;
multiLayerPerceptron(max_ages,W,values, layerSizes, eta, betaValue,g,dg, error, momentum, etaAdaptativo, a, b, minimumDeltaError, noisePercentage);
