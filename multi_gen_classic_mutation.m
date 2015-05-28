function person = multi_gen_classic_mutation(person, mutation_probability, age)
  for i = 1 : length(person.weightsVector)
    if(rand < mutation_probability)
      person.weightsVector(i) = person.weightsVector(i) * (rand * 0.2 + 0.9);
    end
  end
endfunction
