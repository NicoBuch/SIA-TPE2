function mutants = mutate(people, mutation_probability, mutation_function)
  for i = 1 : length(people)
    mutants{i} = mutation_function(people{i}, mutation_probability);
  end
endfunction
