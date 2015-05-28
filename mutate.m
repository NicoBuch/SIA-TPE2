function mutants = mutate(people, mutation_probability, mutation_function, age)
  for i = 1 : length(people)
    mutants{i} = mutation_function(people{i}, mutation_probability, age);
  end
endfunction
