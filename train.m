function community = train(community, layerSizes, values, ages, error, train_probability)
  for i = 1 : length(community)
    if(rand < train_probability)
		  community{i} = multiLayerPerceptron(ages, vectorToWeights(community{i}.weightsVector,layerSizes), values, layerSizes, community{i}.eta, community{i}.betaValue, community{i}.g, community{i}.dg, error, community{i}.momentum, community{i}.etaAdaptativo, community{i}.a, community{i}.b, community{i}.minimumDeltaError, community{i}.noisePercentage);
    else
      outValues = forwardPropagation(vectorToWeights(community{i}.weightsVector,layerSizes), values(:, 1), length(layerSizes), community{i}.betaValue, community{i}.g);
      [finished, previousError] = compareOutValues(values(:, 2), outValues, error);
      community{i}.error = previousError;
    end
  endfor
endfunction
