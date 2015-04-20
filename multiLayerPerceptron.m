function multiLayerPerceptron(values, layerSizes, eta, beta, gFunction, error, momentum, etaAdaptativo)
	% Esta funcion calcula con valores random todas las matrices de pesos iniciales, dependiendo de el layerSizes (Array en el que cada valor reprresenta cantidad de neuronas por capa)
	% Devuelve en A un cell de matrices de pesos. (No olvidar el peso del umbral)
	W = initializeWeights(layerSizes);
  do
		age = 0;
    for i = 1: length(values)
			for j = 1 : (length(layerSizes))
				if (j == 1)
					H(j) = outValue(values(i, 1), W{j});
				elseif
					% outValue devuelve el producto escalar entre V(j-1) y la matriz de pesos (array que representa los valores de salida de la capa oculta)
		    	H(j) = outValue(V(j-1), W{j});
				endif
				V(j) = g(H(j), gFunction, beta);
			endfor
				delta(length(layerSizes)) = calculateLastDelta(H(length(layerSizes)), values(:, 2), V, gFunction);
				delta = calculateDeltas(H, W, delta);
		    W = updateWeights(W, eta, delta, V);
		endfor
    age += 1;
  until(compareOutValues(values(:, 2), output, error))
	% el compareOutValues de arriba devuelve true si los values comparados con el output tienen todos un error menor a "error"

endfunction

