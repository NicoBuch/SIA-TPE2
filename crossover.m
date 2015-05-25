function children = crossover(people, cross_function)
  if(rand <= cross_probability)
    [child1 child2] = cross_function(people{indexes(1)}, people{indexes(2)});
    children = {child1, child2};
  endif
endfunction
