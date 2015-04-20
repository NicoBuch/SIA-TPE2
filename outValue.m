function out = outValue(values, weightMatrix)
  values(end + 1) = -1;
  out = weightMatrix * values';
  out = out';
endfunction
