function ret = compareOutValues (yValues, Vfinal, error)
  % Esto hay que cambiarlo por el error cuadratico medio. Preguntar como se hace!
  Vfinal=Vfinal
  yValues
  ret = abs(yValues - Vfinal) <= error;
endfunction
