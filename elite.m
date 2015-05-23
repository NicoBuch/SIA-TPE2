function people = elite(community, picked_size, community_fitness)
  for i = 1 : length(community)
    if i <= picked_size
      people(i) = community(i);
      people_fitness(i) = community_fitness(i);
    else
      [minimum, index] = min(people_fitness);
      if(community_fitness(i) > minimum)
        people(index) = community(i);
        people_fitness(index) = community_fitness(i);
      endif
    endif
  endfor
endfunction
