function person = multi_gen_mutation(person)
  person.weightVectors = person.weightVectors * (rand * 0.2 + 0.9);
endfunction
