function community = replace_method_1(community, community_fitness, pick_function, cross_function, mutation_probability, mutation_function, k, ages_to_train, cross_probability, layerSizes, values, error)
  children = {};
  if(mod(length(community), 2) == 1)
    disp("Para el metodo de reemplazo 1, la comunidad debe tener cantidad par de gente");
    exit
  end
  while(length(children) < length(community))
    people = pick_function(community, 2, community_fitness); %implementar elite, ruleta, boltzman, torneos y mixto.
    if(rand < cross_probability)
      new_children = crossover(people, cross_function); % implementar los algoritmos de cruza: clasico(un solo punto), dos puntos, uniforme, anular.
      children{end+1} = new_children{1};
      children{end+1} = new_children{2};
    endif
  endwhile
  mutants = mutate(children, mutation_probability, mutation_function); % mutacion clasica y no uniforme
  community = train(mutants, layerSizes, values, ages_to_train, error); % hacer backpropagation durante x cantidad de epocas.
endfunction
