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





function multiLayerPerceptron(values, layerSizes, eta, gValue, betaValue, error, momentum, etaAdaptativo, a, b, randomParam)
	% Esta funcion calcula con valores random todas las matrices de pesos iniciales, dependiendo de el layerSizes (Array en el que cada valor reprresenta cantidad de neuronas por capa)
	% Devuelve en A un cell de matrices de pesos. (No olvidar el peso del umbral)
	W = initializeWeights(layerSizes);
  previousDeltaW = W;
	M = length(layerSizes);
  firstTime = 0;
  etaIterator = 0;
  initialMomentum = momentum;

  functions{1, 1} = @tanhFunc;
  functions{1, 2} = @derivativeTanh;
  functions{2, 1} = @exponential;
  functions{2, 2} = @exponentialDerivated;

  g = functions{gValue, 1};
  if (randomParam == 0)
	  iterLength = 1 : length(values);
  elseif(randomParam == 1)
    iterLength = randperm(length(values));
  endif
  age = 0;
  do
    previousW = W;
    for i = iterLength
      inp = values(i, 1);
      inp(end+1, 1) = -1;
      for j = 1 : M
        if (j == 1)
          H{j} = outValue(inp, W{j});
        else
          H{j} = outValue(V{j-1}, W{j});
        endif
        if(j == M)
          V{j} = H{j};
        else
          V{j} = g(betaValue, H{j});
        endif
        if(j != M)
          V{j}(end + 1, 1) = -1;
        endif
      endfor
      delta{M} = calculateLastDelta(values(i, 2), V{M}, gValue);
      for m = M : -1 : 2
        delta{m-1} = calculateDeltas(V{m-1}, W{m}, delta{m}, functions{gValue, 2}, betaValue);
      endfor
      [W, previousDeltaW] = updateWeights(W, eta, delta, V, inp, momentum, previousDeltaW, firstTime);
      firstTime = 1;
    endfor
		outValues = calculateOutValues(W, values, M, betaValue, gValue);
    if (etaAdaptativo != 0)
      if(etaIterator != 0)
        deltaError = halfCuadraticError(values(:, 2), outValues) - previousError;
        if(deltaError < 0)
          previousError = halfCuadraticError(values(:, 2), outValues);
          momentum = initialMomentum;
          if(etaIterator == etaAdaptativo)
            eta = eta + a;
          else
            etaIterator = etaIterator + 1;
          endif
        elseif (deltaError > 0)
          momentum = 0;
          W = previousW;
          eta = eta - b*eta;
          etaIterator = 0;
        else
          etaIterator = 0;
        endif
      else
        previousError = halfCuadraticError(values(:, 2), outValues);
        etaIterator = etaIterator + 1;
      endif
    endif
		if(mod(age, 50) == 0)
			% outValues
			err = halfCuadraticError(values(:, 2), outValues)
			age
      eta
		endif
    age = age + 1;
  until(compareOutValues(values(:, 2), outValues, error) || age == 500)
  plot(values(:, 1), values(:,2), values(:,1), outValues);
endfunction

