function [A, b] = generate_probabilities_system(rows)
dim = rows*(rows+1)/2;
  A = zeros(dim, dim);
  A(1, 1) = 4;
  A(1, 2) = -1;
  A(1, 3) = -1;
  
  left=1;
  right=1;
  
 for r=2:(rows-1)
   left = left + r -1;
   right = right + r;
   for i=left:right
   if i == left
     A(i, i-r+1) = -1;
     A(i, i) = 5;
     A(i, i+1) = -1;
     A(i, i+r+1) = -1;
     A(i, i+r) = -1;
   else
     if i == right
       A(i, i-r) = -1;
       A(i, i - 1) = -1;
       A(i, i) = 5;
       A(i, i+r) = -1;
       A(i, i+r+1) = -1;
     else
       if i!=left && i !=right 
         A(i, i-r) = -1;
         A(i, i-r+1) = -1;
         A(i, i-1) = -1;
         A(i, i) = 6;
         A(i, i+1) = -1;
         A(i, i+r) = -1;
         A(i, i+r+1) = -1;
       endif
     endif
   endif
 endfor
endfor

p = r*(r+1)/2 + 1;

A(p, p) = 4;
A(p, p-r) = -1;
A(p, p+1) = -1;

A(p+r, p+r) = 4;
A(p+r, p-1) = -1;
A(p+r , p+r-1) = -1;

 for j=p+1:p+r-1
   A(j, j) = 5;
   A(j, j-r-1) = -1;
   A(j, j-r) = -1;
   A(j, j-1) = -1;
   A(j, j+1) = -1;
 endfor
 
 b = zeros(dim, 1);
 
 for i=p:p+r
   b(i, 1) = 1;
  endfor
endfunction