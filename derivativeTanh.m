function der = derivativeTanh(a, h)
	der = realpow(sech(a*h), 2);
end
