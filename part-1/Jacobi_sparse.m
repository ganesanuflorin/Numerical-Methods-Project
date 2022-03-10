function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
    [l col] = size(G_rowptr);
 x0 = zeros(1, col - 1);
 x = csr_multiplication(G_values, G_colind, G_rowptr, x0) + c;
 while 1 
   if norm(x - x0) < tol
     break
   endif   
   x0 = x;
   x = csr_multiplication(G_values, G_colind, G_rowptr, x0) + c;
 endwhile
endfunction