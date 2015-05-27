more off;
format long;
% load ourFunctionHomogenic.txt values;
x = -1 : 0.01 : 1;
% y = sin(x) + 6 * (cos(x) .^ 2);
% y  = (sin(x) .* x.^3 + x/2);
y = sin(x + 2*x.^2 + 3*x.^3);
% y = y ./ max(abs(y));
values = [x' y'];
gValue = 1;
layerSizes = [1 15];

functions{1, 1} = @tanhFunc;
functions{1, 2} = @derivativeTanh;
functions{2, 1} = @exponential;
functions{2, 2} = @exponentialDerivated;

g = functions{gValue, 1};
dg = functions{gValue, 2};

error = 0.0025;

basePerceptron.eta = 0.025;
basePerceptron.betaValue = 1;
basePerceptron.momentum = 0.75;
basePerceptron.etaAdaptativo = 0;
basePerceptron.a = 0.0005;
basePerceptron.b = 0.1;
basePerceptron.g = g;
basePerceptron.dg = dg;
basePerceptron.noisePercentage = 0;
basePerceptron.minimumDeltaError = 0;

ages_to_train = 10;
community_size = 20;
replace_method = 3;
parents_size = 10;
max_generations = 200;
mutation_probability = 0.1;
cross_probability = 0.75;
pick_method = 1;
crossover_method = 1;
mutation_method = 1;
structureQuantity = 0.75 * community_size;

replace_methods = {@replace_method_1, @replace_method_2, @replace_method_3};
replace_function = replace_methods{replace_method};

pick_methods = {@elite, @roulette, @boltzmann, @tournaments, @mixed};
pick_function = pick_methods{pick_method};

crossover_methods = {@classic, @two_points, @uniform, @anular};
crossover_function = crossover_methods{crossover_method};

mutation_methods = {@one_gen_mutation, @multi_gen_mutation};
mutation_function = mutation_methods{mutation_method};
clf;
tic
genetic_algorithm(mutation_function, crossover_function, replace_function, community_size, parents_size, max_generations, mutation_probability, pick_function, ages_to_train, layerSizes, values, basePerceptron,error, cross_probability, structureQuantity)
toc;
