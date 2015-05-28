function person = multi_gen_not_uniform_mutation(person, mutation_probability, age)
  if(age != 0)
    mutation_probability = mutation_probability * 1/age ;
  end
  for i = 1 : length(person.weightsVector)
    if(rand < mutation_probability)
      person.weightsVector(i) = person.weightsVector(i) * (rand * 0.2 + 0.9);
    end
  end
endfunction
