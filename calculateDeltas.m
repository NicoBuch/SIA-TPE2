function delta = calculateDeltas(LastVvalues, WactualValues, deltaActualValues, dg, betaValue)

  derivate = dg(betaValue, LastVvalues(1: end-1));

	WactualValues = WactualValues(:, 1 : end-1);

	wSum = WactualValues' * deltaActualValues';

	delta = derivate' .* wSum';

endfunction
