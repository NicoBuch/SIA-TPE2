function people = mixed(community, picked_size, community_fitness, mixed_params)
  n1 = floor(mixed_params(1) * picked_size);
  elite_people = elite(community, n1, community_fitness);
  if(mixed_params(2) == 1)
    the_others = universal(community, picked_size - n1, community_fitness);
  else
    the_others = roulette(community, picked_size - n1, community_fitness);
  end
  people = [elite_people the_others];
endfunction
