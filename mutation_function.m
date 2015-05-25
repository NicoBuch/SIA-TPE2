function person = mutation_function(person)
  locus = randi(length(person));
  person(locus) = person(locus) * (rand * 0.2 + 0.9);
endfunction
