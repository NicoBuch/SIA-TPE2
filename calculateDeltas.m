function delta = calculateDeltas(hLastValues, WactualValues, deltaActualValues, gValue, num)


%functions{1, 1} = @tanhFunc;
%functions{1, 2} = @derivativeTanh;

% functions{1, 1} = @exponential;
% functions{1, 2} = @exponentialDerivated;

%g = functions{gValue, 1};
%derivatedG = functions{gValue, 2};
% der = cell(1, length(HlowerValues));
% der = derivativeTanh(0.5, HlowerValues);
der = 1 - (tanh (hLastValues)) .^ 2;

wSum = WactualValues * deltaActualValues;

wSum = sum(wSum);

delta = der * wSum;

endfunction
