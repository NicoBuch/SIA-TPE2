function [child1 child2] = classic(father, mother)
  locus = randi(length(father.weightsVector));
  child1 = father;
  child2 = mother;
  child1.weightsVector(1:locus) = mother.weightsVector(1:locus);
  child2.weightsVector(1:locus) = father.weightsVector(1:locus);
endfunction
