function last = calculateLastDelta(hLastValues, yValues, lastVvalues, gValue, bet)

% functions{1, 1} = @tanhFunc;
% functions{1, 2} = @derivativeTanh;

% functions{1, 1} = @exponential;
% functions{1, 2} = @exponentialDerivated;

% g = functions{gValue, 1};
% derivatedG = functions{gValue, 2};

%der = cell(1, length(hLastValues));
% Vector de long de la ultima layer
der = 1 - (tanh (hLastValues)) .^ 2;
% Vector de long de la ultima layer
dif = yValues - lastVvalues;

last = der.*dif;

endfunction
