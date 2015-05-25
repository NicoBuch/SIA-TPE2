function fitness = evaluate_fitness(community)
  for i = 1 : length(community)
    fitness(i) = 1 / community{i}.error;
  endfor
endfunction
