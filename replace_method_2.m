function community = replace_method_2(community, community_fitness, pick_function, crossover_function, mutation_probability, mutation_function, k, ages_to_train, cross_probability, layerSizes, values, error)
	children = {};
    people = pick_function(community, k, community_fitness); %implementar elite, ruleta, boltzman, torneos y mixto.
    while(rand < cross_probability)
    	father_index = floor(rand() * length(people)) + 1;
    	mother_index = floor(rand() * length(people)) + 1;
    	selected{1} = people{father_index};
    	selected{2} = people{mother_index};

    	new_children = crossover(selected, crossover_function); % implementar los algoritmos de cruza: clasico(un solo punto), dos puntos, uniforme, anular.
    	children{end+1} = new_children{1};
    	children{end+1} = new_children{2};
    end
  mutants = mutate(children, mutation_probability, mutation_function); % mutacion clasica y no uniforme
  community = train(mutants, layerSizes, values, ages_to_train, error);


endfunction