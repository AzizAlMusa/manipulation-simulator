function tmap = transform_map(transformations)
%Provides the transformation for each link in the chain

%Input:
%transformations - a 1xn cell array of transformations for each link
%respectively

tmap = transformations;

for i=1:numel(tmap)-1
   tmap{i+1} = tmap{i} * tmap{i+1}; 
end

end

