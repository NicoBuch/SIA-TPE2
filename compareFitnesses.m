function fitnessChanged = compareFitnesses(community_fitness, last_community_fitness, structureQuantity)
	notChanged = 0;
	for i = 1:length(community_fitness)
		if(community_fitness(i) == last_community_fitness(i))
			notChanged += 1;
			if(notChanged == structureQuantity)
				fitnessChanged = false;
				return;
			endif
		endif
	endfor
	fitnessChanged = true;
endfunction