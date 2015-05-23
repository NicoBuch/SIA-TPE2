function finished = finished(community_fitness, max_generations, age, error)
  finished = age >= max_generations || avg(community_fitness) <= error
endfunction
