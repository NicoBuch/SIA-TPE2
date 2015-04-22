% datos utiles:
% M es la cantidad de capas (sin contar la primera)
% H es un cell array de M arrays
% H{i} es un array que es el resultado de haber hecho matriz de peso * el valor de las unidades de entrada
% V es un cell array de M arrays 
% V{i} es un array igual a H pero todos los elementos evaluados en g

% delta es un cell array de M arrays
% delta{i} es un array de la i-esima capa con un delta por cada unidad de esa capa

% W es un cell array de M matrices
% W{i} es una matriz de k * (N+1). k va a representar cada nodo de la capa DESTINO de W(i), y N la cantidad de nodos de la capa ORIGEN de W (+1 por el umbral). 

%cosas utiles:
% El V evaluado en la capa ORIGEN, osea el v(i) va a ser de tamaño (N+1) (sirve saber esto para la mult de matrices con W y V)

% no se porque cuando se pasa un solo punto en values falla **




function multiLayerPerceptron(values, layerSizes, eta, gValue, a, error, momentum, etaAdaptativo)
	% Esta funcion calcula con valores random todas las matrices de pesos iniciales, dependiendo de el layerSizes (Array en el que cada valor reprresenta cantidad de neuronas por capa)
	% Devuelve en A un cell de matrices de pesos. (No olvidar el peso del umbral)
	W = initializeWeights(layerSizes);
	finish = 0;
	M = length(layerSizes);
  %functions{1, 1} = @tanhFunc;
  %functions{1, 2} = @derivativeTanh;

  % functions{1, 1} = @exponential;
  % functions{1, 2} = @exponentialDerivated;

  %g = functions{gValue, 1};
	age = 0;
	oldOutValues = 0;
  do
  %values = [-1 1 1; 1 -1 1; -1 -1 -1; 1 1 -1];
  values = [0 1 1; 1 0 1; 0 0 0; 1 1 0];
    for i = 1: length(values)
			inp = [values(i, 1) values(i, 2)]';
			inp(end+1, 1) = -1;
			for j = 1 : M
				if (j == 1)
					H{j} = outValue(inp, W{j});
				else
					% outValue devuelve el producto escalar entre V(j-1) y la matriz de pesos (array que representa los valores de salida de la capa oculta)
		    	H{j} = outValue(V{j-1}, W{j});
				endif
				% V{j} = g(H{j}, gValue, bet);
%				V{j} = tanh(H{j}*a);
				V{j} = (1 + exp(-2*H{j}*a)) .^ -1;
				if(j != M)
					V{j}(end + 1, 1) = -1;
				endif		
			endfor
			outValues(i, 1) = V{M};
			delta{M} = calculateLastDelta(values(i, 3), V{M}, gValue, a);
			for m = M : -1 : 2
				delta{m-1} = calculateDeltas(V{m-1}, W{m}, delta{m}, gValue, a);
			endfor
			W = updateWeights(W, eta, delta, V, inp);
		endfor
    age = age + 1;
    %plot(values(:, 1), values(:,2), values(:,1), outValues);
 	until(compareOutValues(values(:, 3), outValues, error))
 	age
 	
 	disp("He aprendido!"), disp("\n")
 	inp = input("Ingresa el valor que desea probar\n")';
 			inp(end+1, 1) = -1;
			for j = 1 : M
				if (j == 1)
					HT{j} = outValue(inp, W{j});
				else
					% outValue devuelve el producto escalar entre V(j-1) y la matriz de pesos (array que representa los valores de salida de la capa oculta)
		    	HT{j} = outValue(VT{j-1}, W{j});
				endif
				% V{j} = g(H{j}, gValue, bet);
%				V{j} = tanh(H{j}*a);
				VT{j} = (1 + exp(-2*HT{j}*a)) .^ -1;
				if(j != M)
					VT{j}(end + 1, 1) = -1;
				endif
			endfor
			if(VT{M} >= 0.5)
				disp("El valor de retorno es 1")
			else
				disp("El valor de retorno es 0")
			endif
			
	% el compareOutValues de arriba devuelve true si los values comparados con el output tienen todos un error menor a "error"
endfunction

