function settings=m1_settings(config)

if ~exist('config','var')
    config = 'default';
end

switch config
    case 'default'
        %% DIRECTORY LISTING
        settings.dir.code_root = {[fileparts(which('m1_settings.m')),filesep]};
        settings.dir.template_root = fullfile(settings.dir.code_root{1}(1:end-5),'templates');
         %% EPHYS PREPROCESSING SETTINGS
        settings.preproc.rereferencing.Medtronic3389 ='bipolar';
        settings.preproc.rereferencing.AdTech6 = 'common_average';
        settings.preproc.linenoise.UPMC = 60;
        settings.preproc.linenoise.Charite = 50;
        settings.preproc.grandmean = 1;
        %% COMMON GRID ARCHITECTURE AND PROJECTION       
       
         settings.grid.ecog.max_distance = 20;
         settings.grid.ecog.left = [-13.1000000000000,-35.5000000000000,-48.3000000000000,-60,-16.9000000000000,-34.8000000000000,-67.5000000000000,-46.1000000000000,-59.8000000000000,-14.2000000000000,-28.3000000000000,-42.3000000000000,-67.6000000000000,-50.5000000000000,-14.6000000000000,-60.9000000000000,-31.6000000000000,-5.10000000000000,-65.6000000000000,-41.8000000000000,-55.1000000000000,-22.7000000000000,-5.80000000000000,-49.2000000000000,-34.5000000000000,-61.5500000000000,-63.6000000000000,-40.4000000000000,-48.7000000000000,-21.8000000000000,-58.2000000000000,-7,-36.3000000000000,-48.1000000000000,-56.8000000000000,-7.30000000000000,-22.2000000000000,-36.8000000000000,-46.8000000000000;-67.7000000000000,-60,-55.1000000000000,-51.8000000000000,-51.6000000000000,-49.3000000000000,-47.1000000000000,-43.7000000000000,-39.6000000000000,-39.1000000000000,-31.2000000000000,-30.7000000000000,-30.1000000000000,-24.4000000000000,-22.7000000000000,-18.7000000000000,-16.9000000000000,-12.6000000000000,-10.8000000000000,-10.2000000000000,-4.01000000000000,1.20000000000000,2.80000000000000,3.70000000000000,3.90000000000000,6.20000000000000,8.30000000000000,11.8000000000000,14.5000000000000,16,18.2000000000000,18.4000000000000,19.9000000000000,24.6000000000000,28.5200000000000,33.8000000000000,35,35.4000000000000,35.6000000000000;69.1000000000000,66,58.2000000000000,48,78,71.7000000000000,31,61.1000000000000,53.3000000000000,81.1000000000000,76,70.2000000000000,41.2000000000000,64.4000000000000,80.2000000000000,50.9000000000000,75.2000000000000,77.3000000000000,37.8000000000000,67,53.2000000000000,72,74.8000000000000,54.7000000000000,66.5000000000000,35.9000000000000,25.7000000000000,60.7000000000000,50.5000000000000,68.9000000000000,27.3000000000000,70.3000000000000,59.6000000000000,44,20.8000000000000,61.7000000000000,57.2000000000000,47,36];
         settings.grid.ecog.right = [abs(settings.grid.ecog.left(1,:));settings.grid.ecog.left(2:3,:)];
         settings.grid.ecog.bilateral = [settings.grid.ecog.left settings.grid.ecog.right];
         settings.grid.ecog.surface = fullfile(settings.dir.template_root,'m1_surface.mat');
         settings.grid.ecog.index = [repmat({'ecog_contralateral'},1,size(settings.grid.ecog.left,2)) repmat({'ecog_ipsilateral'},1,size(settings.grid.ecog.right,2))];
         settings.grid.lfp.stn.max_distance = 5;
         settings.grid.lfp.stn.left = [-14.6,-13.2,-11.7,-9.10,-11.7,-13.2,-7.90,-10;-15.1,-15.1,-15.1,-12.6,-12.6,-12.6,-9.40,-10.1;-5.40,-7.20,-8.70,-8.70,-7.50,-5.10,-10.3,-7.80];
         settings.grid.lfp.stn.right = [abs(settings.grid.lfp.stn.left(1,:));settings.grid.lfp.stn.left(2:3,:)];
         settings.grid.lfp.stn.bilateral = [settings.grid.lfp.stn.left settings.grid.lfp.stn.right];
         settings.grid.lfp.stn.surface = fullfile(settings.dir.template_root,'STN.surf.gii');
         settings.grid.lfp.stn.index = [repmat({'stn_contralateral'},1,size(settings.grid.lfp.stn.left,2)) repmat({'stn_ipsilateral'},1,size(settings.grid.lfp.stn.right,2))];
         settings.grid.lfp.targets = fieldnames(settings.grid.lfp);
         settings.grid.full.bilateral = settings.grid.ecog.bilateral;
         settings.grid.full.index = settings.grid.ecog.index;
         for a =  1:length(settings.grid.lfp.targets)
            settings.grid.full.bilateral = [settings.grid.full.bilateral settings.grid.lfp.(settings.grid.lfp.targets{a}).bilateral];
            settings.grid.full.index = [settings.grid.full.index settings.grid.lfp.(settings.grid.lfp.targets{a}).index];
         end
        
        %% WRITE OPTIONS
        settings.write.basename = {'ID','center_ID','disease','center'};   
        settings.write.preproc.mergefile = 0;
        settings.write.preproc.figures = 1;
        settings.write.preproc.segments = 1;
        settings.write.preproc.spm = 0;
        settings.write.stream.figures = 1;
        settings.write.stream.full = 1;
        %% OFFLINE PRETRAINING DATASTREAM SETTINGS
        settings.stream.perimovement_segment=[-6 7];
        settings.stream.resample_rate = 10;
        settings.stream.normalization_time = 10;
        settings.stream.freqranges = [4 8;8 12;13 20;20 35;13 35;60 80;90 200;60 200];
        settings.stream.seglengths = [1 2 2 3 3 3 10 10 10]; % FRACTION OF RESAMPLING RATE
        settings.stream.freqnames = {'theta','alpha','low_beta','high_beta','full_beta','low_gamma','high_gamma','full_gamma'};
        settings.stream.movement.smoothing = .2;
end