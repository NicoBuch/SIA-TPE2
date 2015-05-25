function children = crossover(people, cross_function)
  [child1 child2] = cross_function(people{1}, people{2});
  children = {child1, child2};
endfunction
