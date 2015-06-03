# SIA-TPE2


### Installation ###

Clone the repository, make sure you have octave installed
 ```bash
   > sudo apt-get install octave
   > git clone https://github.com/NicoBuch/SIA-TPE2.git


## Running ##

  Open genetic_init.m file and change the following values:
    # Perceptron Parameters #
    - layerSizes : Sizes of the layers you want to try. Eg: [1 512 256 128 64 32 16 8]
      basePerceptron.eta : The value of the eta you want to try. Eg: 0.001
      gValue : Activation function. 1 for tanh and 2 for exp.
      basePerceptron.betaValue : beta value, to be used in, for example, tanh(beta * x) . Eg: 0.75
      error : Lower bound for the error. The perceptron will run until half cuadratic error is lower than this value. Eg: 1
      basePerceptron.momentum : Value of alpha in the momentum algorithm. Eg: 0.5
      basePerceptron.etaAdaptativo : Value of k in the Adaptative Eta algorithm. It measures how consistent the delta error has to be. Eg: 5
      basePerceptron.a : Value of "a" in Eta Adaptative. It is how much it adds when error is descending consistently. Eg: 0.0005
      basePerceptron.b : Value of "b" in Eta Adaptative. It is how much percentage of eta substracts when error is ascending. Eg: 0.1
      basePerceptron.noisePercentage = How much noise will be added to the weights in case it is needed. Eg: 0.01
      basePerceptron.minimumDeltaError = Minimum the error can change until it needs to add noise. Eg: 0.001

    # Genetic Parameters #
    - community_size : The total size of the population. For replace method 1, it MUST be an even number. Eg: 10
      parents_size : For replace methods 2 and 3. K individuals to be selected for the crossover. It MUST be an even number. Eg: 6
      mixed_params : Array that contains 2 values for the mixed selection method; first parameter is percentage that will be selected with elite, second parameter may be 1 for elite+universal, 2 for elite+roulette. Eg: [0.6]

      ages_to_train : Quantity of ages that an individual will be trained with backpropagation.Eg: 5
      max_generations : Maximum quantity of generations that the algorithm will run. Eg: 500
      structureQuantity : Number of individuals that must not change to finish running. Eg: 0.75 * community_size
      generations_without_change_criteria : Quantity of generations that the algorithm will run without changing its structure. Eg: 5
      max_fitness_without_change_criteria : Quantity of generations that the maximum fitness can stay without changing. Eg: 25

      replace_method : Replacement method chosen. Eg: 1
      pick_method : Selection method chosen. 1 -> elite, 2 -> roulette, 3 -> boltzmann, 4 -> tournaments, 5 -> mixed, 6 -> universal
      replace_pick_method : Replacement selection method. Same options than pick_method
      crossover_method : Crossover method chosen. 1 -> one point, 2 -> two points, 3 -> uniform, 4 -> anular
      mutation_method : Mutations method chosen. 1 -> classic, 2 -> not uniform

      mutation_probability : Probability of each gene to mutate. Eg: 0.1
      cross_probability : Probability of each pair of parents to be crossed and generate children. Eg: 0.75
      train_probability : Probability of each new individual to be trained. Eg: 0.85;

Run the algorithm
 ```bash
   > cd < path to /SIA-TPE2 >
   > octave genetic_init.m


## Maintainer ##

This project is maintained by [Nicolás Buchhalter](https://github.com/NicoBuch), [Agustina Fainguersch](https://github.com/agusfagus) and [Francisco Depascuali](https://github.com/frandepa).
