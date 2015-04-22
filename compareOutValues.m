function ret = compareOutValues (yValues, Vfinal, error)
  % Esto hay que cambiarlo por el error cuadratico medio. Preguntar como se hace!
  ret = halfCuadraticError(yValues, Vfinal) <= error
endfunction
