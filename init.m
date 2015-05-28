more off;
format long;
warning ("off", "Octave:broadcast");
load ourFunctionHomogenic.txt values;
x = -15 : 0.1 : 15;
y = sin(x) + 6 * (cos(x) .^ 2);
% y = sin(x + 2*x.^2 + 3*x.^3);
% y  = (sin(x) .* x.^3 + x/2);
% y = (sin(x) .* (x .^ 3) + x ./ 2);
y = y ./ (max(abs(y)));
gValue = 1;
functions{1, 1} = @tanhFunc;
functions{1, 2} = @derivativeTanh;
functions{2, 1} = @exponential;
functions{2, 2} = @exponentialDerivated;
g = functions{gValue, 1};
dg = functions{gValue, 2};

values = [x' y'];
layerSizes = [1 25];
eta = 0.01;
gValue = 1;
betaValues = y ./ x;
betaValues(151) = 10;
error = 0.0001;
momentum = 0.9;
etaAdaptativo = 5;
a = 0.0005;
b = 0.1;
minimumDeltaError = 0;
noisePercentage = 0;
W = initializeWeights(layerSizes);
max_ages = 2000;
clf;
multiLayerPerceptron(max_ages,W,values, layerSizes, eta, betaValues,g,dg, error, momentum, etaAdaptativo, a, b, minimumDeltaError, noisePercentage);
