% datos utiles:
% M es la cantidad de capas (sin contar la primera)
% H es un cell array de M arrays
% H(i) es un array que es el resultado de haber hecho matriz de peso * el valor de las unidades de entrada
% V es un cell array de M arrays 
% V{i} es un array igual a H pero todos los elementos evaluados en g

% delta es un cell array de M arrays
% delta{i} es un array de la i-esima capa con un delta por cada unidad de esa capa

% W es un cell array de M matrices
% W(i) es una matriz de k * (N+1). k va a representar cada nodo de la capa DESTINO de W(i), y N la cantidad de nodos de la capa ORIGEN de W (+1 por el umbral). 

%cosas utiles:
% El V evaluado en la capa ORIGEN, osea el v(i) va a ser de tamaño (N+1) (sirve saber esto para la mult de matrices con W y V)





function multiLayerPerceptron(values, layerSizes, eta, gValue, betaValue, error, momentum, etaAdaptativo, randomParam)
	% Esta funcion calcula con valores random todas las matrices de pesos iniciales, dependiendo de el layerSizes (Array en el que cada valor reprresenta cantidad de neuronas por capa)
	% Devuelve en A un cell de matrices de pesos. (No olvidar el peso del umbral)
	W = initializeWeights(layerSizes);

	M = length(layerSizes);
	
  %functions{1, 1} = @tanhFunc;
  %functions{1, 2} = @derivativeTanh;

  % functions{1, 1} = @exponential;
  % functions{1, 2} = @exponentialDerivated;

  %g = functions{gValue, 1};
  if (randomParam == 0)
	  iterLength = length(values);
  else if(randomParam == 1)
	  iterLength = randperm(length(values));
  	endif
  endif
  age = 0;
  do
    for i = 1: iterLength
			inp = values(i, 1);
			inp(end+1, 1) = -1;
			for j = 1 : M
				if (j == 1)
					H{j} = outValue(inp, W{j});
				else
					% outValue devuelve el producto escalar entre V(j-1) y la matriz de pesos (array que representa los valores de salida de la capa oculta)
		    	H{j} = outValue(V{j-1}, W{j});
				endif
				if(j == M)
					V{j} = H{j};
				else
					V{j} = tanh(H{j}*betaValue);
					%V{j} = (1 + exp(-2*H{j}*a)) .^ -1;
				endif
				if(j != M)
					V{j}(end + 1, 1) = -1;
				endif
				% printf("nivel: %d \n", j);
% 				V{j}
% 				printf("\n");
			endfor
			outValues(i, 1) = V{M};
			delta{M} = calculateLastDelta(values(i, 2), V{M}, gValue);
			for m = M : -1 : 2
				delta{m-1} = calculateDeltas(V{m-1}, W{m}, delta{m}, gValue, betaValue);
			endfor
		  W = updateWeights(W, eta, delta, V, inp, momentum);
		endfor
		if(mod(age, 100) == 0)
			% outValues
			err = halfCuadraticError(values(:, 2), outValues)
			age
		endif
    age = age + 1;
  until(compareOutValues(values(:, 2), outValues, error) || age == 1000)
    plot(values(:, 1), values(:,2), values(:,1), outValues);
	% el compareOutValues de arriba devuelve true si los values comparados con el output tienen todos un error menor a "error"
endfunction

