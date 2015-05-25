function community = replace_method_2(community, community_fitness, pick_function, crossover_function, mutation_probability, mutation_function, ages_to_train, cross_probability, layerSizes, values, error, parents_size)
	children = {};
    if(mod(parents_size, 2) == 1)
        disp("Para el metodo de reemplazo 2, la cantidad de progenitores debe ser par");
        exit
    end
    people = pick_function(community,parents_size, community_fitness); %implementar elite, ruleta, boltzman, torneos y mixto.
    while(length(children) < length(people))
    	father_index = randi(length(people));
    	mother_index = randi(length(people));
    	selected{1} = people{father_index};
    	selected{2} = people{mother_index};
        if(rand < cross_probability)
    	   new_children = crossover(selected, crossover_function); % implementar los algoritmos de cruza: clasico(un solo punto), dos puntos, uniforme, anular.
    	   children{end+1} = new_children{1};
    	   children{end+1} = new_children{2};
        end
    end
    mutants = mutate(children, mutation_probability, mutation_function); % mutacion clasica y no uniforme

    not_modified = pick_function(community, length(community) - parents_size, community_fitness);
    trained = train(mutants, layerSizes, values, ages_to_train, error);
    community = [not_modified trained];

endfunction
