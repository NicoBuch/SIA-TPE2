function [child1 child2] = two_points(father, mother)


  p1_weights = father.weightsVector;
  p2_weights = mother.weightsVector;
  

  locus1 = (rand()* (length(p1_weights) + 1);
  locus2 = rand()* (length(p1_weights) + 1);

  if(locus1 > locus2)
    max_locus = locus1;
    min_locus = locus2;
  else
    max_locus = locus2;
    min_locus = locus1;
  endif 

  child1 = p1_weights;
  child2 = p2_weights;

  child1(min_locus:max_locus) = p2_weights(min_locus:max_locus);
  child2(min_locus:max_locus) = p1_weights(min_locus:max_locus);

endfunction