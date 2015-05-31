more off;
format long;
warning ("off", "Octave:broadcast");
% load ourFunctionHomogenic.txt values;
x = -4 : 0.1 : 4;
y = tanh(0.1 * x) + sin(3*x);
% y  = (sin(x) .* x.^3 + x/2);
% y = sin(x + 2*x.^2 + 3*x.^3);
y = y ./ max(abs(y));
values = [x' y'];
gValue = 1;
layerSizes = [1 15 5];

functions{1, 1} = @tanhFunc;
functions{1, 2} = @derivativeTanh;
functions{2, 1} = @exponential;
functions{2, 2} = @exponentialDerivated;

error = 1 / (200 ** 2);
% betaValue = y ./ x;
% betaValue(151) = 10;
% betaValue = ones(1, length(x));
betaValue = 0.5;

basePerceptron1.eta = 0.01;
basePerceptron1.betaValue = 0.5;
basePerceptron1.momentum = 0.9;
basePerceptron1.etaAdaptativo = 0;
basePerceptron1.a = 0;
basePerceptron1.b = 0;
basePerceptron1.g = functions{1, 1};
basePerceptron1.dg = functions{1, 2};
basePerceptron1.noisePercentage = 0;
basePerceptron1.minimumDeltaError = 0;

basePerceptron2.eta = 0.1;
basePerceptron2.betaValue = betaValue;
basePerceptron2.momentum = 0.9;
basePerceptron2.etaAdaptativo = 5; % no varia
basePerceptron2.a = 0.05; % no varia
basePerceptron2.b = 0.2; % no varia
basePerceptron2.g = functions{1, 1};
basePerceptron2.dg = functions{1, 2};
basePerceptron2.noisePercentage = 0;
basePerceptron2.minimumDeltaError = 0;

basePerceptron3.eta = 0.025;
basePerceptron3.betaValue = betaValue;
basePerceptron3.momentum = 0.75;
basePerceptron3.etaAdaptativo = 0;
basePerceptron3.a = 0;
basePerceptron3.b = 0;
basePerceptron3.g = functions{2, 1};
basePerceptron3.dg = functions{2, 2};
basePerceptron3.noisePercentage = 0;
basePerceptron3.minimumDeltaError = 0;

basePerceptron4.eta = 0.1;
basePerceptron4.betaValue = betaValue;
basePerceptron4.momentum = 0.9;
basePerceptron4.etaAdaptativo = 5; % no varia
basePerceptron4.a = 0.05; % no varia
basePerceptron4.b = 0.2; % no varia
basePerceptron4.g = functions{2, 1};
basePerceptron4.dg = functions{2, 2};
basePerceptron4.noisePercentage = 0;
basePerceptron4.minimumDeltaError = 0;

max_generations = 500;
generations_without_change_criteria = 10;
max_fitness_without_change_criteria = 20;

% ages_to_train_vec = [2 10];
% community_sizes = [10 20];
% parents_sizes = [0.6 0.8];
% mutation_probabilities = [0.1 0.01];
% cross_probabilities = [0.6 0.95];
% mixed_params = [4 1];
ages_to_train_vec = [2];
community_sizes = [10];
parents_sizes = [0.6];
mutation_probabilities = [0.1];
cross_probabilities = [0.75];
mixed_params = [4 1];

replace_methods = {@replace_method_2};
pick_methods = {@elite, @boltzmann};
crossover_methods = {@two_points};
mutation_methods = {@multi_gen_classic_mutation};
% base_perceptrons = {basePerceptron1, basePerceptron2, basePerceptron3, basePerceptron4};
base_perceptrons = {basePerceptron1};

for basePerceptron = 1 : length(base_perceptrons)
	base_perceptron = base_perceptrons{basePerceptron};
	delete(strcat("results base perceptron", num2str(basePerceptron)));
	diary(strcat("results base perceptron", num2str(basePerceptron)));
	for mutationProbability = 1 : length(mutation_probabilities)
		mutation_probability = mutation_probabilities(mutationProbability)
		for crossProbability = 1 : length(cross_probabilities)
			cross_probability = cross_probabilities(crossProbability)
			for replaceMethod = 1 : length(replace_methods)
				replace_function = replace_methods{replaceMethod}
				for pickMethod = 1 : length(pick_methods)
					pick_function = pick_methods{pickMethod}
					for replacePickFunction = 1 : length(pick_methods)
						replace_pick_function = pick_methods{replacePickFunction}
						for crossOverMethod = 1 : length(crossover_methods)
							crossover_function = crossover_methods{crossOverMethod}
							for mutationMethod = 1 : length(mutation_methods)
								mutation_function = mutation_methods{mutationMethod}
								for communitySize = 1 : length(community_sizes)
									best_fitness_community = 0;
									community_size = community_sizes(communitySize);
									structureQuantity = 0.75 * community_size;
									for parentSize = 1 : length(parents_sizes)
										parents_size = parents_sizes(parentSize) * community_size;
										for agesToTrain = 1 : length(ages_to_train_vec)
											ages_to_train = ages_to_train_vec(agesToTrain);
											[age, minFitness, meanFitness, fitness] = genetic_algorithm(replace_pick_function, mutation_function, crossover_function, replace_function, community_size, parents_size, max_generations, mutation_probability, pick_function, ages_to_train, layerSizes, values, base_perceptron,error, cross_probability, structureQuantity, mixed_params, generations_without_change_criteria, max_fitness_without_change_criteria);
											% if(fitness > answer.best_fitness)
				% 								answer.bestParentSize = parents_size;
				% 								answer.bestAge = age;
				% 								answer.max_fitness = fitness;
				% 								answer.min_fitness = minFitness;
				% 								answer.mean_fitness = meanFitness;
				% 							endif
										endfor
									endfor
									disp("-------------------------------------------------------")
									community_size
									age
									min=minFitness(end)
									mean=meanFitness(end)
									max=fitness(end)
									disp("-------------------------------------------------------")
								endfor
							endfor
						endfor
					endfor
				endfor
			endfor
		endfor
	endfor
	diary off;
endfor
