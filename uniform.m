function [child1 child2] = uniform(father, mother)

    p = 0.5;

    child1 = father;
    child2 = mother;

    for i = 1:length(child1)
      if (rand < p)
        aux = child1.weightsVector(i);
        child1.weightsVector(i) = child2.weightsVector(i);
        child2.weightsVector(i) = aux;
      end
    end

endfunction
