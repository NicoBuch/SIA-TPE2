function [child1 child2] = anular(father, mother)

  child1 = father.weightsVector;
  child2 = mother.weightsVector;

  locus = rand * (length(child1) + 1);

  s1 = p1_weights;
  s2 = p2_weights;


endfunction
