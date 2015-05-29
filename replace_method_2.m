function community = replace_method_2(community, community_fitness, pick_function, crossover_function, mutation_probability, mutation_function, ages_to_train, crossover_probability, layerSizes, values, error, parents_size, age, replace_pick_function, mixed_params)
	children = {};
    if(mod(parents_size, 2) == 1)
        disp("Para el metodo de reemplazo 2, la cantidad de progenitores debe ser par");
        exit
    end
    people = pick_function(community,parents_size, community_fitness, mixed_params); %implementar elite, ruleta, boltzman, torneos y mixto.
    iterVector = randperm(length(people));
    for i = 1 : length(people)/2
    	selected{1} = people{iterVector(i)};
    	selected{2} = people{iterVector(i + length(people)/2)};
        children = [children crossover(selected, crossover_function, crossover_probability)];
    end
    mutants = mutate(children, mutation_probability, mutation_function, age); % mutacion clasica y no uniforme
    not_modified = replace_pick_function(community, length(community) - parents_size, community_fitness, mixed_params);
    trained = train(mutants, layerSizes, values, ages_to_train, error);
    community = [not_modified trained];
endfunction
