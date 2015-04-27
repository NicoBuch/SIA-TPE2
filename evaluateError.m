function ret = evaluateError(inp, yValue, W)
	err = 0;
	W{1}
	aux = W{1} * inp
	for i = 2 : length(W)
		aux(end +1, 1) = -1;
		aux = W{i} * aux;
	endfor
	ret = err - yValue;
endfunction