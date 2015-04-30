function delta = calculateDeltas(LastVvalues, WactualValues, deltaActualValues, gValue,betaValue)


%functions{1, 1} = @tanhFunc;
%functions{1, 2} = @derivativeTanh;

% functions{1, 1} = @exponential;
% functions{1, 2} = @exponentialDerivated;

%g = functions{gValue, 1};
%derivatedG = functions{gValue, 2};
% der = cell(1, length(HlowerValus));
% der = derivativeTanh(0.5, HlowerValues);

	derivate = betaValue*(1 - LastVvalues(1: end-1) .^ 2);
%	derivate = (2*a*LastVvalues(1: end-1)) .* (1-LastVvalues(1: end-1));

	WactualValues = WactualValues(:, 1 : end-1);

	wSum = WactualValues' * deltaActualValues';

	% Le saco a wSum el ultimo elemento que seria el correspondiente al delta del umbral

	delta = derivate' .* wSum';

endfunction
