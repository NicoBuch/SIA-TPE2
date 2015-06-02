function people = boltzmann(community, picked_size, community_fitness, mixed_params,age)
  T = 1;
  if(age != 0)
    T = 100000 / age;
  end
  boltzmann_values = exp(community_fitness / T);
  boltzmann_values = boltzmann_values / mean(boltzmann_values);

  people = roulette(community, picked_size, boltzmann_values);

endfunction
