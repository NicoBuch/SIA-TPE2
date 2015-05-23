function people = roulette(community, picked_size, community_fitness)
  randoms = rand(1,picked_size);
  total_fitness = sum(community_fitness);
  for i = 1 : length(community)
    if(i == 1)
      acummulated(i) = community_fitness(i) / total_fitness;
    else
      acummulated(i) = acummulated(i-1) + (community_fitness(i) / total_fitness);
    endif
  endfor

  for i = 1 : picked_size
    index = min(find(acummulated > randoms(i)));
    people{i} = community{index};
  endfor
endfunction
