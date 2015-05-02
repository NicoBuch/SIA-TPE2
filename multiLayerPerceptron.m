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

function multiLayerPerceptron(W,values, layerSizes, eta, gValue, betaValue, error, momentum, etaAdaptativo, a, b)
	% Esta funcion calcula con valores random todas las matrices de pesos iniciales, dependiendo de el layerSizes (Array en el que cada valor reprresenta cantidad de neuronas por capa)
	% Devuelve en A un cell de matrices de pesos. (No olvidar el peso del umbral)
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
  age = 0;
  do
    previousW = W;
    iterVector = randperm(length(values));
    for i = iterVector;
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
	  outValues = forwardPropagation(W, values, M, betaValue, g);
    age = age + 1;
  	[finished, errorr] = compareOutValues(values(:, 2), outValues, error);
  	errors(end+1) = errorr;
    if (etaAdaptativo != 0)
      actualError = errorr;
      if(etaIterator != 0)
        deltaError =  actualError - previousError;
        if(deltaError < 0)
          previousError = actualError;
          momentum = initialMomentum;
          if(etaIterator >= etaAdaptativo)
            eta = eta + a;
          else
            etaIterator = etaIterator + 1;
          endif
        elseif (deltaError > 0)
          errors(end) = previousError;
          momentum = 0;
          W = previousW;
          eta = eta - b*eta;
          etaIterator = 1;
        else
          etaIterator = 1;
        endif
      else
        previousError = actualError;
        etaIterator = etaIterator + 1;
      endif
    endif
  	if(mod(age, 5) == 0)
  		% outValues
  		err = errors(end)
  		age
     	eta
      hold on;
      subplot(2,1,1)
      plot(values(:, 1), values(:,2), values(:,1), outValues);
      xlabel ("x");
      ylabel("f(x)");
      subplot(2,1,2);
      plot(1 : age, errors);
      xlabel("epoca");
      ylabel("Error");
      hold off;
    	refresh;
    endif
  until(finished)
  age
  err = errors(end)
  initialMomentum
  etaAdaptativo
  a
  b
endfunction

