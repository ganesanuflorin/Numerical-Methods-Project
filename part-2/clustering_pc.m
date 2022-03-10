function [centroids] = clustering_pc(points, NC)
  % Functie pentru algoritmul KMEANS.
  % Imi setez un numar maxim de iteratii pentru algoritm, numarul de puncte,
  % aleg random primii centroizi.
%  maxSteps = 100;
  nrPoints = length(points(:,1));
%  firstCenters = randperm(length(points(:,1)));
%  centroids = points(firstCenters(1:NC), :); 
  clusterSize = zeros(NC, 1);
  sum = zeros(NC, length(points(1, :)));
  
  % Imi creez un vector assigns care imi va retine in ce cluster se va afla
  % fiecare punct.
	assigns = [];
  
  for i = 1:nrPoints
    j = mod(i, NC);
    if(j == 0)
      clusterSize(NC) = clusterSize(NC) + 1;
      sum(NC, :) = sum(NC, :) + points(i, :);
    else
    
    clusterSize(j) = clusterSize(j) + 1;
    sum(j, :) = sum(j, :) + points(i, :);
    endif
    
  endfor
  
  for i = 1:NC
    firstCenters(i, :) = sum(i, :) / clusterSize(i);
  endfor
  [x,y]=size(points);
  
  centroids = firstCenters;
  [m,n]=size(centroids);
  newcentroids = zeros(m,n);
  
    newcentroids1 = centroids;
   
  while norm(abs(newcentroids1 - newcentroids)) > eps
    newcentroids1=centroids;
    newcentroids=zeros(m,n);
		clusterSize = zeros(NC, 1);
		for j = 1 : x
      minValue = realmax;
			
			for k = 1 : NC 
        if norm(points(j,:) - centroids(k,:)) < minValue
					minValue = norm(points(j,:) - centroids(k,:));
					clusterTo = k;
				endif
			endfor
			newcentroids(clusterTo, :) = newcentroids(clusterTo, :) + points(j, :);
			++clusterSize(clusterTo);
		endfor
    
    
		for i=1:NC
      if clusterSize(i)!=0
        newcentroids(i,:)=newcentroids(i,:)/clusterSize(i);
        else
        newcentroids(i)=0;
      endif
    endfor
    centroids=newcentroids;
  endwhile
   newcentroids=zeros(m,n);
		clusterSize = zeros(NC, 1);
		for j = 1 : x
      minValue = realmax;
			
			for k = 1 : NC 
        if norm(points(j,:) - centroids(k,:)) < minValue
					minValue = norm(points(j,:) - centroids(k,:));
					clusterTo = k;
				endif
			endfor
			newcentroids(clusterTo, :) = newcentroids(clusterTo, :) + points(j, :);
			++clusterSize(clusterTo);
		endfor
    
		for i=1:NC
      if clusterSize(i)!=0
        newcentroids(i,:)=newcentroids(i,:)/clusterSize(i);
        else
        newcentroids(i)=0;
      endif
    endfor
    centroids=newcentroids;
endfunction
