function people = elite(community, picked_size, community_fitness)

  [fitnesses, indexes] = sort(community_fitness, 'descend');
  people = {community{indexes(1:picked_size)}};
endfunction
