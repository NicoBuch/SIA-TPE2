function W = updateWeights(W, eta, delta, V);
  for m = 1 : length(W)
	  dw = eta * delta{m} * transpose(V{m});
  	  W{m} = W{m} + dw;
  endfor
endfunction
