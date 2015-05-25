function [child1 child2] = classic(father, mother)
  locus = randi(length(father.weightsVector));
  child1 = father;
  child2 = mother;
  for i = 1 : length(father.weightsVector)
    if(i < locus)
      aux = child1.weightsVector(i);
      child1.weightsVector(i) = child2.weightsVector(i);
      child2.weightsVector(i) = aux;
    endif
  endfor
endfunction
