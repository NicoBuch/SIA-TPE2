function people = tournaments(community, picked_size, community_fitness)

	m = 2;
	for i = 1 : picked_size
		index1 = randi(length(community));
		index2 = randi(length(community));
		indexes = [index1, index2];
		if(rand < 0.75)
			[maxi, index] = max([community_fitness(index1), community_fitness(index2)]);
		else
			[mini, index] = min([community_fitness(index1), community_fitness(index2)]);
		end
		people{i} = community{indexes(index)};
	end
endfunction
