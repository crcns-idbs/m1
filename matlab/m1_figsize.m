function m1_figsize(height,width)
if ~exist('width','var')
    width = 8.9;
end
set(gcf,'Units','centimeters','PaperUnits','centimeters','Position',[50 50 width height],'PaperPosition',[5 5 width height],'PaperPositionMode','auto','PaperSize',[1+width 1+height])
findfigs;