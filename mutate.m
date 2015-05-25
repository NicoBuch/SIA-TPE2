function mutants = mutate(people, mutation_probability, mutation_function)
  for i = 1 : length(people)
    if(rand < mutation_probability)
      people{i} = mutation_function(people{i});
    end
  end
endfunction
