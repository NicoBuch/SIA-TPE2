function ret = compareOutValues (yValues, Vfinal, error)
  % Esto hay que cambiarlo por el error cuadratico medio. Preguntar como se hace!
  errorr = halfCuadraticError(yValues, Vfinal);
  ret = errorr <= error;
endfunction
