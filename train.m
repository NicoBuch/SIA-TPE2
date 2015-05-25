function train(community, layerSizes, values, ages,error)
	for i = 1 : length(community)
		community{i} = multiLayerPerceptron(ages, vectorToWeights(community{i}.weightsVector,layerSizes), values, layerSizes, community{i}.eta, community{i}.betaValue, community{i}.g, community{i}.dg, error, community{i}.momentum, community{i}.etaAdaptativo, community{i}.a, community{i}.b, community{i}.minimumDeltaError, community{i}.noisePercentage);
	endfor
endfunction