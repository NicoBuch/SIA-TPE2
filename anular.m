function [child1 child2] = anular(father, mother)

  child1 = father;
  child2 = mother;

  c1_weights = child1.weightsVector;
  c2_weights = child2.weightsVector;

  long = length(child1.weightsVector);

  locus = randi(long);
  segment = randi(long / 2);

  if(locus + segment + 1 > long)
    child1.weightsVector(locus: long) = c2_weights(locus: long);
    child2.weightsVector(locus: long) = c1_weights(locus: long);
    child1.weightsVector(1: (segment+1 - (long - locus))) = c2_weights(1: (segment+1 - (long - locus)));
    child2.weightsVector(1: (segment+1 - (long - locus))) = c1_weights(1: (segment+1 - (long - locus)));
  else
    child1.weightsVector(locus: locus + segment+1) = c2_weights(locus: locus + segment+1);
    child2.weightsVector(locus: locus + segment+1) = c1_weights(locus: locus + segment+1);
  end

endfunction
