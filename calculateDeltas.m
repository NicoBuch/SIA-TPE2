function delta = calculateDeltas(HlowerValues, WactualValues, deltaActualValues, gValue)


functions{1, 1} = @tanhFunc;
functions{1, 2} = @derivativeTanh;

functions{1, 1} = @exponential;
functions{1, 2} = @exponentialDerivated;

g = functions{gValue, 1};
derivatedG = functions{gValue, 2};

der = cell(1, length(hLastValues));
der = derivatedG(HlowerValues);

wSum = WactualesValues' .* deltaActualValues';

wSum = sum(wSum);

last = der * wSum;

endfunction