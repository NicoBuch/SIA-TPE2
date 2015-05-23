function children = classic(father, mother)
  total_lengths(1) = rows(father{1}) * columns(father{1});
  for i = 2 : length(father)
    total_lengths(end+1) = rows(father{i}) * columns(father{i});
  endfor
  locus = randi(sum(total_lengths));
  children = {father, mother};
  for i = 1 : sum(total_lengths)
    if(locus <= i)
      for j = 1 : length(total_lengths)
        if(i < total_lengths(j))
          aux = father{j}(mod(i,j));
          father{j}(mod(i,j)) = mother{j}(mod(i,j));
          mother{j}(mod(i,j)) = aux;
        endif
      endfor
    endif
  endfor
endfunction
