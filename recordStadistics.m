more off;
format long;
warning ("off", "Octave:broadcast");
% load ourFunctionHomogenic.txt values;
x = -15 : 0.1 : 15;
y = sin(x) + 6 * (cos(x) .^ 2);
% y  = (sin(x) .* x.^3 + x/2);
% y = sin(x + 2*x.^2 + 3*x.^3);
y = y ./ max(abs(y));
values = [x' y'];
gValue = 1;
layerSizes = [1 25];

functions{1, 1} = @tanhFunc;
functions{1, 2} = @derivativeTanh;
functions{2, 1} = @exponential;
functions{2, 2} = @exponentialDerivated;

error = 0.1;
betaValues = y ./ x;
betaValues(151) = 10;
% betaValues = ones(1, length(x));


basePerceptron1.eta = 0.025;
basePerceptron1.betaValues = betaValues;
basePerceptron1.momentum = 0.75;
basePerceptron1.etaAdaptativo = 0;
basePerceptron1.a = 0;
basePerceptron1.b = 0;
basePerceptron1.g = functions{1, 1};
basePerceptron1.dg = functions{1, 2};
basePerceptron1.noisePercentage = 0;
basePerceptron1.minimumDeltaError = 0;

basePerceptron2.eta = 0.1;
basePerceptron2.betaValues = betaValues;
basePerceptron2.momentum = 0.9;
basePerceptron2.etaAdaptativo = 5; % no varia
basePerceptron2.a = 0.05; % no varia
basePerceptron2.b = 0.2; % no varia
basePerceptron2.g = functions{1, 1};
basePerceptron2.dg = functions{1, 2};
basePerceptron2.noisePercentage = 0;
basePerceptron2.minimumDeltaError = 0;

basePerceptron3.eta = 0.025;
basePerceptron3.betaValues = betaValues;
basePerceptron3.momentum = 0.75;
basePerceptron3.etaAdaptativo = 0;
basePerceptron3.a = 0;
basePerceptron3.b = 0;
basePerceptron3.g = functions{2, 1};
basePerceptron3.dg = functions{2, 2};
basePerceptron3.noisePercentage = 0;
basePerceptron3.minimumDeltaError = 0;

basePerceptron4.eta = 0.1;
basePerceptron4.betaValues = betaValues;
basePerceptron4.momentum = 0.9;
basePerceptron4.etaAdaptativo = 5; % no varia
basePerceptron4.a = 0.05; % no varia
basePerceptron4.b = 0.2; % no varia
basePerceptron4.g = functions{2, 1};
basePerceptron4.dg = functions{2, 2};
basePerceptron4.noisePercentage = 0;
basePerceptron4.minimumDeltaError = 0;

max_generations = 1;
generations_without_change_criteria = 10;
max_fitness_without_change_criteria = 6;


ages_to_train_vec = [2 10];
community_sizes = [20 80];
parents_sizes = [0.6 0.9];
mutation_probabilities = [0.1 0.01];
cross_probabilities = [0.6 0.95];
mixed_params = [4 1];

replace_methods = {@replace_method_1, @replace_method_2, @replace_method_3};
pick_methods = {@elite, @roulette, @boltzmann, @tournaments, @mixed};
crossover_methods = {@classic, @two_points, @uniform, @anular};
mutation_methods = {@multi_gen_classic_mutation, @multi_gen_not_uniform_mutation};
% base_perceptrons = {basePerceptron1, basePerceptron2, basePerceptron3, basePerceptron4};
base_perceptrons = {basePerceptron1, basePerceptron2};

for basePerceptron = 1 : length(base_perceptrons)
	delete(strcat("results base perceptron", num2str(basePerceptron)));
	diary(strcat("results base perceptron", num2str(basePerceptron)));
	base_perceptron = base_perceptrons{basePerceptron};
	for mutationProbability = 1 : length(mutation_probabilities)
		disp("-----------------------------------------------------------------------------------------")
		mutation_probability = mutation_probabilities(mutationProbability)
		for crossProbability = 1 : length(cross_probabilities)
			disp("-----------------------------------------------------------------------------------------")
			printf("\t");
			cross_probability = cross_probabilities(crossProbability)
			for replaceMethod = 1 : length(replace_methods)
				disp("-----------------------------------------------------------------------------------------")
				printf("\t\t");
				replace_function = replace_methods{replaceMethod}
				for pickMethod = 1 : length(pick_methods)
					disp("-----------------------------------------------------------------------------------------")
					printf("\t\t\t");
					pick_function = pick_methods{pickMethod}
					for replacePickFunction = 1 : length(pick_methods)
						disp("-----------------------------------------------------------------------------------------")
						printf("\t\t\t\t");
						replace_pick_function = pick_methods{replacePickFunction}
						for crossOverMethod = 1 : length(crossover_methods)
							disp("-----------------------------------------------------------------------------------------")
							printf("\t\t\t\t\t");
							crossover_function = crossover_methods{crossOverMethod}
							for mutationMethod = 1 : length(mutation_methods)
								disp("-----------------------------------------------------------------------------------------")
								printf("\t\t\t\t\t\t");
								mutation_function = mutation_methods{mutationMethod}
								for communitySize = 1 : length(community_sizes)			
									best_fitness_community = 0;
									community_size = community_sizes(communitySize);
									structureQuantity = 0.75 * community_size;
									answer = getBestValuesForCommunity(replace_pick_function, mutation_function, crossover_function, replace_function, community_size, parents_sizes, max_generations, mutation_probability, pick_function, ages_to_train_vec, layerSizes, values, base_perceptron,error, cross_probability, structureQuantity,mixed_params,generations_without_change_criteria,max_fitness_without_change_criteria);
									printf("\t\t\t\t\t\t\t");
									community_size
									printf("\t\t\t\t\t\t\t");
									age = answer.bestAge
									printf("\t\t\t\t\t\t\t");
									parentSize = answer.bestParentSize
									printf("\t\t\t\t\t\t\t");
									max_fitness = answer.max_fitness
									printf("\t\t\t\t\t\t\t");
									min_fitness = answer.min_fitness
									printf("\t\t\t\t\t\t\t");
									mean_fitness = answer.mean_fitness
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