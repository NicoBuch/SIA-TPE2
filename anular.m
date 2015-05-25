function [child1 child2] = anular(father, mother)

  p1_weights = father.weightsVector;
  p2_weights = mother.weightsVector;

  locus = (rand()* (length(p1_weights) + 1);

  s1 = p1_weights;
  s2 = p2_weights;

  for i = 0:selectedPoint(2)
    index = mod(selectedPoint(1) +i ,length(serializedP1)) + 1;
    s1(index) = serializedP2(index);
    s2(index) = serializedP1(index);
  end

  s1 = deserializePerceptron(s1, r, c, l);
  s2 = deserializePerceptron(s2, r, c, l);

endfunction