function people = universal(community, picked_size, community_fitness)
  r = rand;

  total_fitness = sum(community_fitness);
  for i = 1 : length(community)
    if(i == 1)
      acummulated(i) = community_fitness(i) / total_fitness;
    else
      acummulated(i) = acummulated(i-1) + (community_fitness(i) / total_fitness);
    endif
  endfor

  for j = 1 : picked_size
    rj = (r + j -1) / k;
    index = min(find(acummulated > rj));
    people{j} = community{index};
  endfor

endfunction

