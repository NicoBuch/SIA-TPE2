function [child1 child2] = uniform(father, mother)
 
    p = 0.5;

    child1 = father.weightsVector;
    child2 = mother.weightsVector;

    for i = 1:length(child1)
      if (rand < p)
        aux = child1(i);
        child1(i) = child2(i);
        child2(i) = aux;
      end
    end

endfunction