function children = crossover(people, cross_probability, cross_function)
  while(length(children) < length(people))
    indexes = randi(length(people), 1, 2)
    if(rand <= cross_probability)
      new_children = cross_function(people{indexes(1)}, people{indexes(2)});
      children = {children, new_children{1}, new_children{2}};
    endif
  endwhile
endfunction
