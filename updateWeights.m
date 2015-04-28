function W = updateWeights(W, eta, delta, V, inp, momentum)
 	W{1} = W{1} + (eta * (delta{1}' * inp'));
  for m = 2 : length(W)
	  W{m} = W{m} + (eta * (delta{m}' * V{m-1}'));
  endfor
endfunction
