function [finish, structureGenerationsWithoutChange, maxFitnessWithoutChange] = finished(community_fitness, last_community_fitness, max_generations, age, error, structureQuantity, generationsWithoutChangeCriteria,structureGenerationsWithoutChange, maxFitnessWithoutChangeCriteria, maxFitnessWithoutChange)
	if(age == 1)
		finish = max(community_fitness) > (1/error);
		return
	endif
	fitnessChanged = compareFitnesses(community_fitness, last_community_fitness, structureQuantity);
	maxFitnessRemainsEqual = max(community_fitness) == max(last_community_fitness);
	if(!fitnessChanged)
		structureGenerationsWithoutChange +=1;
	else structureGenerationsWithoutChange = 0;
	endif
	if(maxFitnessRemainsEqual)
		maxFitnessWithoutChange +=1;
	else maxFitnessWithoutChange = 0;
	endif
  	finish = age >= max_generations || max(community_fitness) > (1/error) || (structureGenerationsWithoutChange >= generationsWithoutChangeCriteria) || (maxFitnessWithoutChange >= maxFitnessWithoutChangeCriteria);
  % finished = max(community_fitness) > (1/error);
endfunction
