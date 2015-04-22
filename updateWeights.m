function ret = updateWeights(W, eta, delta, V, inp)
  ret{1} = W{1} + (eta * (delta{1}' * inp'));
  for m = 2 : length(W)
	  ret{m} = W{m} + (eta * (delta{m+1}' * V{m}'));
  endfor
endfunction
