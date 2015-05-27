function children = crossover(people, cross_function, cross_probability)
  if(rand < cross_probability)
    [child1, child2] = cross_function(people{1}, people{2}); % implementar los algoritmos de cruza: clasico(un solo punto), dos puntos, uniforme, anular.
    children{1} = child1;
    children{2} = child2;
  else
    children{1} = people{1};
    children{2} = people{2};
  end
endfunction
