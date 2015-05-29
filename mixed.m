function people = mixed(community, picked_size, community_fitness, mixed_params)
  elite_people = elite((community, mixed_params(1), community_fitness));
  if(mixed_params(2) == 1)
    the_others = universal((community, length(community) - mixed_params(1), community_fitness));
  else
    the_others = roulette((community, length(community) - mixed_params(1), community_fitness));
  end
  people = [elite_people the_others];
endfunction
