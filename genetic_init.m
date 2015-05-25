more off;
format long;
% load ourFunctionHomogenic.txt values;
x = -15 : 0.2 : 15
y = sin(x) + 6 * (cos(x) .^ 2);
values = [x' y'];
layerSizes = [1 25];
eta = 0.0001;
gValue = 1;
betaValue = 0.75;
error = 1;
momentum = 0.5;
etaAdaptativo = 0;
a = 0.0005;
b = 0.1;

functions{1, 1} = @tanhFunc;
functions{1, 2} = @derivativeTanh;
functions{2, 1} = @exponential;
functions{2, 2} = @exponentialDerivated;

g = functions{gValue, 1};
dg = functions{gValue, 2};

replace_method = 1;
community_size = 10;
parents_size = 5;
max_generations = 100;
mutation_probability = 0.01;
cross_probability = 0.75
pick_method = 1;
crossover_method = 1;
mutation_method = 1;

replace_methods = {@replace_method_1, @replace_method_2, @replace_method_3};
replace_function = replace_methods{replace_method};

pick_methods = {@elite, @roulette, @boltzmann, @tournaments, @mixed};
pick_function = pick_methods{pick_method};

crossover_methods = {@classic, @two_points, @uniform, @anular};
crossover_function = crossover_methods{crossover_method};

mutation_methods = {@one_gen_mutation, @multi_gen_mutation};
mutation_function = mutation_methods{mutation_method};

genetic_algorithm(mutation_function, crossover_function, replace_function, community_size, parents_size, max_generations, mutation_probability, pick_function, layerSizes, values, betaValue, g, error);

