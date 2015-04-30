function [W, previousDeltaW] = updateWeights(W, eta, delta, V, inp, momentum, previousDeltaW, firstTime)
  if (firstTime == 0)
    previousDeltaW{1} = (eta * (delta{1}' * inp'));
 	  W{1} = W{1} + previousDeltaW{1};
    for m = 2 : length(W)
      previousDeltaW{m} = (eta * (delta{m}' * V{m-1}'));
	    W{m} = W{m} + previousDeltaW{m};
    endfor
  else
    actualDeltaW = (eta * (delta{1}' * inp')) + momentum * previousDeltaW{1};
    W{1} = W{1} + actualDeltaW;
    previousDeltaW{1} = actualDeltaW;
    for m = 2 : length(W)
      actualDeltaW = (eta * (delta{m}' * V{m-1}')) + momentum * previousDeltaW{m};;
      W{m} = W{m} + actualDeltaW;
      previousDeltaW{m} = actualDeltaW;
    endfor
  endif
endfunction
