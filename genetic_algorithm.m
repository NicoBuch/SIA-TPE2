function genetic_algorithm(mutation_function, crossover_function, replace_function, community_size, parents_size, max_generations, mutation_probability, pick_function, layerSizes, values, betaValue, g, error)
  community = generate_initial_population_frum(community_size, layerSizes); %implementar una generacion de 'comunity_size' W cells randomly
  community = train(community, ages_to_train)
  community_fitness = evaluate_fitness(community); % implementar el forward propagation que calcule los errores de cada individuo.
  age = 0;
  while(!finished(community_fitness, max_generations)) % finished tiene que ser una funcion que evalue si hay que terminar, segun los criterios que dice en la consigna
    people = pick_function(community, parents_size, community_fitness); %implementar elite, ruleta, boltzman, torneos y mixto.
    children = crossover(people, cross_probability, cross_function); % implementar los algoritmos de cruza: clasico(un solo punto), dos puntos, uniforme, anular.
    mutants = mutate(children, mutation_probability, mutation_function); % mutacion clasica y no uniforme
    trained = train(mutants, ages_to_train) % hacer backpropagation durante x cantidad de epocas.
    trained_fitness = evaluate_fitness(trained);
    community = generate_new_community(community, mutants) % metodos de reemplazo 1, 2 y 3
    age++;
  end

endfunction
