clear all;close all;clc;
%% ADD CODE TO PATH
gitdir  = fullfile('E:', 'GitHub');
addpath(genpath(fullfile(gitdir,'m1','code')))
%% RUN THROUGH ALL SUBJECTS
settings = m1_settings;
files = m1_import_training_data;
full = m1_offline_datastream;
save full full -v7.3
%% PLOT GRID CONFIG
m1_plot_grid_numbers
myprint('GRID NUMBERS')   
%% LOAD DATA STREAMS
clear all, close all, clc
addpath(fullfile(gitdir,'m1','code'))
settings = m1_settings;
subject_root = settings.dir.subject_root;
streams = wjn_subdir(fullfile(subject_root,'stream*.mat'));
timerange = [-1 2];
freqrange = {'theta','alpha','low_beta','high_beta','low_gamma','high_gamma'};
gridrange = 1:length(settings.grid.full.index);
padding  = 10;

alldata =[]; allmovements=[];id=[];
for nstreams =1:length(streams)   
        stream = load(streams{nstreams});
        time = stream.epochs.time;
        toi = wjn_sc(time,timerange(1)):wjn_sc(time,timerange(2));
        foi = ci(freqrange,stream.frequencies);
        time = time(toi(1)-padding:toi(end)+padding);
        data = stream.epochs.data(:,toi,gridrange,foi);
        padsize = size(data); padsize(2) = padding;
        padded_data=permute(cat(2,zeros(padsize),data,zeros(padsize)),[3 4 2 1]);
        movement = stream.epochs.movement(:,toi)'./prctile(stream.epochs.movement(:),99);
        padsize = size(movement); padsize(1) = padding;
        padded_movement = cat(1,zeros(padsize), movement,zeros(padsize));
        id = cat(1,id',[repmat(str2num(stream.subject.ID(2:end)),[size(data,1),1]) repmat(nstreams,[size(data,1),1])])';   
        alldata=cat(4,alldata,padded_data);
        allmovements=cat(2,allmovements,padded_movement);
        disp(['READ STREAM:' num2str(nstreams)  ' / ' num2str(length(streams)) ' - ' num2str(nstreams/length(streams)*100,2) ' %'])
end
%% PLOT GRAND AVERAGES
figure
imagesc(time,1:length(freqrange),squeeze(nanmedian(nanmedian(alldata(:,:,:,:),4),1)));axis xy
hold on
p=plot(time,nanmedian(allmovements,2)+1,'color','k','linewidth',3,'linestyle','--');
xlim([timerange(1) timerange(2)])
set(gca,'YTick',1:length(freqrange),'YTickLabel',[strrep(freqrange,'_',' ')],'YTickLabelRotation',45)
legend(p,'Force');colorbar;figone(7)
%% PLOT POWER GRIDS
close all; clc; avgtime = [0 0.5];
for nfrequencies = 1:size(alldata,2)
    for ngridpoints = 1:size(alldata,1)
        avg(ngridpoints,nfrequencies) = squeeze(nanmedian(nanmedian(alldata(ngridpoints,nfrequencies, wjn_sc(time,avgtime):wjn_sc(time,avgtime),:),4),3));
    end
    avg(isnan(avg))=0;
    figure
    [p,~,v]=m1_plot_surface(settings.grid.ecog.surface,avg(:,nfrequencies),settings.grid.full.bilateral');
    hold on
    m1_plot_colored_spheres(settings.grid.full.bilateral',avg(:,nfrequencies),3,[-.5 .5])
    caxis([min(v) max(v)]);
    title(strrep(freqrange{nfrequencies},'_',' '),'color','w')
    myprint(['POWER SURFACE ' freqrange{nfrequencies}])
end
%% TRAIN LINEAR MODEL
for a = 1:size(alldata,1)
    X = squeeze(alldata(a,:,:));
    y = allmovements(:);
    mdl=fitlm(X',y');
    [~,~,~,auc(a)]=perfcurve(y'>0,mdl.predict,1);
    beta(a) = mdl.Coefficients.tStat(5);
    gamma(a) = mdl.Coefficients.tStat(7);
end

auc(auc<0.5)=0.5;

figure
[p,~,v]=m1_plot_surface(settings.grid.ecog.surface,auc',settings.grid.full.bilateral','natural');caxis([.5 .9])
hold on
m1_plot_colored_spheres(settings.grid.full.bilateral',auc',5,[.5 .9])
caxis([.5 .9]);
title('AUC','color','w')
myprint('AUC SURFACE')
%%

for ngridpoints=1:length(settings.grid.full.index)

nnX=nX;
inan=isnan(nX(:,1));
nnX(inan,:)=[];
nny = ny;
nny(inan) = [];
nid = id;
nid(inan,:) = [];
if ~isempty(nnX)
  

delays = [0:5];
dX=[];
for a = 1:length(delays)
dX =[dX nnX(delays(a)+1:end-delays(end)+delays(a),:)];
end
nnX=dX;
nny = nny(delays(end)+1:end);
did = nid(delays(end)+1:end,:);


regnet=wjn_nn_raw_timedelay(nnX,nny,0,[10 12 6],30);

patnet=wjn_nn_raw_patternnet(nnX,nny>0,0,[10 12 6],30);



node(b).time = linspace(0,length(nny)/10,length(nny));
node(b).regnet = regnet;
node(b).patnet = patnet;

node(b).testInd = zeros(size(nny));
node(b).testInd(node(b).regnet.testInd)=1;
node(b).trainInd = zeros(size(nny));
node(b).trainInd([node(b).regnet.trainInd node(b).regnet.valInd])=1;
node(b).n = nn;  
i = find(node(b).regnet.trainInd);
ti = find([node(b).regnet.valInd node(b).regnet.testInd]);

node(b).regnet_r2 = corr(node(b).regnet.predict(ti),nny(ti))^2;
[node(b).patnet_fpr,node(b).patnet_tpr,node(b).patnet.thr,node(b).patnet_auc] = perfcurve(nny(ti)'>0,node(b).patnet.predict(ti)',1);


node(b).lm.mdl = fitlm(nnX(i,:),nny(i));
node(b).lm.predict = node(b).lm.mdl.predict(nnX);
node(b).lm_r2 = corr(node(b).lm.predict(ti),nny(ti))^2;

node(b).ll.mdl = fitglm(dX(i,:),nny(i)>0,'Distribution','binomial');
node(b).ll.predict = node(b).ll.mdl.predict(dX);
node(b).ll_r2 = corr(node(b).ll.predict(ti),nny(ti))^2;
[node(b).ll_fpr,node(b).ll_tpr,node(b).ll.thr,node(b).ll_auc] = perfcurve(nny(ti)'>0,node(b).ll.predict(ti)',1);

figure
models = {'ll','patnet'};

for a =1:length(models)
plot(node(b).([models{a} '_fpr']),node(b).([models{a} '_tpr']),'linewidth',2);
hold on
lname{a} = [models{a} ' AUC: ' num2str( node(b).([models{a} '_auc']),2)];
end
plot([0 1],[0 1],'linestyle','--','color',[.5 .5 .5])
figone(7)
xlabel('False Positive Rate')
ylabel('True Positive Rate')
title(['Node ' num2str(b) ])
legend(lname,'Location','SouthEast');
myprint(fullfile('testROC',['Node ' num2str(b)]))


end
node(b).i = find(~inan);
node(b).nsamples = size(nny,1);
node(b).nstreams = numel(unique(nid(:,2)));
node(b).nsubjects = numel(unique(nid(:,1)));


end

dummy = zeros(size(settings.grid.full.index));
i = setdiff(1:length(settings.grid.full.bilateral),[23 32 62 71]);
nsubjects=dummy;
nsubjects(i) = [node(:).nsubjects];
nstreams=dummy;
nstreams(i) = [node(:).nstreams];
nn_auc=dummy;
nn_auc(i) = [node(:).tdnet_auc];
nn_r2=dummy;
nn_r2(i) = [node(:).tdnet_r2];

figure
m1_plot_surface;
hold on;
s1=m1_plot_colored_spheres(settings.grid.full.bilateral',nsubjects,5,[0 16]);


figure
m1_plot_surface;
hold on;
s1=m1_plot_colored_spheres(settings.grid.full.bilateral',nstreams,5,[0 72]);

figure
m1_plot_surface;
hold on;
s1=m1_plot_colored_spheres(settings.grid.full.bilateral',nn_auc,5,[.5 .85]);

figure
m1_plot_surface;
hold on;
s1=m1_plot_colored_spheres(settings.grid.full.bilateral',nn_r2,5,[0 .3]);




% 
% n=0;nodes=struct;
% for a = 1:length(node)
%     if isfield(node(a),'tdnet')
%         n=n+1;
%         fnames = fieldnames(node(a));
%         for b = 1:length(fnames)
%         nodes(n).(fnames{b})=node(a).(fnames{b});
%         if isfield(nodes(n).(fnames{b}),'r2')
%             nodes(n).([fnames{b} '_auc']) = nodes(n).(fnames{b}_auc;
%         end
%         end
%         nodes(n).node=a;
%         
%     end
% end

save nodes2 node -v7.3



%% TRAIN A TIMEDELAY NET
clear all
close all,
clc

addpath(fullfile(gitdir,'m1','code'))
settings = m1_settings;

files = wjn_subdir('stream*.mat');
%files(ci('DBS4020',files))=[]
b=0;
for nn=1:length(settings.grid.full.index)
      b=b+1;
nX=[];ny=[];id=[];
for a =1:length(files)
        
        [Xv,y,subject]=m1_extract_feature_table(files{a},{'theta','alpha','low_beta','high_beta','full_beta','low_gamma','high_gamma','full_gamma'},{'variance'},nn);
        Xv=table2array(Xv);
        id = cat(1,id,[repmat(str2num(subject.ID(2:end)),[size(Xv,1),1]) repmat(a,[size(Xv,1),1])]);   
        nX=cat(1,nX,[Xv]);
        %ny = cat(1,ny,y.data);
        ny = cat(1,ny,y.data./prctile(y.data,99));
        disp(['Node: ' num2str(nn) ' of ' num2str(length(settings.grid.full.index)) ' / ' num2str(a/length(files)*100) ' %'])
end

nnX=nX;
inan=isnan(nX(:,1));
nnX(inan,:)=[];
nny = ny;
nny(inan) = [];
nid = id;
nid(inan,:) = [];
if ~isempty(nnX)
  

delays = [0];
dX=[];
for a = 1:length(delays)
dX =[dX nnX(delays(a)+1:end-delays(end)+delays(a),:)];
end
nnX=dX;
nny = nny(delays(end)+1:end);
did = nid(delays(end)+1:end,:);


regnet=wjn_nn_raw_timedelay(nnX,nny,0,[1],30);

patnet=wjn_nn_raw_patternnet(nnX,nny>0,0,[1],30);



node(b).time = linspace(0,length(nny)/10,length(nny));
node(b).regnet = regnet;
node(b).patnet = patnet;

node(b).testInd = zeros(size(nny));
node(b).testInd(node(b).regnet.testInd)=1;
node(b).trainInd = zeros(size(nny));
node(b).trainInd([node(b).regnet.trainInd node(b).regnet.valInd])=1;
node(b).n = nn;  
i = find(node(b).regnet.trainInd);
ti = find([node(b).regnet.valInd node(b).regnet.testInd]);

node(b).regnet_r2 = corr(node(b).regnet.predict(ti),nny(ti))^2;
[node(b).patnet_fpr,node(b).patnet_tpr,node(b).patnet.thr,node(b).patnet_auc] = perfcurve(nny(ti)'>0,node(b).patnet.predict(ti)',1);


node(b).lm.mdl = fitlm(nnX(i,:),nny(i));
node(b).lm.predict = node(b).lm.mdl.predict(nnX);
node(b).lm_r2 = corr(node(b).lm.predict(ti),nny(ti))^2;

node(b).ll.mdl = fitglm(dX(i,:),nny(i)>0,'Distribution','binomial');
node(b).ll.predict = node(b).ll.mdl.predict(dX);
node(b).ll_r2 = corr(node(b).ll.predict(ti),nny(ti))^2;
[node(b).ll_fpr,node(b).ll_tpr,node(b).ll.thr,node(b).ll_auc] = perfcurve(nny(ti)'>0,node(b).ll.predict(ti)',1);

% figure
% models = {'ll','patnet'};
% 
% for a =1:length(models)
% plot(node(b).([models{a} '_fpr']),node(b).([models{a} '_tpr']),'linewidth',2);
% hold on
% lname{a} = [models{a} ' AUC: ' num2str( node(b).([models{a} '_auc']),2)];
% end
% plot([0 1],[0 1],'linestyle','--','color',[.5 .5 .5])
% figone(7)
% xlabel('False Positive Rate')
% ylabel('True Positive Rate')
% title(['Node ' num2str(b) ])
% legend(lname,'Location','SouthEast');
% %myprint(fullfile('testROC',['Node ' num2str(b)]))


end
node(b).i = find(~inan);
node(b).nsamples = size(nny,1);
node(b).nstreams = numel(unique(nid(:,2)));
node(b).nsubjects = numel(unique(nid(:,1)));


end

dummy = zeros(size(settings.grid.full.index));
i = setdiff(1:length(settings.grid.full.bilateral),[23 32 62 71]);
nsubjects=dummy;
nsubjects= [node(:).nsubjects];
nstreams=dummy;
nstreams = [node(:).nstreams];
nn_auc=dummy;
nn_auc = [node(:).tdnet_auc];
nn_r2=dummy;
nn_r2 = [node(:).tdnet_r2];

figure
m1_plot_surface;
hold on;
s1=m1_plot_colored_spheres(settings.grid.full.bilateral',nsubjects,5,[0 16]);


figure
m1_plot_surface;
hold on;
s1=m1_plot_colored_spheres(settings.grid.full.bilateral',nstreams,5,[0 72]);

figure
m1_plot_surface;
hold on;
s1=m1_plot_colored_spheres(settings.grid.full.bilateral',nn_auc,5,[.5 .85]);

figure
m1_plot_surface(settings.grid.ecog.surface,CCunits.e01(1:78),settings.grid.ecog.bilateral');
hold on;
caxis([0 .5])
s1=m1_plot_colored_spheres(settings.grid.full.bilateral',CCunits.e01,5,[0 .5]);
myprint('CC')




% 
% n=0;nodes=struct;
% for a = 1:length(node)
%     if isfield(node(a),'tdnet')
%         n=n+1;
%         fnames = fieldnames(node(a));
%         for b = 1:length(fnames)
%         nodes(n).(fnames{b})=node(a).(fnames{b});
%         if isfield(nodes(n).(fnames{b}),'r2')
%             nodes(n).([fnames{b} '_auc']) = nodes(n).(fnames{b}_auc;
%         end
%         end
%         nodes(n).node=a;
%         
%     end
% end

%save nodes2 node -v7.3

