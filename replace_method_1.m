function community = replace_method_1(community, community_fitness)
  children = {};
  while(length(children) < length(people))
    people = pick_function(community, 2, community_fitness); %implementar elite, ruleta, boltzman, torneos y mixto.
    if(rand < cross_probability)
      new_children = crossover(people, cross_function); % implementar los algoritmos de cruza: clasico(un solo punto), dos puntos, uniforme, anular.
      children{end+1} = new_children{1};
      children{end+1} = new_children{2};
    endif
  endwhile
  mutants = mutate(children, mutation_probability, mutation_function); % mutacion clasica y no uniforme
  community = train(mutants, ages_to_train); % hacer backpropagation durante x cantidad de epocas.
endfunction
