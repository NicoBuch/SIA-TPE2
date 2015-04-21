function W = updateWeights(W, eta, delta, V);
  for m = 1 : length(W)
    W{m} = W{m} + eta*delta{m}*V{m-1}
  endfor
endfunction
