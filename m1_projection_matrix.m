function [projection_matrix,summed_projection_matrix,distance_matrix] = crcns_inmovenet_create_projection_matrix(locations,grid,max_distance)

distance_matrix = pdist2(locations',grid');
projection_matrix = 1./distance_matrix.*(distance_matrix<=max_distance);
for a = 1:size(projection_matrix,1)
    projection_matrix(a,:) = projection_matrix(a,:)./nanmax(projection_matrix(a,:));
end
        
summed_projection_matrix = nansum(projection_matrix);
summed_projection_matrix = summed_projection_matrix./nanmax(summed_projection_matrix);