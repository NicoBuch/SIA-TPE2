function community = replace_method_1(community, community_fitness, pick_function, crossover_function, mutation_probability, mutation_function, ages_to_train, cross_probability, layerSizes, values, error, parents_size, age, replace_pick_function, mixed_params, train_probability)
  children = {};
  if(mod(length(community), 2) == 1)
    disp("Para el metodo de reemplazo 1, la comunidad debe tener cantidad par de gente");
    exit
  end

  while(length(children) < length(community))
    people = pick_function(community, 2, community_fitness,mixed_params,age); %implementar elite, ruleta, boltzman, torneos y mixto.

    new_children = crossover(people, crossover_function, cross_probability); % implementar los algoritmos de cruza: clasico(un solo punto), dos puntos, uniforme, anular.
    children = [children new_children];
  endwhile
  mutants = mutate(children, mutation_probability, mutation_function, age); % mutacion clasica y no uniforme
  community = train(mutants, layerSizes, values, ages_to_train, error, train_probability); % hacer backpropagation durante x cantidad de epocas.
endfunction
