function [age, minFitness, meanFitness, fitness, weightsVector] = genetic_algorithm(replace_pick_function, mutation_function, crossover_function, replace_function, community_size, parents_size, max_generations, mutation_probability, pick_function, ages_to_train, layerSizes, values, basePerceptron,error, cross_probability, structureQuantity, mixed_params, generations_without_change_criteria, max_fitness_without_change_criteria, train_probability)
  community = generate_initial_community_frum(community_size, layerSizes, basePerceptron); %implementar una generacion de 'comunity_size' W cells randomly
  community = train(community, layerSizes, values,ages_to_train,error, 1);
  community_fitness = evaluate_fitness(community); % implementar el forward propagation que calcule los errores de cada individuo.
  last_community_fitness = community_fitness;
  fitness(1) = max(community_fitness);
  % minFitness(1) = min(community_fitness);
  % meanFitness(1) = mean(community_fitness);
  finish = false;
  age = 1;
  structureGenerationsWithoutChange = 0;
  maxFitnessWithoutChange = 0;
  finish = finished(community_fitness, last_community_fitness, max_generations, age, error, structureQuantity, generations_without_change_criteria, structureGenerationsWithoutChange, max_fitness_without_change_criteria,  maxFitnessWithoutChange);
  while(!finish)
    age = age + 1;
    last_community_fitness = community_fitness;
    community = replace_function(community, community_fitness, pick_function, crossover_function, mutation_probability, mutation_function, ages_to_train, cross_probability, layerSizes, values, error, parents_size, age, replace_pick_function, mixed_params, train_probability);
    community_fitness = evaluate_fitness(community);
    [fitness(age), max_index] = max(community_fitness);
    % minFitness(age) = min(community_fitness);
    % [meanFitness(age)] = mean(community_fitness);

    [finish, structureGenerationsWithoutChange, maxFitnessWithoutChange] = finished(community_fitness, last_community_fitness, max_generations, age, error, structureQuantity, generations_without_change_criteria, structureGenerationsWithoutChange, max_fitness_without_change_criteria,  maxFitnessWithoutChange);

   if(mod(age, 1) == 0)
      f = fitness(end)
      age
      % outValues
      i = max_index;
      outValues = forwardPropagation(vectorToWeights(community{i}.weightsVector,layerSizes), values(:, 1), length(layerSizes), community{i}.betaValue, community{i}.g);
      hold on;
      subplot(2,1,1)
      plot(values(:, 1), values(:,2), values(:,1), outValues);
      xlabel ("x");
      ylabel("f(x)");
      subplot(2,1,2);
      plot(1:age, fitness);
      xlabel("epoca");
      ylabel("Error");
      hold off;
      refresh;
    endif
  end
  weightsVector = community{max_index}.weightsVector;
  maxF = max(community_fitness)
  meanF = mean(community_fitness)
  minF = min(community_fitness)
endfunction


