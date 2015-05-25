function [child1 child2] = two_points(father, mother)


  p1_weights = father.weightsVector;
  p2_weights = mother.weightsVector;


  locus1 = randi(length(p1_weights));
  locus2 = randi(length(p1_weights));

  if(locus1 > locus2)
    max_locus = locus1;
    min_locus = locus2;
  else
    max_locus = locus2;
    min_locus = locus1;
  endif

  child1 = father;
  child2 = mother;

  child1.weightsVector(min_locus:max_locus) = p2_weights(min_locus:max_locus);
  child2.weightsVector(min_locus:max_locus) = p1_weights(min_locus:max_locus);

endfunction
