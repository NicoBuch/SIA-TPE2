function community =  generate_initial_community_frum(communitySize, layerSizes, basePerceptron)
  for i = 1 : communitySize
    community{i}.weightsVector = weightsToVector(initializeWeights(layerSizes));
	  community{i}.eta = basePerceptron.eta;
	  community{i}.betaValues = basePerceptron.betaValues;
	  community{i}.momentum = basePerceptron.momentum;
	  community{i}.etaAdaptativo = basePerceptron.etaAdaptativo;
	  community{i}.a = basePerceptron.a;
	  community{i}.b = basePerceptron.b;
	  community{i}.g = basePerceptron.g;
	  community{i}.dg = basePerceptron.dg;
	  community{i}.noisePercentage = basePerceptron.noisePercentage;
	  community{i}.minimumDeltaError = basePerceptron.minimumDeltaError;
  endfor
endfunction
