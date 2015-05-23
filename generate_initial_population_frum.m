function population =  generate_initial_population_frum(size, layerSizes)
  for i = 1 : size
    population{i} = initializeWeights(layerSizes);
  endfor
endfunction
