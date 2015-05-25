function person = one_gen_mutation(person)
  locus = randi(length(person.weightVectors));
  person.weightVectors(locus) = person.weightVectors(locus) * (rand * 0.2 + 0.9);
endfunction
