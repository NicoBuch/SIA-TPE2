function fitness = evaluate_fitness(community)
  for i = 1 : length(community)
    fitness(i) = 1 / (community{i}.error ^ 2);
  endfor
endfunction
