function info = m1_training_subjects(n)

%% ROOT FOLDER
root = fullfile(mdf,'CRCNS');
info = struct;

%% GENERAL SUBJECT INFORMATION
info(1).ID = 'N001';
info(1).center_ID = 'DBS4009';
info(1).raw_dir = fullfile(root,'subjects',info(1).center_ID);
info(1).raw_filename = 'data_struct_raw_patient_BJ.mat';
info(1).disease = 'PD';
info(1).center = 'UPMC';
info(1).curator = 'Richardson';
info(1).age = 69;
info(1).sex = 'f';

%% CLINICAL SCORES
info(1).scores.updrs.total = 31;
info(1).scores.updrs.left = 10;
info(1).scores.updrs.right = 6;
info(1).scores.updrs.axial = info.scores.updrs.total-info.scores.updrs.left-info.scores.updrs.right;

%% ECOG ELECTRODES
info(1).ecog(1).electrode_name = 'SMR';
info(1).ecog(1).electrode_type = 'AdTech6';
info(1).ecog(1).target = 'sensorimotor';
info(1).ecog(1).hemisphere  = 'right';
info(1).ecog(1).channels = {'ecog1','ecog2','ecog3','ecog4','ecog5','ecog6'};
info(1).ecog(1).spacing = 10;
info(1).ecog(1).diameter = .5;
info(1).ecog(1).grid = [6 1];
info(1).ecog(1).rereferencing = [];
info(1).ecog(1).location = [[15.7594787700000,19.9826963200000,22.3920033800000,27.3182671500000,40.3226778500000,43.4209534600000;-36.3338918900000,-26.3715512600000,-16.8776492200000,-7.75809222400000,-1.23647465800000,6.34938605800000;70.6782508900000,68.9606861800000,65.7155998500000,60.9157754000000,54.3605757500000,48.3352039100000]];
info(1).ecog(1).space = 'MNI152_6th';

%% LFP ELECTRODES
info(1).lfp(1).electrode_name = 'STNR';
info(1).lfp(1).electrode_type = 'Medtronic3389';
info(1).lfp(1).target = 'stn';
info(1).lfp(1).hemisphere = 'right';
info(1).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
info(1).lfp(1).spacing = 1.5;
info(1).lfp(1).diameter = 2;
info(1).lfp(1).rereferencing = 'bipolar';
info(1).lfp(1).location = [13.4 -12.7 -4.1; 13.4 -13.27 -5.8; 13 -15.35 -6.3; 12.3 -15.9 -8.54]';
info(1).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';

%% MOVEMENT TRACES
info(1).movement(1).name = 'grip_force_right';
info(1).movement(1).modality = 'force';
info(1).movement(1).effector = 'hand';
info(1).movement(1).side = 'left';
info(1).movement(1).channel='analog1';

info(1).movement(2).name = 'grip_force_left';
info(1).movement(2).modality = 'force';
info(1).movement(2).effector = 'hand';
info(1).movement(2).side = 'right';
info(1).movement(2).channel = 'analog2';

%% RECORDING SEGMENTS
info(1).segments(1).electrodes = {'SMR','STNR'};
info(1).segments(1).channels = {'ecog1','ecog2','ecog3','ecog4','ecog5','ecog6','stn1','stn2','stn3','stn4'};
info(1).segments(1).timewindows = [880 1147];
info(1).segments(1).location = [];

info(1).segments(2).electrodes = {'SMR'};
info(1).segments(2).channels = {'ecog1','ecog2','ecog3','ecog4','ecog5','ecog6'};
info(1).segments(2).timewindows =  [323 870];
info(1).segments(2).location = [];



info(2).ID = '?';
info(2).center = 'Charite';

info=info(n);