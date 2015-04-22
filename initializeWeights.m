function W = initializeWeights(layerSizes)
	W = cell(1, length(layerSizes) - 1);
	for i = 1 : (length(layerSizes) - 1)
		W{i} = rand(layerSizes(i+1), layerSizes(i) + 1) - 0.5;
	endfor
endfunction
