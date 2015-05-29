function answer = getBestValuesForCommunity(replace_pick_function, mutation_function, crossover_function, replace_function, community_size, parents_sizes, max_generations, mutation_probability, pick_function, ages_to_train_vec, layerSizes, values, base_perceptron,error, cross_probability, structureQuantity)
	answer.best_fitness = 0;
	for parentSize = 1 : length(parents_sizes)
		parents_size = parents_sizes(parentSize) * community_size;
		for agesToTrain = 1 : length(ages_to_train_vec)
			ages_to_train = ages_to_train_vec(agesToTrain);
			[age, minFitness, meanFitness, fitness] = genetic_algorithm(replace_pick_function, mutation_function, crossover_function, replace_function, community_size, parents_size, max_generations, mutation_probability, pick_function, ages_to_train, layerSizes, values, base_perceptron,error, cross_probability, structureQuantity);
			if(fitness > answer.best_fitness)
				answer.bestParentSize = parents_size;
				answer.bestAge = age;
				answer.max_fitness = fitness;
				answer.min_fitness = minFitness;
				answer.mean_fitness = meanFitness;
			endif
		endfor
	endfor
endfunction