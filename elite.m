function people = elite(community, picked_size, community_fitness)

  people_fitness = community_fitness(1: picked_size);
  people = {community{1: picked_size}};
  for i = picked_size : length(community_fitness)
    [minimum, min_index] = min(people_fitness);
    if(community_fitness(i) > minimum)
      people_fitness(min_index) = community_fitness(i);
      people{min_index} = community{i};
    end
  end

endfunction
