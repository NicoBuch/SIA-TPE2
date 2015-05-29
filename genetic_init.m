more off;
format long;
warning ("off", "Octave:broadcast");
% load ourFunctionHomogenic.txt values;
x = -5 : 0.1 : 5;
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

g = functions{gValue, 1};
dg = functions{gValue, 2};

error = 0.0001;
% betaValues = y ./ x;
% betaValues(151) = 10;
betaValues = ones(1, length(x));


basePerceptron.eta = 0.025;
basePerceptron.betaValues = betaValues;
basePerceptron.momentum = 0.75;
basePerceptron.etaAdaptativo = 0;
basePerceptron.a = 0.05;
basePerceptron.b = 0.2;
basePerceptron.g = g;
basePerceptron.dg = dg;
basePerceptron.noisePercentage = 0;
basePerceptron.minimumDeltaError = 0;

community_size = 10;
parents_size = 8;
mixed_params = [4 1];  % first parameter is N1. second parameter: 1 for universal, 2 for roulette.


ages_to_train = 2;
max_generations = 200;
structureQuantity = 0.75 * community_size;

replace_method = 2;
pick_method = 3;
replace_pick_method = 1;
crossover_method = 4;
mutation_method = 1;

mutation_probability = 0.1;
cross_probability = 0.75;

replace_methods = {@replace_method_1, @replace_method_2, @replace_method_3};
pick_methods = {@elite, @roulette, @boltzmann, @tournaments, @mixed};
crossover_methods = {@classic, @two_points, @uniform, @anular};
mutation_methods = {@multi_gen_classic_mutation, @multi_gen_not_uniform_mutation};

replace_function = replace_methods{replace_method};
pick_function = pick_methods{pick_method};
replace_pick_function = pick_methods{replace_pick_method};
crossover_function = crossover_methods{crossover_method};
mutation_function = mutation_methods{mutation_method};


clf;
tic
genetic_algorithm(replace_pick_function, mutation_function, crossover_function, replace_function, community_size, parents_size, max_generations, mutation_probability, pick_function, ages_to_train, layerSizes, values, basePerceptron,error, cross_probability, structureQuantity, mixed_params)
toc;
