function W = updateWeights(W, eta, delta, V, inp, momentum,age)
	dw = cell(1, length(W));
	dw{1} = momentum * (eta * (delta{1}' * inp'));
 	W{1} = W{1} + dw{1};
	%esta mal, hay que modificar sobre el anterior delta w
  	for m = 2 : length(W)
	  dw{m} = momentum * (eta * (delta{m}' * V{m-1}'));
	  W{m} = W{m} + dw{m};
	endfor
endfunction
