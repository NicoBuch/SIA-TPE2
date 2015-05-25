function genetic_algorithm(mutation_function, crossover_function, replace_function, community_size, parents_size, max_generations, mutation_probability, pick_function, ages_to_train, layerSizes, values, basePerceptron,error, cross_probability)
  community = generate_initial_community_frum(community_size, layerSizes, basePerceptron); %implementar una generacion de 'comunity_size' W cells randomly
  community = train(community, layerSizes, values,ages_to_train,error);
  community_fitness = evaluate_fitness(community); % implementar el forward propagation que calcule los errores de cada individuo.
  age = 0;
  while(!finished(community_fitness, max_generations, age, error)) % finished tiene que ser una funcion que evalue si hay que terminar, segun los criterios que dice en la consigna
    community = replace_method_1(community, community_fitness, pick_function, crossover_function, mutation_probability, mutation_function, ages_to_train, cross_probability, layerSizes, values, error);
    community_fitness = evaluate_fitness(community);
    fitness = max(community_fitness)
    age++;
  end

endfunction
