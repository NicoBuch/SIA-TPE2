function fitness = evaluate_fitness(community, values, M, betaValue, g)
  for i = 1 : length(community)
    outValues = forwardPropagation(community{i}, values(:, 1), M, betaValue, g);
    fitness(i) = 1 / halfCuadraticError(values(:, 2), outValues);
  endfor
endfunction
