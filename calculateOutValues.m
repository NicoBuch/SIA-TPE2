function outValues = calculateOutValues(W, values, M, betaValue, gFunction)
	for i = 1 : length(values)
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
		endfor
		outValues(i, 1) = V{M};
	endfor
endfunction
