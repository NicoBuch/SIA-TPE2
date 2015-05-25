function person = one_gen_mutation(person)
  locus = randi(length(person.weightsVector));
  person.weightsVector(locus) = person.weightsVector(locus) * (rand * 0.2 + 0.9);
endfunction
