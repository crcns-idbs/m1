clear all
close all,
clc

addpath(fullfile(gitdir,'m1','code'))
settings = m1_settings;

files = wjn_subdir('stream*.mat');

for b=1:length(settings.grid.full.index)
nX=[];ny=[];id=[];
for a =1:length(files)
        
        XTrain={};YTrain=[];
        stream=load(files{a});
        it = wjn_sc(stream.epochs.time,-1):wjn_sc(stream.epochs.time,1);
        t = stream.epochs.time(it);
        figure
        mypower(t,round(stream.epochs.movement(:,it)))
        n=0;
        for c = 1:size(stream.epochs.data,1)
            n=n+1;
            XTrain{n,1} = squeeze(stream.epochs.data(c,it,b,:));
            YTrain(c,:) = categorical(round(squeeze(stream.epochs.movement(c,it))'>0));
        end
        
        miniBatchSize = 22;
        
        inputSize = 12;
        numHiddenUnits = 100;
        numClasses = 2;

        layers = [ ...
            sequenceInputLayer(inputSize)
            bilstmLayer(numHiddenUnits,'OutputMode','last')
            fullyConnectedLayer(numClasses)
            softmaxLayer
            classificationLayer];
        
        maxEpochs = 100;
        miniBatchSize = 27;

options = trainingOptions('adam', ...
    'ExecutionEnvironment','cpu', ...
    'GradientThreshold',1, ...
    'MaxEpochs',maxEpochs, ...
    'MiniBatchSize',miniBatchSize, ...
    'SequenceLength','longest', ...
    'Shuffle','never', ...
    'Verbose',0, ...
    'Plots','training-progress');
net = trainNetwork(XTrain,YTrain,layers,options);
        
        
        [Xv,y,subject]=m1_extract_feature_table(files{a},{'theta','alpha','low_beta','high_beta','full_beta','low_gamma','high_gamma','full_gamma'},{'variance'},b);
        Xv=table2array(Xv);
        id = cat(1,id,[repmat(str2num(subject.ID(2:end)),[size(Xv,1),1]) repmat(a,[size(Xv,1),1])]);   
        nX=cat(1,nX,[Xv]);
        ny = cat(1,ny,y.data);
        y.data(y.data<0)=0;
        %ny = cat(1,ny,y.data./prctile(y.data,99));
        disp(['Node: ' num2str(b) ' of ' num2str(length(settings.grid.full.index)) ' / ' num2str(a/length(files)*100) ' %'])
end