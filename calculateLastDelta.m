function last = calculateLastDelta(yValues, lastVvalues, dg, betaValue)

  derivate = dg(betaValue, lastVvalues);
	dif = derivate .* (yValues - lastVvalues);
	last = dif;

endfunction
