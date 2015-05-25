function mutants = mutate(people, mutation_probability, mutation_function)
  for i = 1 : length(people)
    if(rand < mutation_probability)
      mutants{i} = mutation_function(people{i});
    else
      mutants{i} = people{i};
    end
  end
endfunction
