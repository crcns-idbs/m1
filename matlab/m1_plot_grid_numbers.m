function [grid,h]=m1_plot_grid_numbers

settings = m1_settings;
grid = settings.grid.full.bilateral;
clear h
figure
h.surface = m1_plot_surface(settings.grid.ecog.surface,[1:78]',grid(:,1:78)','nearest',0);
colormap('bone');caxis([-30 100])
%h.surface.FaceAlpha = .2;
hold on
h.spheres=m1_plot_colored_spheres(grid',[1:length(grid)]',5);
for a = 1:size(grid,2)
    text(grid(1,a),grid(2,a),grid(3,a)+6,num2str(a),'color','w')
end

