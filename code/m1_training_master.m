clear all;close all;
%% need to add the code folder to path
settings = m1_settings;
files = m1_import_training_data;
close all
full = m1_offline_datastream(1);
figure
m1_plot_surface([squeeze(nanmean(nanmean(full.epochs.data(:,wjn_sc(full.epochs.time,0):wjn_sc(full.epochs.time,1),:,ci('full_beta',full.frequencies),ci('correlation',full.measures)),1),2)) full.grid']);
hold on
m1_plot_spheres(full.info.ecog.location,[1 0 0],5)
colormap('jet')
caxis([-.25 .25])
camlight
close all
for a =1:length(full.stream)
[X,y]=m1_extract_feature_table(fullfile(full.info.raw_dir,full.stream(a).fname),{'alpha','full_beta','full_gamma'},'variance');

X=table2array(X);
X(isnan(X))=0;
mdl=fitlm(X,y.data);

figure,plot(full.stream(a).time,y.data),hold on,plot(full.stream(a).time,mdl.predict)
title(strrep(full.stream(a).fname,'_',' '))
end