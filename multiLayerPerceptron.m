function multiLayerPerceptron(values, layerSizes, eta, beta, gValue, error, momentum, etaAdaptativo)
	% Esta funcion calcula con valores random todas las matrices de pesos iniciales, dependiendo de el layerSizes (Array en el que cada valor reprresenta cantidad de neuronas por capa)
	% Devuelve en A un cell de matrices de pesos. (No olvidar el peso del umbral)
	W = initializeWeights(layerSizes);
  do
		age = 0;
		H = cell(1, length(layerSizes));
		V = cell(1, length(layerSizes));
    for i = 1: length(values)
			for j = 1 : (length(layerSizes))
				if (j == 1)
					H{j} = outValue(values(i, 1), W{j});
				elseif
					% outValue devuelve el producto escalar entre V(j-1) y la matriz de pesos (array que representa los valores de salida de la capa oculta)
		    	H{j} = outValue(V{j-1}, W{j});
				endif
				V{j} = g(H{j}, gValue, beta);
			endfor
				delta{length(layerSizes)} = calculateLastDelta(H{length(layerSizes)}, values(:, 2), V{length(layerSizes)}, gValue);
				for k = 1: length(layerSizes)
				delta{length(layerSizes) - k}() = calculateDeltas(H{length(layerSizes) - k }, W{length(layerSizes) - k + 1}, delta{length(layerSizes) - k + 1});
				endfor
		    W = updateWeights(W, eta, delta, V);
		endfor
    age += 1;
  until(compareOutValues(values(:, 2), output, error))
	% el compareOutValues de arriba devuelve true si los values comparados con el output tienen todos un error menor a "error"

endfunction

