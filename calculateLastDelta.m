function last = calculateLastDelta(yValues, lastVvalues, gValue)

% functions{1, 1} = @tanhFunc;
% functions{1, 2} = @derivativeTanh;

% functions{1, 1} = @exponential;
% functions{1, 2} = @exponentialDerivated;

% g = functions{gValue, 1};
% derivatedG = functions{gValue, 2};

%der = cell(1, length(hLastValues));
% Vector de long de la ultima layer

%	derivate = a*(1 - lastVvalues .^ 2);
%	derivate = (2*a*lastVvalues).*(1-lastVvalues);

% Vector de long de la ultima layer
	dif = yValues - lastVvalues;
	last = dif;

endfunction
