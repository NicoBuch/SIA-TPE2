function people = tournaments(community, picked_size, community_fitness)	

	for i = 1 : picked_size
		person1index = floor(rand()*length(community)) + 1;
		person2index = floor(rand()*length(community)) + 1;
		
		if rand() < 0.75
			if(community_fitness{person1index} > community_fitness{person2index})
				people{i} = community{person1index};
			else
				people{i} = community{person2index};
			endif
		else
			if(community_fitness{person1index} < community_fitness{person2index})
				people{i} = community{person1index};
			else
				people{i} = community{person2index};
			endif
		endif
	endfor
endfunction