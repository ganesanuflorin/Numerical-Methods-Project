function [G_J, c_J] = Jacobi_factorization(A, b)
  dim = length(A);
  D = zeros(dim,dim);
  for i=1:dim
    D(i, i) = A(i, i);
    A(i, i) = 0;
  endfor
  A = A*(-1);
  for i=1:dim
    D(i, i) = 1/D(i, i);
  endfor
  G_J = D*A;
  c_J = D*b;
endfunction
