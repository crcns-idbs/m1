
tic
clear all;close all;
%% need to add the code folder to path
gitdir  = fullfile('E:', 'GitHub');
addpath(genpath(fullfile(gitdir,'m1','code')))
settings = m1_settings;
files = m1_import_training_data(16);
close all
full = m1_offline_datastream(16);
save full full -v7.3
toc
%% plot average linear regression coefficient across all frequency bands on surface
mbeta =[];beta=[];r=[];
close all
for a =1:size(full.data,2)
    for b = 1:size(full.data,3)
    X=squeeze(full.data(:,a,b));
    inan = isnan(X);
    X(inan)=[];
    Y=full.movement;
    Y(inan) = [];
    if ~isempty(X)
    mdl = fitglm(X,Y>0,'Distribution','binomial');
    beta(a,b,:) = mdl.Coefficients.Estimate(2:end);
    r(a,b) = mdl.Rsquared.Ordinary;
    else
        r(a,b) = nan;
        beta(a,b) = nan;
    end
    end
end

figure,subplot(2,1,1),
imagesc(r'),
axis xy,
title('R^2')
set(gca,'YTick',1:8,'YTickLabel',strrep(full.stream(1).frequencies,'_',' '))
colorbar,
subplot(2,1,2),
imagesc(beta'),
title('\beta')
set(gca,'YTick',1:8,'YTickLabel',strrep(full.stream(1).frequencies,'_',' '))
axis xy, 
colorbar


%% plot average linear regression coefficient across all frequency bands on surface
mbeta =[];beta=[];r=[];
close all
ifreqs = [1:8];
for a =1:size(full.data,2)
   
    X=squeeze(full.data(:,a,ifreqs));
    inan = isnan(X(:,1));
    X(inan,:)=[];
    Y=full.movement;
    Y(inan) = [];
    l(a) = length(Y);
    if ~isempty(X)
    mdl = fitglm(X,Y>1,'Distribution','binomial');
    
    mdl = fitglm(X,Y);
    beta(a,:) = mdl.Coefficients.Estimate(2:end);
    r(a) = mdl.Rsquared.Ordinary;
%     if r<0
%         r(a) = nan;
%         beta(a,:) = nan;
%     end
    else
        r(a) = nan;
        beta(a,:) = nan;
    end
    disp(a)
    disp(r(a))
    disp(l(a)./size(full.data,1)*100)
end

r(isnan(r))=0;
figure,
m1_plot_surface
hold on
m1_plot_spheres(settings.grid.ecog.bilateral,r(ci('ecog',settings.grid.full.index)),5)
camlight
title('R^2')

figure
mybar(beta)
set(gca,'XTick',1:size(beta,2),'XTickLabels',strrep(full.stream(1).frequencies(ifreqs),'_',' '),'XTickLabelRotation',45)

figure
imagesc(beta'), axis xy
hold on
plot(wjn_zscore(r)+2,'linewidth',4,'color','r')
set(gca,'YTick',1:size(beta,2),'YTickLabels',strrep(full.stream(1).frequencies(ifreqs),'_',' '),'YTickLabelRotation',45)




%% TRAIN A TIMEDELAY NET
clear all
close all,
clc

addpath(fullfile(gitdir,'m1','code'))
settings = m1_settings;

files = wjn_subdir('stream*.mat');

for b=1:length(settings.grid.full.index)
nX=[];ny=[];id=[];
for a =1:length(files)
        
        [Xv,y,subject]=m1_extract_feature_table(files{a},{'full_beta','full_gamma'},{'variance'},b);
        Xv=table2array(Xv);
        id = cat(1,id,[repmat(str2num(subject.ID(2:end)),[size(Xv,1),1]) repmat(a,[size(Xv,1),1])]);   
        nX=cat(1,nX,[Xv]);
        ny = cat(1,ny,y.data);
        y.data(y.data<0)=0;
        %ny = cat(1,ny,y.data./prctile(y.data,99));
        disp(['Node: ' num2str(b) ' of ' num2str(length(settings.grid.full.index)) ' / ' num2str(a/length(files)*100) ' %'])
end
nnX=nX;
inan=isnan(nX(:,1));
nnX(inan,:)=[];
nny = ny;
nny(inan) = [];
nid = id;
nid(inan,:) = [];
if ~isempty(nnX)

net=wjn_nn_raw_timedelay(nnX,nny,[0 1 3],[6 6 6],30);
node(b).tdnet = net; 
node(b).y = nny;
node(b).X = nnX;
node(b).testInd = zeros(size(nny));
node(b).testInd(node(b).tdnet.testInd)=1;
node(b).trainInd = zeros(size(nny));
node(b).trainInd([node(b).tdnet.trainInd node(b).tdnet.valInd])=1;
  
i = find(node(b).trainInd);
ti = find(node(b).testInd);
[node(b).tdnet.fpr,node(b).tdnet.tpr,node(b).tdnet.thr,node(b).tdnet.auc] = perfcurve(nny(ti)'>0,node(b).tdnet.predict(ti)',1);
node(b).tdnet.r2 = corr(node(b).tdnet.predict(ti),nny(ti))^2;

node(b).lm.mdl = fitlm(nnX(i,:),nny(i));
node(b).lm.predict = node(b).lm.mdl.predict(nnX);
node(b).lm.r2 = corr(node(b).lm.predict(ti),nny(ti))^2;
[node(b).lm.fpr,node(b).lm.tpr,node(b).lm.thr,node(b).lm.auc] = perfcurve(nny(ti)'>0,node(b).lm.predict(ti)',1);

node(b).ldm.mdl = fitlm([nnX(i(1:end-5),:) nnX(i(2:end-4),:) nnX(i(4:end-2),:) nnX(i(6:end),:)],nny(i(6:end)));
node(b).ldm.predict = node(b).ldm.mdl.predict([nnX(1:end-5,:) nnX(2:end-4,:) nnX(4:end-2,:) nnX(6:end,:)]);
node(b).ldm.r2 = corr(node(b).ldm.predict(ti),nny(ti))^2;
[node(b).ldm.fpr,node(b).ldm.tpr,node(b).ldm.thr,node(b).ldm.auc] = perfcurve(nny(ti)'>0,node(b).ldm.predict(ti)',1);

node(b).ldl.mdl = fitglm([nnX(i(1:end-5),:) nnX(i(2:end-4),:) nnX(i(4:end-2),:) nnX(i(6:end),:)],nny(i(6:end))>0,'Distribution','binomial');
node(b).ldl.predict = node(b).ldl.mdl.predict([nnX(1:end-5,:) nnX(2:end-4,:) nnX(4:end-2,:) nnX(6:end,:)]);
node(b).ldl.r2 = corr(node(b).ldl.predict(ti),nny(ti)>0)^2;
[node(b).ldl.fpr,node(b).ldl.tpr,node(b).ldl.thr,node(b).ldl.auc] = perfcurve(nny(ti)'>0,node(b).ldl.predict(ti)',1);

figure
models = {'lm','ldm','ldl','tdnet'};
for a =1:length(models)
plot(node(b).(models{a}).fpr,node(b).(models{a}).tpr,'linewidth',2);
hold on
lname{a} = [models{a} ' AUC: ' num2str( node(b).(models{a}).auc,2)];
end
plot([0 1],[0 1],'linestyle','--','color',[.5 .5 .5])
figone(7)
xlabel('False Positive Rate')
ylabel('True Positive Rate')
title(['Node ' num2str(b) ])
legend(lname,'Location','SouthEast');
myprint(fullfile('testROC',['Node ' num2str(b)]))

node(b).i = find(~inan);
node(b).nsamples = size(nny,1);
node(b).nstreams = numel(unique(nid(:,2)));
node(b).nsubjects = numel(unique(nid(:,1)));


end
end

save nodes node -v7.3

