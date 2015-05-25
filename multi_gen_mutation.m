function person = multi_gen_mutation(person)
  person.weightsVector = person.weightsVector * (rand * 0.2 + 0.9);
endfunction
