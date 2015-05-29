more off;
format long;
warning ("off", "Octave:broadcast");
load ourFunctionHomogenic.txt values;
x = -4 : 0.05 : 4;
% y = sin(x) + 6 * (cos(x) .^ 2);
% y = sin(x + 2*x.^2 + 3*x.^3);
% y  = (sin(x) .* x.^3 + x/2);
% y = (sin(x) .* (x .^ 3) + x ./ 2);

y = tanh(0.1 * x) + sin(3*x);

% y = y ./ (max(abs(y)));
gValue = 1;
functions{1, 1} = @tanhFunc;
functions{1, 2} = @derivativeTanh;
functions{2, 1} = @exponential;
functions{2, 2} = @exponentialDerivated;
g = functions{gValue, 1};
dg = functions{gValue, 2};

values = [x' y'];
layerSizes = [1 35 10];
eta = 0.001;
gValue = 1;
% betaValues = y ./ x;
% betaValues(151) = 10;
betaValues = ones(1,length(x)) * 0.5;
error = 0.0001;
momentum = 0.9;
etaAdaptativo = 0;
a = 0.005;
b = 0.2;
minimumDeltaError = 0;
noisePercentage = 0;
W = initializeWeights(layerSizes);
max_ages = 2000;
clf;
multiLayerPerceptron(max_ages,W,values, layerSizes, eta, betaValues,g,dg, error, momentum, etaAdaptativo, a, b, minimumDeltaError, noisePercentage);
