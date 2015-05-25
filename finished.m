function finished = finished(community_fitness, last_community_fitness, max_generations, age, error, structureQuantity)
	fitnessChanged = true;
	maxFitnessRemainsEqual = false;
	if(age != 0)
		fitnessChanged = compareFitnesses(community_fitness, last_community_fitness, structureQuantity);
		maxFitnessRemainsEqual = max(community_fitness) == max(last_community_fitness);
	endif
    finished = age >= max_generations || max(community_fitness) > (1/error) || maxFitnessRemainsEqual || !fitnessChanged;
endfunction
