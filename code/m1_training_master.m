clear all;close all;
%% need to add the code folder to path
addpath(fullfile(gitdir,'m1','code'))
settings = m1_settings;
files = m1_import_training_data;
close all
full = m1_offline_datastream;
save full full -v7.3

%% plot average linear regression coefficient across all frequency bands on surface
mbeta =[];beta=[];r=[];
for a =1:8
X=squeeze(full.data(:,ci(settings.grid.ecog.index,settings.grid.full.index),a,2));
X(isnan(X))=0;
mdl = fitlm(X,full.movement);
beta(a,:) = mdl.Coefficients.Estimate(2:end);
r(a) = mdl.Rsquared.Ordinary;
mbeta(a,:) = abs(beta(a,:));
end

figure
m1_plot_surface
hold on
m1_plot_spheres(settings.grid.ecog.bilateral,nansum(mbeta),5)
camlight
%% TRAIN A TIMEDELAY NET
clear all
close all
nX=[];ny=[];
addpath(fullfile(gitdir,'m1','code'))
settings = m1_settings;
load full.mat
for a =1:length(full.stream)
    %if sum(full.stream(a).grid(1,full.stream(a).active_nodes))<0

      [Xv,y]=m1_extract_feature_table(fullfile(full.stream(a).subject.raw_dir,full.stream(a).fname),{'low_beta','high_beta','low_gamma','high_gamma'},{'correlation','variance'});

        Xv=table2array(Xv);
        nX=cat(1,nX,[Xv]);
        ny = cat(1,ny,y.data);
        disp(a)
    %end
end
nX(isnan(nX))=0;
keep nX ny
net=wjn_nn_raw_timedelay(nX,ny,[1 3],[25]);


