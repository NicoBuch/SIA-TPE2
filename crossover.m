function children = crossover(people, cross_probability, cross_function)
  children = {};
  while(length(children) < length(people))
    indexes = randi(length(people), 1, 2)
    if(rand <= cross_probability)
      [child1 child2] = cross_function(people{indexes(1)}, people{indexes(2)});
      if(length(children) != 0)
        children = {children, child1, child2};
      else
        children = {child1, child2};
      endif
    endif
  endwhile
endfunction
