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

g = functions{gValue, 1};
dg = functions{gValue, 2};

error = 0.0001;
betaValues = y ./ x;
betaValues(151) = 10;
% betaValues = ones(1, length(x));


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

ages_to_train = 2;
community_size = 10;
replace_method = 2;
parents_size = 8;
max_generations = 200;
mutation_probability = 0.1;
cross_probability = 0.75;
pick_method = 2;
replace_pick_method = 2;
crossover_method = 4;
mutation_method = 1;
structureQuantity = 0.75 * community_size;

replace_methods = {@replace_method_1, @replace_method_2, @replace_method_3};
replace_function = replace_methods{replace_method};

pick_methods = {@elite, @roulette, @boltzmann, @tournaments, @mixed};
pick_function = pick_methods{pick_method};
replace_pick_function = pick_methods{replace_pick_method};

crossover_methods = {@classic, @two_points, @uniform, @anular};
crossover_function = crossover_methods{crossover_method};

mutation_methods = {@multi_gen_classic_mutation, @multi_gen_not_uniform_mutation};
mutation_function = mutation_methods{mutation_method};
clf;
tic
genetic_algorithm(replace_pick_function, mutation_function, crossover_function, replace_function, community_size, parents_size, max_generations, mutation_probability, pick_function, ages_to_train, layerSizes, values, basePerceptron,error, cross_probability, structureQuantity)
toc;
