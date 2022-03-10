function [values, colind, rowptr] = matrix_to_csr(A)
  values= [];
  colind= [];
  rowptr = [];
  [x, y] = size (A);
  m = 1;
  n = 0;
  i = 1;
  while i <= x 
    p = 0;
    for j=1:y
      if A(i, j) != 0
      values(m) = A(i, j);
      colind(m) = j;
      m++;
      n++;
      if p == 0
        p = j;
        rowptr = [rowptr, n];
        endif
    endif
  endfor
  i++;
endwhile
rowptr = [rowptr, n+1];

    
endfunction