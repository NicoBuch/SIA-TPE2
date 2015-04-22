function last = calculateLastDelta(hLastValues, yValues, lastVvalues, gValue, a)

% functions{1, 1} = @tanhFunc;
% functions{1, 2} = @derivativeTanh;

% functions{1, 1} = @exponential;
% functions{1, 2} = @exponentialDerivated;

% g = functions{gValue, 1};
% derivatedG = functions{gValue, 2};

%der = cell(1, length(hLastValues));
	derivate = realpow(sech(a*hLastValues), 2);
	dif = yValues - lastVvalues;
	last = derivate .* dif;

endfunction
