function [finish, structureGenerationsWithoutChange, maxFitnessWithoutChange] = finished(community_fitness, last_community_fitness, max_generations, age, error, structureQuantity, generationsWithoutChangeCriteria,structureGenerationsWithoutChange, maxFitnessWithoutChangeCriteria, maxFitnessWithoutChange)
	if(age == 1)
		finish = max(community_fitness) > (1/(error^2));
		return
	endif
	finish = 0;
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
	if(age >= max_generations)
		disp("Maxima cantidad de generaciones alcanzada");
		finish = 1;
	elseif(max(community_fitness) > (1/(error^2)))
		disp("Fitness maximo alcanzado");
		finish = 1;
	elseif(structureGenerationsWithoutChange >= generationsWithoutChangeCriteria)
		disp("La gran mayoria de los individuos no cambiaron");
		finish = 1;
	elseif(maxFitnessWithoutChange >= maxFitnessWithoutChangeCriteria)
		disp("El fitnes maximo no cambio");
  	finish = 1;
  end
endfunction
