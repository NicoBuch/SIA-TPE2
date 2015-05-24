function children = classic(father, mother)
  total_lengths(1) = rows(father{1}) * columns(father{1});
  for i = 2 : length(father)
    total_lengths(end+1) = rows(father{i}) * columns(father{i});
  endfor
  locus = randi(sum(total_lengths));
  children = {father, mother};
  for i = 1 : sum(total_lengths)
    if(i < locus)
      for j = 1 : length(total_lengths)
        if(i <= sum(total_lengths(1: j)))
          aux = children{1}{j}(mod(i,total_lengths(j)+1));
          children{1}{j}(mod(i,total_lengths(j)+1)) = children{2}{j}(mod(i,total_lengths(j)+1));
          children{2}{j}(mod(i,total_lengths(j)+1)) = aux;
          break;
        endif
      endfor
    endif
  endfor
endfunction
