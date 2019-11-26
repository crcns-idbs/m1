function s=m1_plot_colored_spheres(mni,v,r,clim)

if ~exist('r','var')
    r=1;
end

[x,y,z]=sphere;

cmap = colormap;

if exist('v','var') && length(v)==size(mni,1)
    
    if ~exist('clim','var')
        clim = [nanmin(v) nanmax(v)];
    end
    
    vec = linspace(clim(1),clim(2),size(cmap,1));
    
    for a = 1:length(v)
        v(a) = wjn_sc(vec,v(a));
    end
    
    cc=1;

    
    
elseif exist('v','var')
    cmap=repmat(v,size(mni,1),1);
    v=1:size(cmap,1);
    cc=0;
else
    cmap=[1 0 0];
    v =ones(size(mni,1));
    cc=0;
end
    
for a = 1:size(mni,1)
    s(a)=surf(r.*x+mni(a,1),r.*y+mni(a,2),r.*z+mni(a,3),'FaceColor',cmap(v(a),:),'EdgeColor','none','FaceLighting','gouraud');
    hold on
end
axis equal



if cc
    cc=colorbar;cc.Color = 'w';
    cc.TickLabels=  num2str(linspace(clim(1),clim(2),length(cc.Ticks))',2);
end

