function delta = calculateDeltas(hLastValues, WactualValues, deltaActualValues, gValue, a)


%functions{1, 1} = @tanhFunc;
%functions{1, 2} = @derivativeTanh;

% functions{1, 1} = @exponential;
% functions{1, 2} = @exponentialDerivated;

%g = functions{gValue, 1};
%derivatedG = functions{gValue, 2};
% der = cell(1, length(HlowerValus));
% der = derivativeTanh(0.5, HlowerValues);
	derivate = 1 * (sech(1 * hLastValues) .^ 2);
	
	wSum = deltaActualValues * WactualValues;
	
	wSum = wSum(1 : end-1);
	
	delta = derivate' .* wSum;

endfunction
