function transformed_locations = m1_transform_ecog_locations(locations,center)

settings = m1_settings;

switch center
    case 'UPMC'
        try
            mni=load(settings.grid.ecog.surface);
        catch
            mni=export(gifti(settings.grid.ecog.surface));
        end
        for a = 1:size(locations,2)
            [~,i] = min(pdist2(locations(:,a)'.*1.25,mni.vertices));
            transformed_locations(:,a) = mni.vertices(i,:);
        end
        
        
    otherwise
            mni = locations;
end