function [cost] = compute_cost_pc(points, centroids)
  clusters = zeros(size(centroids));
  cost = 0;
 

 for i = 1:size(points(:, 1)) 
   min = realmax;
   
   for j = 1:size(centroids(:, 1))
     if norm(abs(centroids(j, :) - points(i, :))) < min 
       min = norm(abs(centroids(j, :) - points(i, :)));
     endif    
   endfor  
   cost = min + cost;
 endfor
 
endfunction

