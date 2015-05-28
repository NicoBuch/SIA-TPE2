function out =  exponential(betaValues, x)
  out = (1 + exp(-2*x.*betaValues)) .^ -1;
endfunction
