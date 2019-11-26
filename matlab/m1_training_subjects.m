function [subject,ID] = m1_training_subjects(n)

%% ROOT FOLDER

settings=m1_settings;

%% CHECK IF TIMON OR JULIAN

if exist('E:\Dropbox (Brain Modulation Lab)\m1-master\subjects','dir')
    subject_root= 'E:\Dropbox (Brain Modulation Lab)\m1-master\subjects';
else
    subject_root = '/Users/bml/Documents/m1-master/subjects';
end

%% GENERAL SUBJECT INFORMATION SUBJECT 1
subject(1).ID = 'N001';
subject(1).center_ID = 'DBS4009';
subject(1).raw_dir = fullfile(subject_root,subject(1).center_ID);
subject(1).disease = 'PD';
subject(1).center = 'UPMC';
subject(1).curator = 'Richardson';
subject(1).age = 69;
subject(1).sex = 'f';

%% CLINICAL SCORES
subject(1).scores.updrs.total = 31;
subject(1).scores.updrs.left = 10;
subject(1).scores.updrs.right = 6;
subject(1).scores.updrs.axial = subject(1).scores.updrs.total-subject(1).scores.updrs.left-subject(1).scores.updrs.right;

%% SESSION RAW DATA FILE
subject(1).session(1).raw_filename = 'data_struct_raw_patient_BJ.mat';

%% ECOG ELECTRODES
subject(1).session(1).ecog(1).electrode_name = 'SMR';
subject(1).session(1).ecog(1).electrode_type = 'AdTech6';
subject(1).session(1).ecog(1).target = 'sensorimotor';
subject(1).session(1).ecog(1).hemisphere  = 'right';
subject(1).session(1).ecog(1).channels = {'ecog1','ecog2','ecog3','ecog4','ecog5','ecog6'};
subject(1).session(1).ecog(1).spacing = 10;
subject(1).session(1).ecog(1).diameter = 4;
subject(1).session(1).ecog(1).exposure = 2.3;
subject(1).session(1).ecog(1).grid = [6 1];
subject(1).session(1).ecog(1).rereferencing = 'common_average';
subject(1).session(1).ecog(1).location = [15.7594844346358,-36.3338949654408,70.6782438098323;19.9827019857184,-26.3715543365195,68.9606791018364;22.3920090461315,-16.8776522926052,65.7155927731989;27.3182728206693,-7.75809530066149,60.9157683244579;40.3226835184239,-1.23647773516836,54.3605686676814;43.4209591259100,6.34938298100252,48.3351968340894]';
subject(1).session(1).ecog(1).space = 'MNI152_6th';

%% LFP ELECTRODES
subject(1).session(1).lfp(1).electrode_name = 'STNR';
subject(1).session(1).lfp(1).electrode_type = 'Medtronic3389';
subject(1).session(1).lfp(1).target = 'stn';
subject(1).session(1).lfp(1).hemisphere = 'right';
subject(1).session(1).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
subject(1).session(1).lfp(1).spacing = 1.5;
subject(1).session(1).lfp(1).diameter = 1.3;
subject(1).session(1).lfp(1).length = 2;
subject(1).session(1).lfp(1).rereferencing = 'bipolar';
subject(1).session(1).lfp(1).location = [13.4 -12.7 -4.1; 13.4 -13.27 -5.8; 13 -15.35 -6.3; 12.3 -15.9 -8.54]';
subject(1).session(1).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';

%% MOVEMENT TRACES
subject(1).session(1).movement(1).name = 'grip_force_right';
subject(1).session(1).movement(1).modality = 'force';
subject(1).session(1).movement(1).effector = 'hand';
subject(1).session(1).movement(1).side = 'right';
subject(1).session(1).movement(1).channel='analog2';

subject(1).session(1).movement(2).name = 'grip_force_left';
subject(1).session(1).movement(2).modality = 'force';
subject(1).session(1).movement(2).effector = 'hand';
subject(1).session(1).movement(2).side = 'left';
subject(1).session(1).movement(2).channel = 'analog1';

%% RECORDING segment
subject(1).session(1).segment(1).electrodes = {'SMR','STNR'};
subject(1).session(1).segment(1).channels = {'ecog1','ecog2','ecog3','ecog4','ecog5','ecog6','stn1','stn2','stn3','stn4'};
subject(1).session(1).segment(1).timewindows = [880 1147];


subject(1).session(1).segment(2).electrodes = {'SMR'};
subject(1).session(1).segment(2).channels = {'ecog1','ecog2','ecog3','ecog4','ecog5','ecog6'};
subject(1).session(1).segment(2).timewindows =  [323 500];

subject(1).session(1).segment(3).electrodes = {'SMR'};
subject(1).session(1).segment(3).channels = {'ecog1','ecog2','ecog3','ecog4','ecog5','ecog6'};
subject(1).session(1).segment(3).timewindows =  [500 800];

%% GENERAL SUBJECT INFORMATION SUBJECT 2

subject(2).ID = 'N002';
subject(2).center_ID = 'DBS4004';
subject(2).raw_dir = fullfile(subject_root,subject(2).center_ID);
subject(2).disease = 'PD';
subject(2).center = 'UPMC';
subject(2).curator = 'Richardson';
subject(2).age = 64;
subject(2).sex = 'm';

%% CLINICAL SCORES
subject(2).scores.updrs.total = 32;
subject(2).scores.updrs.left = 14;
subject(2).scores.updrs.right = 7;
subject(2).scores.updrs.axial = subject(2).scores.updrs.total-subject(2).scores.updrs.left-subject(2).scores.updrs.right;

%% SESSION RAW DATA FILE
subject(2).session(1).raw_filename = 'session1_LEFT_STN_vary.mat';

%% ECOG ELECTRODES
subject(2).session(1).ecog(1).electrode_name = 'PFL';
subject(2).session(1).ecog(1).electrode_type = 'AdTech8';
subject(2).session(1).ecog(1).target = 'prefrontal';
subject(2).session(1).ecog(1).hemisphere  = 'left';
subject(2).session(1).ecog(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6','ecog_1_7'};
subject(2).session(1).ecog(1).spacing = 10;
subject(2).session(1).ecog(1).diameter = 4;
subject(2).session(1).ecog(1).exposure = 2.3;
subject(2).session(1).ecog(1).grid = [8 1];
subject(2).session(1).ecog(1).rereferencing = 'common_average';
subject(2).session(1).ecog(1).location = [-41.5644133471989,38.7096793738734,-14.7968370418701;-48.7651953906911,37.3780551232713,-7.21088227080366;-53.2132675628696,34.5356213871213,3.01254064229420;-55.0096794030656,31.1214919597488,11.0344034876536;-55.0229506856747,26.6757407491019,19.3151469272110;-54.1171774242227,22.2203587333441,27.5549638097170;-50.2938486998514,19.2912477511974,37.4100477093517];
subject(2).session(1).ecog(1).space = 'MNI152_6th';

subject(2).session(1).ecog(2).electrode_name = 'SML';
subject(2).session(1).ecog(2).electrode_type = 'AdTech14x2';
subject(2).session(1).ecog(2).target = 'sensorimotor';
subject(2).session(1).ecog(2).hemisphere  = 'left';
subject(2).session(1).ecog(2).channels = {'ecog_2_1','ecog_2_2','ecog_2_3','ecog_2_4','ecog_2_5','ecog_2_6','ecog_2_7','ecog_2_8','ecog_2_9','ecog_2_10','ecog_2_11','ecog_2_12','ecog_2_13','ecog_2_14','ecog_2_15','ecog_2_16','ecog_2_17','ecog_2_18','ecog_2_19','ecog_2_20','ecog_2_21','ecog_2_22','ecog_2_23','ecog_2_24','ecog_2_25','ecog_2_26','ecog_2_27','ecog_2_28'};
subject(2).session(1).ecog(2).spacing = 4;
subject(2).session(1).ecog(2).diameter = 4;
subject(2).session(1).ecog(2).exposure = 1.17;
subject(2).session(1).ecog(2).grid = [14 2];
subject(2).session(1).ecog(2).rereferencing = 'common_average';
subject(2).session(1).ecog(2).location = [-59.0957775865881,-50.4617876621415,48.6698130612524;-56.9895814870941,-47.6421240124217,51.0246631254239;-58.5024031528745,-43.0306184340980,51.8223618029075;-57.4229367780773,-41.4850857902655,53.5194819341393;-59.9053277575844,-36.3943925096684,51.9385930637894;-59.7426940464135,-34.0982705256173,52.2965158454798;-58.4434335494753,-28.5032971895729,52.6307011435082;-59.2525810324659,-26.4689460383562,51.9901602839579;-57.1441730525371,-22.9083238535285,52.9648864415366;-57.8434234744572,-18.8492523562059,51.6428781653847;-56.7067966886899,-15.5504010042126,51.6191406817227;-56.5441629775190,-13.2542790201615,51.9770634634130;-54.4335431171554,-8.95269830022597,51.5716657143988;-51.4060905931655,-5.40170692050898,52.5054653149260;-61.9561726385373,-50.2347399875918,45.3336884292297;-61.6331170966304,-46.3834545545975,47.4296578992033;-61.4177467353590,-43.8159309326012,48.8269708791857;-62.9283565207046,-38.4634668191697,48.2445456500765;-62.4931920372922,-31.8465025049616,48.2789237968555;-62.7657228095337,-36.1673448351187,48.6024684317668;-61.3587771319598,-29.2886096880761,49.6353102197864;-61.0862463597184,-24.9677673579191,49.3117655848751;-60.8686641180122,-21.6592852008151,49.3289546582646;-60.6488699958712,-17.6098445086032,47.9660198250612;-59.5122432101040,-14.3109931566098,47.9422823413992;-58.4305649548719,-12.0245019776695,48.2592785660382;-57.2389896385694,-7.71329045262320,47.8948073740753;-56.1023628528022,-4.41443910062989,47.8710698904134]';
subject(2).session(1).ecog(2).space = 'MNI152_6th';

%% LFP ELECTRODES
subject(2).session(1).lfp(1).electrode_name = 'STNL';
subject(2).session(1).lfp(1).electrode_type = 'Medtronic3389';
subject(2).session(1).lfp(1).target = 'stn';
subject(2).session(1).lfp(1).hemisphere = 'left';
subject(2).session(1).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
subject(2).session(1).lfp(1).spacing = 1.5;
subject(2).session(1).lfp(1).diameter = 2;
subject(2).session(1).lfp(1).rereferencing = 'bipolar';
subject(2).session(1).lfp(1).location = [-11.6996811954663,-19.7872431908632,-7.50021379202146;-12.0569831000657,-18.8559967343070,-5.60304971038915;-12.4121473449615,-17.9015459295519,-3.71288732048060;-12.7560129823759,-16.9096197209517,-1.82263667673206]';
subject(2).session(1).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';

%% MOVEMENT TRACES
subject(2).session(1).movement(1).name = 'grip_force_right';
subject(2).session(1).movement(1).modality = 'force';
subject(2).session(1).movement(1).effector = 'hand';
subject(2).session(1).movement(1).side = 'right';
subject(2).session(1).movement(1).channel='analog2';

subject(2).session(1).movement(2).name = 'grip_force_left';
subject(2).session(1).movement(2).modality = 'force';
subject(2).session(1).movement(2).effector = 'hand';
subject(2).session(1).movement(2).side = 'left';
subject(2).session(1).movement(2).channel = 'analog1';

%% RECORDING segment
subject(2).session(1).segment(1).electrodes = {'PFL','SML','STNL'};
subject(2).session(1).segment(1).timewindows = [1 280];

%% SESSION 2  RAW DATA FILE
subject(2).session(2).raw_filename = 'session2_LEFT_STN_vary.mat';
%% ECOG ELECTRODES

subject(2).session(2).ecog(1) = subject(2).session(1).ecog(1);
subject(2).session(2).ecog(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6','ecog_1_7','ecog_1_8'};
subject(2).session(2).ecog(1).location = [-41.5644133471989,38.7096793738734,-14.7968370418701;-48.7651953906911,37.3780551232713,-7.21088227080366;-53.2132675628696,34.5356213871213,3.01254064229420;-55.0096794030656,31.1214919597488,11.0344034876536;-55.0229506856747,26.6757407491019,19.3151469272110;-54.1171774242227,22.2203587333441,27.5549638097170;-50.2938486998514,19.2912477511974,37.4100477093517; -40.6881   19.1433   49.4563]';
subject(2).session(2).ecog(2) = subject(2).session(1).ecog(2);
%% LFP ELECTRODES
subject(2).session(2).lfp = subject(2).session(1).lfp;
%% MOVEMENT TRACES
subject(2).session(2).movement = subject(2).session(1).movement;

%% RECORDING segment
subject(2).session(2).segment(1).electrodes = {'PFL','SML','STNL'};
subject(2).session(2).segment(1).timewindows = [80 380];

%% SESSION 3  RAW DATA FILE
subject(2).session(3).raw_filename = 'session4_LEFT_STN_fixed.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
subject(2).session(3).ecog = subject(2).session(2).ecog;
subject(2).session(3).lfp = subject(2).session(2).lfp;
subject(2).session(3).movement = subject(2).session(2).movement;
%% RECORDING segment
subject(2).session(3).segment(1).electrodes = {'PFL','SML','STNL'};
subject(2).session(3).segment(1).timewindows = [50 550];

%% SESSION 4  RAW DATA FILE
subject(2).session(4).raw_filename = 'session5_RIGHT_STN_vary.mat';
%% ECOG ELECTRODES
subject(2).session(4).ecog(1).electrode_name = 'PFR';
subject(2).session(4).ecog(1).electrode_type = 'AdTech8';
subject(2).session(4).ecog(1).target = 'prefrontal';
subject(2).session(4).ecog(1).hemisphere  = 'right';
subject(2).session(4).ecog(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6','ecog_1_7','ecog_1_8'};
subject(2).session(4).ecog(1).spacing = 10;
subject(2).session(4).ecog(1).diameter = 4;
subject(2).session(4).ecog(1).exposure = 2.3;
subject(2).session(4).ecog(1).grid = [8 1];
subject(2).session(4).ecog(1).rereferencing = 'common_average';
subject(2).session(4).ecog(1).location = [22.7222010402766,52.0200409847561,-18.9321370914553;33.3590575259528,54.6281185079894,-8.98842723610083;38.3673259253222,53.7873434455655,4.64255719134986;42.0280209385226,48.5621104793677,14.1397183092943;42.9315823195398,43.3657699285021,23.7596590983931;44.6465030639824,36.8760367615277,32.6400168404493;43.6065020566766,31.1561545449934,40.2630303470669;42.4016554577650,22.3991918093002,48.9082449785870]';
subject(2).session(4).ecog(1).space = 'MNI152_6th';

subject(2).session(4).ecog(2).electrode_name = 'SMR';
subject(2).session(4).ecog(2).electrode_type = 'AdTech14x2';
subject(2).session(4).ecog(2).target = 'sensorimotor';
subject(2).session(4).ecog(2).hemisphere  = 'right';
subject(2).session(4).ecog(2).channels = {'ecog_2_1','ecog_2_2','ecog_2_3','ecog_2_4','ecog_2_5','ecog_2_6','ecog_2_7','ecog_2_8','ecog_2_9','ecog_2_10','ecog_2_11','ecog_2_12','ecog_2_13','ecog_2_14','ecog_2_15','ecog_2_16','ecog_2_17','ecog_2_18','ecog_2_19','ecog_2_20','ecog_2_21','ecog_2_22','ecog_2_23','ecog_2_24','ecog_2_25','ecog_2_26','ecog_2_27','ecog_2_28'};
subject(2).session(4).ecog(2).spacing = 4;
subject(2).session(4).ecog(2).diameter = 4;
subject(2).session(4).ecog(2).exposure = 1.17;
subject(2).session(4).ecog(2).grid = [14 2];
subject(2).session(4).ecog(2).rereferencing = 'common_average';
subject(2).session(4).ecog(2).location = [29.1516543988496,-50.1962773401888,70.3914332435855;31.2600623787785,-46.6356551553611,71.3661594011642;31.6402783316555,-41.0310510142060,71.7412712562440;30.9388160293006,-37.7129380519912,71.7993868866850;34.8325764472512,-34.4429791153301,71.6528697318687;36.9431963076148,-30.1413983953945,71.2474719828545;38.1897201544526,-24.8178266972953,70.5422670825908;37.5432063826329,-20.4873535620275,70.2596490047310;35.8699628861164,-17.4310114326471,69.3193009939313;37.9278460963797,-13.4008323506567,67.8745130466250;35.4432432364378,-9.05109760516748,67.6737480828680;35.6652492390137,-4.26069837784773,64.9306893430717;34.9110502865583,-1.21398705357809,63.9494147752206;33.4004405012128,4.13847705985340,63.3669895461114;33.6963523494897,-49.7748744685799,67.7672863534433;34.8857157853573,-46.2046214786414,68.7829390680734;36.1300277517602,-41.6220083156500,69.4578580744026;38.2406476121239,-37.3204275957144,69.0524603253884;40.3512674724875,-33.0188468757789,68.6470625763742;41.5428427887901,-28.7076353507326,68.2825913844114;42.7344181050925,-24.3964238256863,67.9181201924486;41.1688597892118,-20.0563198853078,67.6764286716402;41.3886539113528,-16.0068791930959,66.3134938384368;42.4725440470196,-12.9794294790478,65.2503661564828;39.9352045369774,-8.90109637150366,64.0102109944338;40.1022620090180,-5.12305731723689,61.6078859629383;38.5367036931371,-0.782953376858381,61.3661944421299;37.8374532712171,3.27611812046424,60.0441861659779]';
subject(2).session(4).ecog(2).space = 'MNI152_6th';


%% MOVEMENT
subject(2).session(4).movement = subject(2).session(3).movement;
%% RECORDING segment
subject(2).session(4).segment(1).electrodes = {'SMR'};
subject(2).session(4).segment(1).timewindows = [33 415];

subject(2).session(4).segment(2).electrodes = {'SMR'};
subject(2).session(4).segment(2).timewindows = [557 845];

subject(2).session(4).segment(3).electrodes = {'SMR'};
subject(2).session(4).segment(3).timewindows = [1200 1640];

%% SESSION 5  RAW DATA FILE
subject(2).session(5).raw_filename = 'session6_RIGHT_STN_fixed.mat';
%% ECOG + LFP ELECTRODES
subject(2).session(5).ecog = subject(2).session(4).ecog;
%% LFP ELECTRODES
subject(2).session(5).lfp(1).electrode_name = 'STNR';
subject(2).session(5).lfp(1).electrode_type = 'Medtronic3389';
subject(2).session(5).lfp(1).target = 'stn';
subject(2).session(5).lfp(1).hemisphere = 'right';
subject(2).session(5).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
subject(2).session(5).lfp(1).spacing = 1.5;
subject(2).session(5).lfp(1).diameter = 2;
subject(2).session(5).lfp(1).rereferencing = 'bipolar';
subject(2).session(5).lfp(1).location = [9.29895017655514,-15.5284132003050,-9.82246535931812;9.62407705014301,-14.8511773920758,-7.62442751844796;9.94523822271819,-14.1336979059156,-5.46922214702858;10.2547044196215,-13.3797185569532,-3.34564271352136]';
subject(2).session(5).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';

subject(2).session(5).movement = subject(2).session(4).movement;
%% RECORDING segment
subject(2).session(5).segment(1).electrodes = {'PFR','SMR','STNR'};
subject(2).session(5).segment(1).timewindows = [1 279];


%% GENERAL SUBJECT INFORMATION SUBJECT 3
subject(3).ID = 'N003';
subject(3).center_ID = 'DBS4011';
subject(3).raw_dir = fullfile(subject_root,subject(3).center_ID);
subject(3).disease = 'PD';
subject(3).center = 'UPMC';
subject(3).curator = 'Richardson';
subject(3).age = 63.8;
subject(3).sex = 'f';

%% CLINICAL SCORES
subject(3).scores.updrs.total = 40;
subject(3).scores.updrs.left = 10;
subject(3).scores.updrs.right = 16;
subject(3).scores.updrs.axial = subject(3).scores.updrs.total-subject(3).scores.updrs.left-subject(3).scores.updrs.right;

%% SESSION RAW DATA FILE
subject(3).session(1).raw_filename = 'session4_RIGHT_STN_fixed.mat';

%% ECOG ELECTRODES
subject(3).session(1).ecog(1).electrode_name = 'SMR';
subject(3).session(1).ecog(1).electrode_type = 'AdTech8';
subject(3).session(1).ecog(1).target = 'sensiromotor';
subject(3).session(1).ecog(1).hemisphere  = 'right';
subject(3).session(1).ecog(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6','ecog_1_7','ecog_1_8'};
subject(3).session(1).ecog(1).spacing = 10;
subject(3).session(1).ecog(1).diameter = 4;
subject(3).session(1).ecog(1).exposure = 2.3;
subject(3).session(1).ecog(1).grid = [8 1];
subject(3).session(1).ecog(1).rereferencing = 'common_average';
subject(3).session(1).ecog(1).location = [27.2700000000000,-28.8700000000000,75.5700000000000;22.7200000000000,-20.5100000000000,76.0200000000000;30.1600000000000,-10.1500000000000,68.1000000000000;28,0.680000000000000,62.5100000000000;33.0200000000000,7.19400000000000,65.7600000000000;31.8300000000000,19.9700000000000,60.7100000000000;32.6300000000000,31.6700000000000,53.0900000000000;28.7600000000000,40.1900000000000,42.5900000000000]';
subject(3).session(1).ecog(1).space = 'MNI152_6th';

%% LFP ELECTRODES

subject(3).session(1).lfp(1).electrode_name = 'STNR';
subject(3).session(1).lfp(1).electrode_type = 'Medtronic3389';
subject(3).session(1).lfp(1).target = 'stn';
subject(3).session(1).lfp(1).hemisphere = 'right';
subject(3).session(1).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
subject(3).session(1).lfp(1).spacing = 1.5;
subject(3).session(1).lfp(1).diameter = 1.3;
subject(3).session(1).lfp(1).length = 2;
subject(3).session(1).lfp(1).rereferencing = 'bipolar';
subject(3).session(1).lfp(1).location = [13.4 -12.7 -4.1; 13.4 -13.27 -5.8; 13 -15.35 -6.3; 12.3 -15.9 -8.54]';
subject(3).session(1).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';

%% MOVEMENT TRACES
subject(3).session(1).movement(1).name = 'grip_force_right';
subject(3).session(1).movement(1).modality = 'force';
subject(3).session(1).movement(1).effector = 'hand';
subject(3).session(1).movement(1).side = 'right';
subject(3).session(1).movement(1).channel='analog2';

subject(3).session(1).movement(2).name = 'grip_force_left';
subject(3).session(1).movement(2).modality = 'force';
subject(3).session(1).movement(2).effector = 'hand';
subject(3).session(1).movement(2).side = 'left';
subject(3).session(1).movement(2).channel = 'analog1';

%% RECORDING segment
subject(3).session(1).segment(1).electrodes = {'SMR', 'STNR'};
subject(3).session(1).segment(1).timewindows = [16 585];

%% GENERAL SUBJECT INFORMATION SUBJECT 4

subject(4).ID = 'N004';
subject(4).center_ID = 'DBS4014';
subject(4).raw_dir = fullfile(subject_root,subject(4).center_ID);
subject(4).disease = 'PD';
subject(4).center = 'UPMC';
subject(4).curator = 'Richardson';
subject(4).age = 52.5;
subject(4).sex = 'm';

%% CLINICAL SCORES
subject(4).scores.updrs.total = 50;
subject(4).scores.updrs.left = 24.5;
subject(4).scores.updrs.right = 15;
subject(4).scores.updrs.axial = subject(4).scores.updrs.total-subject(4).scores.updrs.left-subject(4).scores.updrs.right;

%% SESSION RAW DATA FILE
subject(4).session(1).raw_filename = 'session1_LEFT_vary.mat';

%% ECOG ELECTRODES
subject(4).session(1).ecog(1).electrode_name = 'SML';
subject(4).session(1).ecog(1).electrode_type = 'AdTech6';
subject(4).session(1).ecog(1).target = 'sensorimotor';
subject(4).session(1).ecog(1).hemisphere  = 'left';
subject(4).session(1).ecog(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6'};
subject(4).session(1).ecog(1).spacing = 10;
subject(4).session(1).ecog(1).diameter = 4;
subject(4).session(1).ecog(1).exposure = 2.3;
subject(4).session(1).ecog(1).grid = [6 1];
subject(4).session(1).ecog(1).rereferencing = 'common_average';
subject(4).session(1).ecog(1).location = [-25.0689224748964,-26.3377414465474,74.6086450775476;-35.0177865458532,-16.6911603772808,70.6313508622395;-41.1640338090358,-10.0206877546916,65.3893243856085;-47.2743079748045,-2.43435997828090,59.6407736786939;-48.2662577154394,3.99209787878251,53.8547731582984;-46.7872028264871,12.6605844733778,50.1085610204314]';
subject(4).session(1).ecog(1).space = 'MNI152_6th';



%% MOVEMENT TRACES
subject(4).session(1).movement(1).name = 'grip_force_right';
subject(4).session(1).movement(1).modality = 'force';
subject(4).session(1).movement(1).effector = 'hand';
subject(4).session(1).movement(1).side = 'right';
subject(4).session(1).movement(1).channel='analog2';

subject(4).session(1).movement(2).name = 'grip_force_left';
subject(4).session(1).movement(2).modality = 'force';
subject(4).session(1).movement(2).effector = 'hand';
subject(4).session(1).movement(2).side = 'left';
subject(4).session(1).movement(2).channel = 'analog1';

%% RECORDING segment
subject(4).session(1).segment(1).electrodes = {'SML'};
subject(4).session(1).segment(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6','ecog_1_7','ecog_1_8'};
subject(4).session(1).segment(1).timewindows = [8 105];

subject(4).session(2).raw_filename = 'session5_LEFT_fixed.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
subject(4).session(2).ecog = subject(4).session(1).ecog;

%% LFP ELECTRODES
subject(4).session(2).lfp(1).electrode_name = 'STNL';
subject(4).session(2).lfp(1).electrode_type = 'Medtronic3389';
subject(4).session(2).lfp(1).target = 'stn';
subject(4).session(2).lfp(1).hemisphere = 'left';
subject(4).session(2).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
subject(4).session(2).lfp(1).spacing = 1.5;
subject(4).session(2).lfp(1).diameter = 1.3;
subject(4).session(2).lfp(1).length = 2;
subject(4).session(2).lfp(1).rereferencing = 'bipolar';
subject(4).session(2).lfp(1).location = [-12.9815648756877,-14.7847171026404,-7.46680040982749;-13.5756726722013,-13.8281498754057,-5.79232460209667;-14.1667513125989,-12.8815944543543,-4.13556195857518;-14.7511494141896,-11.9412208530956,-2.49187267933767]';
subject(4).session(2).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';


subject(4).session(2).movement = subject(4).session(1).movement;
%% RECORDING segment
subject(4).session(2).segment(1).electrodes = {'SML'};
subject(4).session(2).segment(1).timewindows = [240 372];
subject(4).session(2).segment(2).electrodes = {'SML'};
subject(4).session(2).segment(2).timewindows = [555 816];
subject(4).session(2).segment(3).electrodes = {'SML', 'STNL'};
subject(4).session(2).segment(3).timewindows = [915 975];
subject(4).session(2).segment(4).electrodes = {'SML'};
subject(4).session(2).segment(4).timewindows = [1056 1290];

%% GENERAL SUBJECT INFORMATION SUBJECT 5

subject(5).ID = 'N005';
subject(5).center_ID = 'DBS4017';
subject(5).raw_dir = fullfile(subject_root,subject(5).center_ID);
subject(5).disease = 'PD';
subject(5).center = 'UPMC';
subject(5).curator = 'Richardson';
subject(5).age = 60.3;
subject(5).sex = 'm';

%% CLINICAL SCORES
subject(5).scores.updrs.total = 28;
subject(5).scores.updrs.left = 11;
subject(5).scores.updrs.right = 9;
subject(5).scores.updrs.axial = subject(5).scores.updrs.total-subject(5).scores.updrs.left-subject(5).scores.updrs.right;

%% SESSION RAW DATA FILE
subject(5).session(1).raw_filename = 'session2_RIGHT_1_stn_vary.mat';

%% ECOG ELECTRODES
subject(5).session(1).ecog(1).electrode_name = 'SMR';
subject(5).session(1).ecog(1).electrode_type = 'AdTech6';
subject(5).session(1).ecog(1).target = 'sensorimotor';
subject(5).session(1).ecog(1).hemisphere  = 'right';
subject(5).session(1).ecog(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6'};
subject(5).session(1).ecog(1).spacing = 10;
subject(5).session(1).ecog(1).diameter = 4;
subject(5).session(1).ecog(1).exposure = 2.3;
subject(5).session(1).ecog(1).grid = [6 1];
subject(5).session(1).ecog(1).rereferencing = 'common_average';
subject(5).session(1).ecog(1).location = [37.3181740000000,-48.6101266400000,61.7976547400000;40.1598943000000,-37.3159298300000,64.3117161800000;40.9430357800000,-27.2177845600000,64.0951840800000;39.7839552200000,-17.0052308100000,63.8661813600000;39.6881364100000,-5.52802457200000,61.6825425400000;37.5191592400000,4.30491341400000,60.5412635500000]'; %right is positive 
subject(5).session(1).ecog(1).space = 'MNI152_6th';



%% MOVEMENT TRACES
subject(5).session(1).movement(1).name = 'grip_force_right';
subject(5).session(1).movement(1).modality = 'force';
subject(5).session(1).movement(1).effector = 'hand';
subject(5).session(1).movement(1).side = 'right';
subject(5).session(1).movement(1).channel='analog2';

subject(5).session(1).movement(2).name = 'grip_force_left';
subject(5).session(1).movement(2).modality = 'force';
subject(5).session(1).movement(2).effector = 'hand';
subject(5).session(1).movement(2).side = 'left';
subject(5).session(1).movement(2).channel = 'analog1';

%% RECORDING segment
subject(5).session(1).segment(1).electrodes = {'SMR'};
subject(5).session(1).segment(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6'};
subject(5).session(1).segment(1).timewindows = [10 140];
subject(5).session(1).segment(2).electrodes = {'SMR'};
subject(5).session(1).segment(2).timewindows = [320 390];

subject(5).session(2).raw_filename = 'session2_RIGHT_2_stn_vary.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
subject(5).session(2).ecog = subject(5).session(1).ecog;


subject(5).session(2).movement = subject(5).session(1).movement;
%% RECORDING segment
subject(5).session(2).segment(1).electrodes = {'SMR'};
subject(5).session(2).segment(1).timewindows = [27 306];

subject(5).session(3).raw_filename = 'session2_RIGHT_3_stn_vary.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
subject(5).session(3).ecog = subject(5).session(1).ecog;
subject(5).session(3).movement = subject(5).session(1).movement;

subject(5).session(3).lfp(1).electrode_name = 'STNR';
subject(5).session(3).lfp(1).electrode_type = 'Medtronic3389';
subject(5).session(3).lfp(1).target = 'stn';
subject(5).session(3).lfp(1).hemisphere = 'right';
subject(5).session(3).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
subject(5).session(3).lfp(1).spacing = 1.5;
subject(5).session(3).lfp(1).diameter = 1.3;
subject(5).session(3).lfp(1).length = 2;
subject(5).session(3).lfp(1).rereferencing = 'bipolar';
subject(5).session(3).lfp(1).location = [11.8280802308701,-15.1597482742092,-7.76909845640809;12.3908351968705,-14.2925082817827,-5.93679869908870;12.9308491482857,-13.4128499400548,-4.09165661961333;13.4445757895455,-12.5266969282481,-2.24263538187425]'; %1 is right
subject(5).session(3).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';


%% RECORDING segment
subject(5).session(3).segment(1).electrodes = {'SMR', 'STNR'};
subject(5).session(3).segment(1).timewindows = [6 288];


%% GENERAL SUBJECT INFORMATION SUBJECT 6
subject(6).ID = 'N006';
subject(6).center_ID = 'DBS4020';
subject(6).raw_dir = fullfile(subject_root,subject(6).center_ID);
subject(6).disease = 'PD';
subject(6).center = 'UPMC';
subject(6).curator = 'Richardson';
subject(6).age = 54.7;
subject(6).sex = 'f';

%% CLINICAL SCORES
subject(6).scores.updrs.total = 0;
subject(6).scores.updrs.left = 0;
subject(6).scores.updrs.right = 0;
subject(6).scores.updrs.axial = subject(6).scores.updrs.total-subject(6).scores.updrs.left-subject(6).scores.updrs.right;

%% SESSION RAW DATA FILE
subject(6).session(1).raw_filename = 'session_GT001_LEFT_stn_vary.mat';

%% ECOG ELECTRODES

subject(6).session(1).ecog(1).electrode_name = 'SML';
subject(6).session(1).ecog(1).electrode_type = 'AdTech8';
subject(6).session(1).ecog(1).target = 'sensorimotor';
subject(6).session(1).ecog(1).hemisphere  = 'left';
subject(6).session(1).ecog(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6','ecog_1_7','ecog_1_8'};
subject(6).session(1).ecog(1).spacing = 10;
subject(6).session(1).ecog(1).diameter = 4;
subject(6).session(1).ecog(1).exposure = 2.3;
subject(6).session(1).ecog(1).grid = [8 1];
subject(6).session(1).ecog(1).rereferencing = 'common_average';
subject(6).session(1).ecog(1).location = [-40.4263797813727,-59.8830328434330,52.6158034794833;-36.8696575599663,-50.8169066547983,56.9486059246621;-39.1020227870243,-41.8973027726841,57.8482434667648;-48.0771316036300,-32.2073861116666,54.6371375934335;-49.7858454305499,-22.8507435653852,51.6268583991136;-49.5215230486627,-14.3900514117659,49.4603282302432;-48.3028311880300,-4.49128782313146,47.9109274878282;-46.2612177019331,4.97010764414704,48.0014721704011]'; %right is positive 
subject(6).session(1).ecog(1).space = 'MNI152_6th';



%% MOVEMENT TRACES
subject(6).session(1).movement(1).name = 'grip_force_right';
subject(6).session(1).movement(1).modality = 'force';
subject(6).session(1).movement(1).effector = 'hand';
subject(6).session(1).movement(1).side = 'right';
subject(6).session(1).movement(1).channel='analog1';

subject(6).session(1).movement(2).name = 'grip_force_left';
subject(6).session(1).movement(2).modality = 'force';
subject(6).session(1).movement(2).effector = 'hand';
subject(6).session(1).movement(2).side = 'left';
subject(6).session(1).movement(2).channel = 'analog2';

%% RECORDING segment
subject(6).session(1).segment(1).electrodes = {'SML'};
subject(6).session(1).segment(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6','ecog_1_7','ecog_1_8'};
subject(6).session(1).segment(1).timewindows = [6 215];


subject(6).session(2).raw_filename = 'session_STIM_LEFT_stn_vary.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
subject(6).session(2).ecog = subject(6).session(1).ecog;
subject(6).session(2).movement = subject(6).session(1).movement;

subject(6).session(2).lfp(1).electrode_name = 'STNL';
subject(6).session(2).lfp(1).electrode_type = 'Medtronic3389';
subject(6).session(2).lfp(1).target = 'stn';
subject(6).session(2).lfp(1).hemisphere = 'left';
subject(6).session(2).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
subject(6).session(2).lfp(1).spacing = 1.5;
subject(6).session(2).lfp(1).diameter = 1.3;
subject(6).session(2).lfp(1).length = 2;
subject(6).session(2).lfp(1).rereferencing = 'bipolar';
subject(6).session(2).lfp(1).location = [-12.2177052566208,9.12785773807161,-3.41584183905801;-12.5518288711589,9.56954212504596,-1.48508880069152;-12.8823518248658,10.0014933685401,0.447612904730862;-13.1995338475386,10.4226381593767,2.39407312936883]'; %1 is right
subject(6).session(2).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';

%% RECORDING segment
subject(6).session(2).segment(1).electrodes = {'SML', 'STNL'};
subject(6).session(2).segment(1).timewindows = [9 435];





subject(6).session(3).raw_filename = 'session_GT001_RIGHT_stn_vary.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES

subject(6).session(3).ecog(1).electrode_name = 'SMR';
subject(6).session(3).ecog(1).electrode_type = 'AdTech8';
subject(6).session(3).ecog(1).target = 'sensorimotor';
subject(6).session(3).ecog(1).hemisphere  = 'right';
subject(6).session(3).ecog(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6','ecog_1_7','ecog_1_8'};
subject(6).session(3).ecog(1).spacing = 10;
subject(6).session(3).ecog(1).diameter = 4;
subject(6).session(3).ecog(1).exposure = 2.3;
subject(6).session(3).ecog(1).grid = [8 1];
subject(6).session(3).ecog(1).rereferencing = 'common_average';
subject(6).session(3).ecog(1).location = [26.3954905525653,-55.6490554867042,66.9211169947841;28.1756350074243,-45.2287260912899,68.9363955026171;30.2172484935212,-35.7673306240113,69.0269401851900;37.6829552761159,-26.2227258428747,67.5121956086947;43.3063603655225,-16.2616376331439,64.1913350941198;43.8978757052882,-7.82215962947491,59.5886631007231;43.2085419460922,1.55536760956815,56.7445544194948;42.5199215245585,13.2878013690500,53.8399966523639]'; %right is positive 
subject(6).session(3).ecog(1).space = 'MNI152_6th';

subject(6).session(3).movement = subject(6).session(1).movement;
%% RECORDING segment
subject(6).session(3).segment(1).electrodes = {'SMR'};
subject(6).session(3).segment(1).timewindows = [9 126];
subject(6).session(3).segment(2).electrodes = {'SMR'};
subject(6).session(3).segment(2).timewindows = [222 495];
subject(6).session(3).segment(3).electrodes = {'SMR'};
subject(6).session(3).segment(3).timewindows = [774 882];


subject(6).session(4).raw_filename = 'session_STIM_RIGHT_stn_vary.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
subject(6).session(4).ecog = subject(6).session(3).ecog;

subject(6).session(4).lfp(1).electrode_name = 'STNR';
subject(6).session(4).lfp(1).electrode_type = 'Medtronic3389';
subject(6).session(4).lfp(1).target = 'stn';
subject(6).session(4).lfp(1).hemisphere = 'right';
subject(6).session(4).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
subject(6).session(4).lfp(1).spacing = 1.5;
subject(6).session(4).lfp(1).diameter = 1.3;
subject(6).session(4).lfp(1).length = 2;
subject(6).session(4).lfp(1).rereferencing = 'bipolar';
subject(6).session(4).lfp(1).location = [41.5998745546972,5.28506886806871,-0.718333835894686;41.1145835731876,4.63706754763461,1.43063848250630;40.6346392944267,3.97147465309820,3.55647377709406;40.1660058733735,3.29359956096075,5.66725148028892]'; %1 is right
subject(6).session(4).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';

subject(6).session(4).movement = subject(6).session(1).movement;
%% RECORDING segment
subject(6).session(4).segment(1).electrodes = {'SMR', 'STNR'};
subject(6).session(4).segment(1).timewindows = [9 177];


%% GENERAL SUBJECT INFORMATION SUBJECT 7

subject(7).ID = 'N007';
subject(7).center_ID = 'DBS4022';
subject(7).raw_dir = fullfile(subject_root,subject(7).center_ID);
subject(7).disease = 'PD';
subject(7).center = 'UPMC';
subject(7).curator = 'Richardson';
subject(7).age = 71.6;
subject(7).sex = 'm';

%% CLINICAL SCORES
subject(7).scores.updrs.total = 55;
subject(7).scores.updrs.left = 14;
subject(7).scores.updrs.right = 20;
subject(7).scores.updrs.axial = subject(7).scores.updrs.total-subject(7).scores.updrs.left-subject(7).scores.updrs.right;

%% SESSION RAW DATA FILE
subject(7).session(1).raw_filename = 'session2_LEFT_stn_vary.mat';

%% ECOG ELECTRODES
subject(7).session(1).ecog(1).electrode_name = 'SML';
subject(7).session(1).ecog(1).electrode_type = 'AdTech8';
subject(7).session(1).ecog(1).target = 'sensorimotor';
subject(7).session(1).ecog(1).hemisphere  = 'left';
subject(7).session(1).ecog(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6'};
subject(7).session(1).ecog(1).spacing = 10;
subject(7).session(1).ecog(1).diameter = 4;
subject(7).session(1).ecog(1).exposure = 2.3;
subject(7).session(1).ecog(1).grid = [6 1];
subject(7).session(1).ecog(1).rereferencing = 'common_average';
subject(7).session(1).ecog(1).location = [-31.7112545800000,-43.3060207000000,67.2120546400000;-37.0925413000000,-32.0792333300000,67.0775516400000;-40.0701977100000,-22.2551717400000,65.3262659800000;-40.6827961500000,-13.4126522300000,62.9597434800000;-41.2953945900000,-4.57013272300000,60.5932209800000;-43.2237341400000,4.59643558200000,54.3084694200000]'; %right is positive 
subject(7).session(1).ecog(1).space = 'MNI152_6th';


%% MOVEMENT TRACES
subject(7).session(1).movement(1).name = 'grip_force_right';
subject(7).session(1).movement(1).modality = 'force';
subject(7).session(1).movement(1).effector = 'hand';
subject(7).session(1).movement(1).side = 'right';
subject(7).session(1).movement(1).channel='analog2';

subject(7).session(1).movement(2).name = 'grip_force_left';
subject(7).session(1).movement(2).modality = 'force';
subject(7).session(1).movement(2).effector = 'hand';
subject(7).session(1).movement(2).side = 'left';
subject(7).session(1).movement(2).channel = 'analog1';

%% RECORDING segment
subject(7).session(1).segment(1).electrodes = {'SML', 'STNL'};
subject(7).session(1).segment(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6'};
subject(7).session(1).segment(1).timewindows = [9 327];

subject(7).session(2).raw_filename = 'session4_LEFT_stn_fixed.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
subject(7).session(2).ecog = subject(7).session(1).ecog;
subject(7).session(2).lfp(1).electrode_name = 'STNL';
subject(7).session(2).lfp(1).electrode_type = 'Medtronic3389';
subject(7).session(2).lfp(1).target = 'stn';
subject(7).session(2).lfp(1).hemisphere = 'left';
subject(7).session(2).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
subject(7).session(2).lfp(1).spacing = 1.5;
subject(7).session(2).lfp(1).diameter = 1.3;
subject(7).session(2).lfp(1).length = 2;
subject(7).session(2).lfp(1).rereferencing = 'bipolar';
subject(7).session(2).lfp(1).location = [-13.6437836314700,-14.5720167063749,-5.18291010560053;-14.2823590906979,-13.4971762745402,-3.38267697966439;-14.9209345499257,-12.4223358427056,-1.58244385372825;-15.5595100091536,-11.3474954108709,0.217789272207887]'; %1 is right
subject(7).session(2).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';
subject(7).session(2).movement = subject(7).session(1).movement;
%% RECORDING segment
subject(7).session(2).segment(1).electrodes = {'SML', 'STNL'};
subject(7).session(2).segment(1).timewindows = [16 348];
%only left, and for each left session STN is used here

%% GENERAL SUBJECT INFORMATION SUBJECT 8
subject(8).ID = 'N008';
subject(8).center_ID = 'DBS4024';
subject(8).raw_dir = fullfile(subject_root,subject(8).center_ID);
subject(8).disease = 'PD';
subject(8).center = 'UPMC';
subject(8).curator = 'Richardson';
subject(8).age = 66.8;
subject(8).sex = 'm';

%% CLINICAL SCORES
subject(8).scores.updrs.total = 62;
subject(8).scores.updrs.left = 24;
subject(8).scores.updrs.right = 22;
subject(8).scores.updrs.axial = subject(8).scores.updrs.total-subject(8).scores.updrs.left-subject(8).scores.updrs.right;

%% SESSION RAW DATA FILE
subject(8).session(1).raw_filename = 'session1_LEFT_stn_vary.mat';

%% ECOG ELECTRODES
subject(8).session(1).ecog(1).electrode_name = 'SML';
subject(8).session(1).ecog(1).electrode_type = 'AdTech6';
subject(8).session(1).ecog(1).target = 'sensorimotor';
subject(8).session(1).ecog(1).hemisphere  = 'left';
subject(8).session(1).ecog(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6'};
subject(8).session(1).ecog(1).spacing = 10;
subject(8).session(1).ecog(1).diameter = 4;
subject(8).session(1).ecog(1).exposure = 2.3;
subject(8).session(1).ecog(1).grid = [6 1];
subject(8).session(1).ecog(1).rereferencing = 'common_average';
subject(8).session(1).ecog(1).location = [-53.4054311275006,-22.0825915966518,58.4870310450112;-53.7369977738749,-12.0902696877419,55.4570768101798;-52.1941288402535,-3.00074977267606,53.2799665807422;-51.4647919167153,5.06828777280544,49.1455976739497;-49.7530269281225,13.1049583706351,45.1576629273330;-45.1784257718513,21.5709527841273,42.5144429198328]'; %right is positive 
subject(8).session(1).ecog(1).space = 'MNI152_6th';


%% MOVEMENT TRACES
subject(8).session(1).movement(1).name = 'grip_force_right';
subject(8).session(1).movement(1).modality = 'force';
subject(8).session(1).movement(1).effector = 'hand';
subject(8).session(1).movement(1).side = 'right';
subject(8).session(1).movement(1).channel='analog2';

subject(8).session(1).movement(2).name = 'grip_force_left';
subject(8).session(1).movement(2).modality = 'force';
subject(8).session(1).movement(2).effector = 'hand';
subject(8).session(1).movement(2).side = 'left';
subject(8).session(1).movement(2).channel = 'analog1';

%% RECORDING segment
subject(8).session(1).segment(1).electrodes = {'SML'};
subject(8).session(1).segment(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6'};
subject(8).session(1).segment(1).timewindows = [288 555];
subject(8).session(1).segment(2).electrodes = {'SML'};
subject(8).session(1).segment(2).timewindows = [960 1308];
subject(8).session(1).segment(3).electrodes = {'SML'};
subject(8).session(1).segment(3).timewindows = [1812 1920];
subject(8).session(1).segment(4).electrodes = {'SML'};
subject(8).session(1).segment(4).timewindows = [2082 2295];
subject(8).session(1).segment(5).electrodes = {'SML'};
subject(8).session(1).segment(5).timewindows = [2496 2574];
subject(8).session(1).segment(6).electrodes = {'SML'};
subject(8).session(1).segment(6).timewindows = [2685 2724];

subject(8).session(2).raw_filename = 'session3_LEFT_stn_fixed.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
%% LFP ELECTRODES
subject(8).session(2).lfp(1).electrode_name = 'STNL';
subject(8).session(2).lfp(1).electrode_type = 'Medtronic3389';
subject(8).session(2).lfp(1).target = 'stn';
subject(8).session(2).lfp(1).hemisphere = 'left';
subject(8).session(2).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
subject(8).session(2).lfp(1).spacing = 1.5;
subject(8).session(2).lfp(1).diameter = 1.3;
subject(8).session(2).lfp(1).length = 2;
subject(8).session(2).lfp(1).rereferencing = 'bipolar';
subject(8).session(2).lfp(1).location = [-11.6657938224015,-12.6181799898744,-7.65735200098993;-12.2761969933976,-11.2701743079737,-6.01108327334801;-12.8866001643937,-9.92216862607297,-4.36481454570609;-13.4970033353898,-8.57416294417225,-2.71854581806417]'; %1 is right
subject(8).session(2).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';
subject(8).session(2).ecog = subject(8).session(1).ecog;
subject(8).session(2).movement = subject(8).session(1).movement;
%% RECORDING segment
subject(8).session(2).segment(1).electrodes = {'SML', 'STNL'};
subject(8).session(2).segment(1).timewindows = [81 414];

subject(8).session(3).raw_filename = 'session4_RIGHT_stn_vary.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
subject(8).session(3).ecog(1).electrode_name = 'SMR';
subject(8).session(3).ecog(1).electrode_type = 'AdTech6';
subject(8).session(3).ecog(1).target = 'sensorimotor';
subject(8).session(3).ecog(1).hemisphere  = 'right';
subject(8).session(3).ecog(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6'};
subject(8).session(3).ecog(1).spacing = 10;
subject(8).session(3).ecog(1).diameter = 4;
subject(8).session(3).ecog(1).exposure = 2.3;
subject(8).session(3).ecog(1).grid = [6 1];
subject(8).session(3).ecog(1).rereferencing = 'common_average';
subject(8).session(3).ecog(1).location = [47.0558285314765,-20.4411637157166,63.7100387644240;46.5493933075028,-10.7604852467290,62.1454724732246;46.2178266611286,-0.768163337819039,59.1155182383932;45.7958394646405,8.38609047255054,56.6455396886042;45.5487208457520,17.8519877228424,52.7101731951831;39.3166132864215,26.6740185605050,48.4561774257506]'; %right is positive 
subject(8).session(3).ecog(1).space = 'MNI152_6th';
subject(8).session(3).movement = subject(8).session(1).movement;
%% RECORDING segment
subject(8).session(3).segment(1).electrodes = {'SMR'};
subject(8).session(3).segment(1).timewindows = [3 315];

subject(8).session(4).raw_filename = 'session5_RIGHT_stn_vary.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
subject(8).session(4).lfp(1).electrode_name = 'STNR';
subject(8).session(4).lfp(1).electrode_type = 'Medtronic3389';
subject(8).session(4).lfp(1).target = 'stn';
subject(8).session(4).lfp(1).hemisphere = 'right';
subject(8).session(4).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
subject(8).session(4).lfp(1).spacing = 1.5;
subject(8).session(4).lfp(1).diameter = 1.3;
subject(8).session(4).lfp(1).length = 2;
subject(8).session(4).lfp(1).rereferencing = 'bipolar';
subject(8).session(4).lfp(1).location = [8.17499686509567,-15.0699953145770,-11.5612755427096;8.77750554872250,-13.7718201367204,-9.99154277400206;9.38001423234933,-12.4736449588638,-8.42181000529451;9.98252291597616,-11.1754697810072,-6.85207723658697]'; %1 is right
subject(8).session(4).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';
subject(8).session(4).ecog = subject(8).session(3).ecog;
subject(8).session(4).movement = subject(8).session(1).movement;
%% RECORDING segment
subject(8).session(4).segment(1).electrodes = {'SMR', 'STNR'};
subject(8).session(4).segment(1).timewindows = [15 387];


%% GENERAL SUBJECT INFORMATION SUBJECT 9
subject(9).ID = 'N009';
subject(9).center_ID = 'DBS4025';
subject(9).raw_dir = fullfile(subject_root,subject(9).center_ID);
subject(9).disease = 'PD';
subject(9).center = 'UPMC';
subject(9).curator = 'Richardson';
subject(9).age = 59.6;
subject(9).sex = 'm';

%% CLINICAL SCORES
subject(9).scores.updrs.total = 52;
subject(9).scores.updrs.left = 20;
subject(9).scores.updrs.right = 15;
subject(9).scores.updrs.axial = subject(9).scores.updrs.total-subject(9).scores.updrs.left-subject(9).scores.updrs.right;

%% SESSION RAW DATA FILE
subject(9).session(1).raw_filename = 'session6_LEFT_stn_fixed.mat';

%% ECOG ELECTRODES
subject(9).session(1).ecog(1).electrode_name = 'SML';
subject(9).session(1).ecog(1).electrode_type = 'AdTech6';
subject(9).session(1).ecog(1).target = 'sensorimotor';
subject(9).session(1).ecog(1).hemisphere  = 'left';
subject(9).session(1).ecog(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6'};
subject(9).session(1).ecog(1).spacing = 10;
subject(9).session(1).ecog(1).diameter = 4;
subject(9).session(1).ecog(1).exposure = 2.3;
subject(9).session(1).ecog(1).grid = [6 1];
subject(9).session(1).ecog(1).rereferencing = 'common_average';
subject(9).session(1).ecog(1).location = [-34.1910651771137,-33.7892286483117,69.6956376016103;-35.4336092493433,-24.4487271520736,68.4690958090894;-36.7091109933463,-14.9167051617457,64.8880709028582;-39.6206681294125,-7.21485603905123,59.8690179245709;-44.3693281476986,0.127977925536565,51.5549429655027;-46.3112466052366,7.56103651365578,45.5801732614025]'; %right is positive 
subject(9).session(1).ecog(1).space = 'MNI152_6th';

%% LFP ELECTRODES
subject(9).session(1).lfp(1).electrode_name = 'STNL';
subject(9).session(1).lfp(1).electrode_type = 'Medtronic3389';
subject(9).session(1).lfp(1).target = 'stn';
subject(9).session(1).lfp(1).hemisphere = 'left';
subject(9).session(1).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
subject(9).session(1).lfp(1).spacing = 1.5;
subject(9).session(1).lfp(1).diameter = 1.3;
subject(9).session(1).lfp(1).length = 2;
subject(9).session(1).lfp(1).rereferencing = 'bipolar';
subject(9).session(1).lfp(1).location = [-12.2077678269711,-12.5755851612867,-9.62336163756834;-12.8391255752978,-11.1385583479471,-7.97440915347972;-13.4849593547560,-9.70038121537148,-6.28655054372637;-14.1321912323345,-8.26635072158277,-4.56164156608606]'; %1 is right
subject(9).session(1).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';

%% MOVEMENT TRACES
subject(9).session(1).movement(1).name = 'grip_force_right';
subject(9).session(1).movement(1).modality = 'force';
subject(9).session(1).movement(1).effector = 'hand';
subject(9).session(1).movement(1).side = 'right';
subject(9).session(1).movement(1).channel='analog2';

subject(9).session(1).movement(2).name = 'grip_force_left';
subject(9).session(1).movement(2).modality = 'force';
subject(9).session(1).movement(2).effector = 'hand';
subject(9).session(1).movement(2).side = 'left';
subject(9).session(1).movement(2).channel = 'analog1';

%% RECORDING segment
subject(9).session(1).segment(1).electrodes = {'SML', 'STNL'};
subject(9).session(1).segment(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6', 'stn1','stn2','stn3','stn4'};
subject(9).session(1).segment(1).timewindows = [6 354];
subject(9).session(1).segment(1).location = [];


%% GENERAL SUBJECT INFORMATION SUBJECT 10
subject(10).ID = 'N010';
subject(10).center_ID = 'DBS4029';
subject(10).raw_dir = fullfile(subject_root,subject(10).center_ID);
subject(10).disease = 'PD';
subject(10).center = 'UPMC';
subject(10).curator = 'Richardson';
subject(10).age = 51.2;
subject(10).sex = 'm';

%% CLINICAL SCORES
subject(10).scores.updrs.total = 27;
subject(10).scores.updrs.left = 5;
subject(10).scores.updrs.right = 7;
subject(10).scores.updrs.axial = subject(10).scores.updrs.total-subject(10).scores.updrs.left-subject(10).scores.updrs.right;

%% SESSION RAW DATA FILE
subject(10).session(1).raw_filename = 'session_File_1__LEFT_not_fixed.mat';

%% ECOG ELECTRODES
subject(10).session(1).ecog(1).electrode_name = 'SML';
subject(10).session(1).ecog(1).electrode_type = 'AdTech14x2';
subject(10).session(1).ecog(1).target = 'sensorimotor';
subject(10).session(1).ecog(1).hemisphere  = 'left';
subject(10).session(1).ecog(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6','ecog_1_7','ecog_1_8','ecog_1_9','ecog_1_10','ecog_1_11','ecog_1_12','ecog_1_13','ecog_1_14','ecog_1_15','ecog_1_16','ecog_1_17','ecog_1_18','ecog_1_19','ecog_1_20','ecog_1_21','ecog_1_22','ecog_1_23','ecog_1_24','ecog_1_25','ecog_1_26','ecog_1_27','ecog_1_28'};
subject(10).session(1).ecog(1).spacing = 4;
subject(10).session(1).ecog(1).diameter = 4;
subject(10).session(1).ecog(1).exposure = 1.17;
subject(10).session(1).ecog(1).grid = [14 2];
subject(10).session(1).ecog(1).rereferencing = 'common_average';
subject(10).session(1).ecog(1).location =[-30.5961946985062,-58.9213488024049,112.650461427683;-30.5159447584964,-55.3832454506134,114.038555726678;-31.4256961726143,-50.8382181249061,115.136759047767;-33.3555723049241,-46.5550054233122,115.109594331942;-32.2653177989059,-43.0231998897032,116.504719789825;-34.1751907193350,-37.7393610323760,116.194695254983;-37.1451947817178,-34.7185891106287,115.325022321264;-36.0250540041215,-29.4536437078489,115.036091263086;-36.9550457226067,-25.4448412667334,113.897620828125;-37.8850374410917,-21.4360388256178,112.759150393164;-40.8552785959610,-17.9508656327289,109.369943884377;-40.7952689603185,-14.9489871655291,108.521364427322;-41.7052574669227,-9.93955856868027,107.100034173343;-40.6152400533910,-5.94335176392970,105.975626056158;-32.6063207708259,-58.1762394526024,111.235202412864;-32.5460740426969,-55.6387622565442,112.906156530877;-34.4959533868876,-52.3561757106835,113.161851634071;-36.4258295191975,-48.0729630090897,113.134686918247;-38.3557056515074,-43.7897503074957,113.107522202423;-38.2554524996168,-39.2510207999709,114.212756682399;-40.1954487841103,-35.2359205406728,113.067255088550;-41.1254405025954,-31.2271180995573,111.928784653589;-41.0454276550721,-27.2246134766242,110.797345377516;-41.9652992213735,-22.9476985932128,110.777211820580;-43.9154156580507,-19.2007107762105,108.513373348706;-44.8254041646550,-14.1912821793617,107.092043094727;-44.7453913171317,-10.1887775564286,105.960603818654;-43.6553739035999,-6.19257075167805,104.836195701469]'; %right is positive 
%% CHECK LOCATION
subject(10).session(1).ecog(1).location(3,:) = subject(10).session(1).ecog(1).location(3,:)-40;
subject(10).session(1).ecog(1).space = 'MNI152_6th';


%% MOVEMENT TRACES
subject(10).session(1).movement(1).name = 'grip_force_right';
subject(10).session(1).movement(1).modality = 'force';
subject(10).session(1).movement(1).effector = 'hand';
subject(10).session(1).movement(1).side = 'right';
subject(10).session(1).movement(1).channel='analog2';

subject(10).session(1).movement(2).name = 'grip_force_left';
subject(10).session(1).movement(2).modality = 'force';
subject(10).session(1).movement(2).effector = 'hand';
subject(10).session(1).movement(2).side = 'left';
subject(10).session(1).movement(2).channel = 'analog1';

%% RECORDING segment
subject(10).session(1).segment(1).electrodes = {'SML'};
subject(10).session(1).segment(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6','ecog_1_7','ecog_1_8','ecog_1_9','ecog_1_10','ecog_1_11','ecog_1_12','ecog_1_13','ecog_1_14','ecog_1_15','ecog_1_16','ecog_1_17','ecog_1_18','ecog_1_19','ecog_1_20','ecog_1_21','ecog_1_22','ecog_1_23','ecog_1_24','ecog_1_25','ecog_1_26','ecog_1_27','ecog_1_28'};
subject(10).session(1).segment(1).timewindows = [27 153];
subject(10).session(1).segment(1).location = [];
subject(10).session(1).segment(2).electrodes = {'SML'};
subject(10).session(1).segment(2).timewindows = [409 561];
subject(10).session(1).segment(3).electrodes = {'SML'};
subject(10).session(1).segment(3).timewindows = [636 810];
subject(10).session(1).segment(4).electrodes = {'SML'};
subject(10).session(1).segment(4).timewindows = [918 1272];


subject(10).session(2).raw_filename = 'session_Stim_2_LEFT_fixed.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
subject(10).session(2).ecog = subject(10).session(1).ecog;
%% LFP ELECTRODES
subject(10).session(2).lfp(1).electrode_name = 'STNL';
subject(10).session(2).lfp(1).electrode_type = 'Medtronic3389';
subject(10).session(2).lfp(1).target = 'stn';
subject(10).session(2).lfp(1).hemisphere = 'left';
subject(10).session(2).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
subject(10).session(2).lfp(1).spacing = 1.5;
subject(10).session(2).lfp(1).diameter = 1.3;
subject(10).session(2).lfp(1).length = 2;
subject(10).session(2).lfp(1).rereferencing = 'bipolar';
subject(10).session(2).lfp(1).location = [-13.1309885474701,-15.2448242986152,-7.88928262614140;-13.8958806059024,-14.2225634701060,-6.00887237411872;-14.6423363143696,-13.2073329388355,-4.17952625951069;-15.3646789810762,-12.2022589094479,-2.37266564110940]'; %1 is right
subject(10).session(2).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';
subject(10).session(2).movement = subject(10).session(1).movement;
%% RECORDING segment
subject(10).session(2).segment(1).electrodes = {'SML', 'STNL'};
subject(10).session(2).segment(1).timewindows = [6 372];

subject(10).session(3).raw_filename = 'session_Right_1_RIGHT_not_fixed.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
subject(10).session(3).ecog(1).electrode_name = 'SMR';
subject(10).session(3).ecog(1).electrode_type = 'AdTech14x2';
subject(10).session(3).ecog(1).target = 'sensorimotor';
subject(10).session(3).ecog(1).hemisphere  = 'right';
subject(10).session(3).ecog(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6','ecog_1_7','ecog_1_8','ecog_1_9','ecog_1_10','ecog_1_11','ecog_1_12','ecog_1_13','ecog_1_14','ecog_1_15','ecog_1_16','ecog_1_17','ecog_1_18','ecog_1_19','ecog_1_20','ecog_1_21','ecog_1_22','ecog_1_23','ecog_1_24','ecog_1_25','ecog_1_26','ecog_1_27','ecog_1_28'};
subject(10).session(3).ecog(1).spacing = 4;
subject(10).session(3).ecog(1).diameter = 4;
subject(10).session(3).ecog(1).exposure = 1.17;
subject(10).session(3).ecog(1).grid = [14 2];
subject(10).session(3).ecog(1).rereferencing = 'common_average';
subject(10).session(3).ecog(1).location = [29.1260769600000,-47.4169720000000,70.6787514700000;28.2062054000000,-43.1400571200000,70.6586179100000;29.3164631100000,-38.6076254300000,71.7708835500000;31.4466084600000,-33.3489778500000,71.4889836500000;30.5067336800000,-30.0726891200000,71.7517099100000;31.6268744600000,-24.8077437200000,71.4627788600000;34.7270179400000,-21.5566462600000,71.7536297500000;34.8371541500000,-16.2854030400000,71.4576675400000;35.9271715700000,-12.2891962400000,70.3332594200000;37.0171889800000,-8.29298943100000,69.2088513000000;40.1170953800000,-4.57749070500000,66.9801686200000;40.1771050100000,-1.57561223800000,66.1315891700000;40.2670009200000,3.15940609900000,63.5989531900000;39.3471293500000,7.43632098200000,63.5788196400000;31.1559691500000,-46.6970539300000,69.2916170900000;30.2160943800000,-43.4207652000000,69.5543433500000;32.3262365100000,-39.1627437700000,69.5553032700000;34.4363786400000,-34.9047223400000,69.5562631900000;35.5365162100000,-30.6404030900000,69.5501919500000;36.6366537700000,-26.3760838500000,69.5441207100000;38.7467959000000,-22.1180624200000,69.5450806300000;39.8368133200000,-18.1218556100000,68.4206725200000;39.9269463200000,-13.8512385500000,68.4075701200000;41.0169637300000,-9.85503174400000,67.2831620000000;43.1169857100000,-5.86512275700000,66.1657850400000;43.2170017700000,-0.861991979000000,64.7514859500000;43.2868944600000,2.87240020200000,62.5017097900000;43.3669073100000,6.87490482500000,61.3702705200000]'; %right is positive 
subject(10).session(3).ecog(1).space = 'MNI152_6th';

subject(10).session(3).movement = subject(10).session(1).movement;
%% RECORDING segment
subject(10).session(3).segment(1).electrodes = {'SMR'};
subject(10).session(3).segment(1).timewindows = [36 342];

subject(10).session(4).raw_filename = 'session_Right_2_RIGHT_not_fixed.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
subject(10).session(4).ecog = subject(10).session(3).ecog;


subject(10).session(4).movement = subject(10).session(1).movement;
%% RECORDING segment
subject(10).session(4).segment(1).electrodes = {'SMR'};
subject(10).session(4).segment(1).timewindows = [12 333];

subject(10).session(5).raw_filename = 'session_Task_RT_RIGHT_1_fixed.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
subject(10).session(5).ecog = subject(10).session(4).ecog;

subject(10).session(5).lfp(1).electrode_name = 'STNR';
subject(10).session(5).lfp(1).electrode_type = 'Medtronic3389';
subject(10).session(5).lfp(1).target = 'stn';
subject(10).session(5).lfp(1).hemisphere = 'right';
subject(10).session(5).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
subject(10).session(5).lfp(1).spacing = 1.5;
subject(10).session(5).lfp(1).diameter = 1.3;
subject(10).session(5).lfp(1).length = 2;
subject(10).session(5).lfp(1).rereferencing = 'bipolar';
subject(10).session(5).lfp(1).location = [12.9624644054772,-12.3178037888320,-7.46686612947404;13.7584243706325,-11.3787057401788,-5.60710681789168;14.5263262119299,-10.4612843962268,-3.78556270750632;15.2423895751163,-9.57319459396523,-1.96741668986053]'; %1 is right
subject(10).session(5).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';

subject(10).session(5).movement = subject(10).session(1).movement;
%% RECORDING segment
subject(10).session(5).segment(1).electrodes = {'SMR', 'STNR'};
subject(10).session(5).segment(1).timewindows = [26 498];

%% GENERAL SUBJECT INFORMATION SUBJECT 11

subject(11).ID = 'N011';
subject(11).center_ID = 'DBS4030';
subject(11).raw_dir = fullfile(subject_root,subject(11).center_ID);
subject(11).disease = 'PD';
subject(11).center = 'UPMC';
subject(11).curator = 'Richardson';
subject(11).age = 54.4;
subject(11).sex = 'm';

%% CLINICAL SCORES
subject(11).scores.updrs.total = 34;
subject(11).scores.updrs.left = 10;
subject(11).scores.updrs.right = 10;
subject(11).scores.updrs.axial = subject(11).scores.updrs.total-subject(11).scores.updrs.left-subject(11).scores.updrs.right;

%% SESSION RAW DATA FILE
subject(11).session(1).raw_filename = 'session_GT0001_LEFT_vary.mat';

%% ECOG ELECTRODES

subject(11).session(1).ecog(1).electrode_name = 'SML';
subject(11).session(1).ecog(1).electrode_type = 'AdTech6';
subject(11).session(1).ecog(1).target = 'sensorimotor';
subject(11).session(1).ecog(1).hemisphere  = 'left';
subject(11).session(1).ecog(1).channels = {'ecog_2_1','ecog_2_2','ecog_2_3','ecog_2_4','ecog_2_5','ecog_2_6'};
subject(11).session(1).ecog(1).spacing = 10;
subject(11).session(1).ecog(1).diameter = 4;
subject(11).session(1).ecog(1).exposure = 2.3;
subject(11).session(1).ecog(1).grid = [6 1];
subject(11).session(1).ecog(1).rereferencing = 'common_average';
subject(11).session(1).ecog(1).location = [-29.2932692307692,-40.7500000000000,77.2932692307692;-29.7031250000000,-30.2031250000000,78.0468750000000;-30.7093023255814,-18.4534883720930,76.6337209302326;-32.1392405063291,-7.72151898734177,72.3417721518987;-34.5437500000000,1.41874999999999,67.6062500000000;-33.9038461538462,12.1858974358974,66.4230769230769]'; %right is positive 
subject(11).session(1).ecog(1).space = 'MNI152_6th';
%% LFP ELECTRODES

%% MOVEMENT TRACES
subject(11).session(1).movement(1).name = 'grip_force_right';
subject(11).session(1).movement(1).modality = 'force';
subject(11).session(1).movement(1).effector = 'hand';
subject(11).session(1).movement(1).side = 'right';
subject(11).session(1).movement(1).channel='analog2';

subject(11).session(1).movement(2).name = 'grip_force_left';
subject(11).session(1).movement(2).modality = 'force';
subject(11).session(1).movement(2).effector = 'hand';
subject(11).session(1).movement(2).side = 'left';
subject(11).session(1).movement(2).channel = 'analog1';

%% RECORDING segment
subject(11).session(1).segment(1).electrodes = {'SML'};
subject(11).session(1).segment(1).channels = {'ecog_2_1','ecog_2_2','ecog_2_3','ecog_2_4','ecog_2_5','ecog_2_6', 'stn1', 'stn2', 'stn3', 'stn4'};
subject(11).session(1).segment(1).timewindows = [65 405];
subject(11).session(1).segment(1).location = [];
subject(11).session(1).segment(2).electrodes = {'SML'};
subject(11).session(1).segment(2).timewindows = [879 1110];
subject(11).session(1).segment(3).electrodes = {'SML'};
subject(11).session(1).segment(3).timewindows = [1281 1629];

subject(11).session(2).raw_filename = 'session_GT0002_RIGHT_vary.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
subject(11).session(2).ecog(1).electrode_name = 'PFR';
subject(11).session(2).ecog(1).electrode_type = 'AdTech4';
subject(11).session(2).ecog(1).target = 'prefrontal';
subject(11).session(2).ecog(1).hemisphere  = 'right';
subject(11).session(2).ecog(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4'};
subject(11).session(2).ecog(1).spacing = 10;
subject(11).session(2).ecog(1).diameter = 4;
subject(11).session(2).ecog(1).exposure = 2.3;
subject(11).session(2).ecog(1).grid = [4 1];
subject(11).session(2).ecog(1).rereferencing = 'common_average';
subject(11).session(2).ecog(1).location = [16.7234042553192,68.9574468085106,22.7234042553192;15.9104477611940,61.6194029850746,32.5970149253731;14.8400000000000,54.9500000000000,43.3900000000000;12.5128205128205,46.7820512820513,53.4743589743590]'; %right is positive 
subject(11).session(2).ecog(1).space = 'MNI152_6th';

subject(11).session(2).ecog(2).electrode_name = 'SMR';
subject(11).session(2).ecog(2).electrode_type = 'AdTech6';
subject(11).session(2).ecog(2).target = 'sensorimotor';
subject(11).session(2).ecog(2).hemisphere  = 'right';
subject(11).session(2).ecog(2).channels = {'ecog_2_1','ecog_2_2','ecog_2_3','ecog_2_4','ecog_2_5','ecog_2_6'};
subject(11).session(2).ecog(2).spacing = 10;
subject(11).session(2).ecog(2).diameter = 4;
subject(11).session(2).ecog(2).exposure = 2.3;
subject(11).session(2).ecog(2).grid = [6 1];
subject(11).session(2).ecog(2).rereferencing = 'common_average';
subject(11).session(2).ecog(2).location = [46.6818181818182,-51.7142857142857,63.5584415584416;43.8541666666667,-38.0486111111111,68.9444444444445;42.1410256410256,-25.4230769230769,71.4230769230769;37.5937500000000,-14.9062500000000,71.9687500000000;33.5757575757576,-6.62121212121213,70.6818181818182;33.6458333333333,0.312500000000000,68.4479166666667]'; %right is positive 
subject(11).session(2).ecog(2).space = 'MNI152_6th';

subject(11).session(2).movement = subject(11).session(1).movement;
%% RECORDING segment
subject(11).session(2).segment(1).electrodes = {'SMR', 'PFR'};
subject(11).session(2).segment(1).timewindows = [291 699];
subject(11).session(2).segment(2).electrodes = {'SMR', 'PFR'};
subject(11).session(2).segment(2).timewindows = [1176 1497];
subject(11).session(2).segment(3).electrodes = {'SMR', 'PFR'};
subject(11).session(2).segment(3).timewindows = [1848 2175];

subject(11).session(3).raw_filename = 'session_STIM0002_LEFT_vary.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
subject(11).session(3).ecog = subject(11).session(1).ecog;
subject(11).session(3).movement = subject(11).session(1).movement;
%% RECORDING segment
subject(11).session(3).segment(1).electrodes = {'SML'};
subject(11).session(3).segment(1).timewindows = [12 333];

subject(11).session(4).raw_filename = 'session_STIM0002_LEFT_vary.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES, the location is different than STN 
% subject(11).session(4).lfp(1).electrode_name = 'GPiL';
% subject(11).session(4).lfp(1).electrode_type = 'Medtronic3389';
% subject(11).session(4).lfp(1).target = 'gpi'; %gpi
% subject(11).session(4).lfp(1).hemisphere = 'left';
% subject(11).session(4).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
% subject(11).session(4).lfp(1).spacing = 1.5;
% subject(11).session(4).lfp(1).diameter = 1.3;
% subject(11).session(4).lfp(1).length = 2;
% subject(11).session(4).lfp(1).rereferencing = 'bipolar';
% subject(11).session(4).lfp(1).location = coord_struct(11).STN_Coord{2}'; %1 is right
% subject(11).session(4).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';
subject(11).session(4).ecog = subject(11).session(1).ecog;
subject(11).session(4).movement = subject(11).session(1).movement;
%% RECORDING segment

subject(11).session(4).segment(1).electrodes = {'SML'}; %'GPiL' has data, but is not interpolated  
subject(11).session(4).segment(1).timewindows = [18 439];

subject(11).session(5).raw_filename = 'session_STIM0003_RIGHT_fixed.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
% subject(11).session(5).lfp(1).electrode_name = 'GPiR';
% subject(11).session(5).lfp(1).electrode_type = 'Medtronic3389';
% subject(11).session(5).lfp(1).target = 'gpi';
% subject(11).session(5).lfp(1).hemisphere = 'right';
% subject(11).session(5).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
% subject(11).session(5).lfp(1).spacing = 1.5;
% subject(11).session(5).lfp(1).diameter = 1.3;
% subject(11).session(5).lfp(1).length = 2;
% subject(11).session(5).lfp(1).rereferencing = 'bipolar';
% subject(11).session(5).lfp(1).location = coord_struct(11).STN_Coord{1}'; %1 is right
% subject(11).session(5).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';
subject(11).session(5).ecog = subject(11).session(2).ecog;
subject(11).session(5).movement = subject(11).session(1).movement;
%% RECORDING segment
subject(11).session(5).segment(1).electrodes = {'SMR', 'PFR'}; %'GPiR' has data, but is not interpolated  
subject(11).session(5).segment(1).timewindows = [9 339];

%% GENERAL SUBJECT INFORMATION SUBJECT 12
subject(12).ID = 'N012';
subject(12).center_ID = 'DBS4031';
subject(12).raw_dir = fullfile(subject_root,subject(12).center_ID);
subject(12).disease = 'PD';
subject(12).center = 'UPMC';
subject(12).curator = 'Richardson';
subject(12).age = 67.9;
subject(12).sex = 'm';

%% CLINICAL SCORES
subject(12).scores.updrs.total = 48;
subject(12).scores.updrs.left = 19;
subject(12).scores.updrs.right = 14;
subject(12).scores.updrs.axial = subject(12).scores.updrs.total-subject(12).scores.updrs.left-subject(12).scores.updrs.right;

%% SESSION RAW DATA FILE
subject(12).session(1).raw_filename = 'session2_LEFT_vary.mat';

%% ECOG ELECTRODES --> it's actually a 8 contact strip, but only 6 contacts could be reliably evaluated 
subject(12).session(1).ecog(1).electrode_name = 'SML';
subject(12).session(1).ecog(1).electrode_type = 'AdTech6';
subject(12).session(1).ecog(1).target = 'sensorimotor';
subject(12).session(1).ecog(1).hemisphere  = 'left';
subject(12).session(1).ecog(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6'};
subject(12).session(1).ecog(1).spacing = 10;
subject(12).session(1).ecog(1).diameter = 4;
subject(12).session(1).ecog(1).exposure = 2.3;
subject(12).session(1).ecog(1).grid = [6 1];
subject(12).session(1).ecog(1).rereferencing = 'common_average';
subject(12).session(1).ecog(1).location = [-24.3117525179723,-48.6662282661974,71.6237170800244;-26.4846662365338,-38.6275584089854,70.3261749779042;-28.3327558812193,-28.4335258014101,69.8162233268658;-30.4003144154533,-19.4638325120731,68.0670761926927;-33.5019315212155,-11.6050583907220,64.0193790517481;-36.9779365803962,-2.73717556211417,59.4982791398618]'; %right is positive 
subject(12).session(1).ecog(1).space = 'MNI152_6th';


%% MOVEMENT TRACES
subject(12).session(1).movement(1).name = 'grip_force_right';
subject(12).session(1).movement(1).modality = 'force';
subject(12).session(1).movement(1).effector = 'hand';
subject(12).session(1).movement(1).side = 'right';
subject(12).session(1).movement(1).channel='analog2';

subject(12).session(1).movement(2).name = 'grip_force_left';
subject(12).session(1).movement(2).modality = 'force';
subject(12).session(1).movement(2).effector = 'hand';
subject(12).session(1).movement(2).side = 'left';
subject(12).session(1).movement(2).channel = 'analog1';

%% RECORDING segment
subject(12).session(1).segment(1).electrodes = {'SML'};
subject(12).session(1).segment(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6'};
subject(12).session(1).segment(1).timewindows = [0 225];
subject(12).session(1).segment(1).location = [];

subject(12).session(2).raw_filename = 'session3_LEFT_fixed.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
%% LFP ELECTRODES
subject(12).session(2).lfp(1).electrode_name = 'STNL';
subject(12).session(2).lfp(1).electrode_type = 'Medtronic3389';
subject(12).session(2).lfp(1).target = 'stn'; 
subject(12).session(2).lfp(1).hemisphere = 'left';
subject(12).session(2).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
subject(12).session(2).lfp(1).spacing = 1.5;
subject(12).session(2).lfp(1).diameter = 1.3;
subject(12).session(2).lfp(1).length = 2;
subject(12).session(2).lfp(1).rereferencing = 'bipolar';
subject(12).session(2).lfp(1).location = [-12.7371547792222,-22.7353208521232,-8.67819638254217;-13.0863453797907,-21.6974986057549,-6.56611872479417;-13.5034110667744,-20.6765019442782,-4.44531874452369;-13.9892847916524,-19.6759357451125,-2.31961022453986]'; %1 is right
subject(12).session(2).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';
subject(12).session(2).ecog = subject(12).session(1).ecog;
subject(12).session(2).movement = subject(12).session(1).movement;
%% RECORDING segment
subject(12).session(2).segment(1).electrodes = {'SML', 'STNL'};
subject(12).session(2).segment(1).timewindows = [6 276];

%% GENERAL SUBJECT INFORMATION SUBJECT 13
subject(13).ID = 'N013';
subject(13).center_ID = 'DBS4032';
subject(13).raw_dir = fullfile(subject_root,subject(13).center_ID);
subject(13).disease = 'PD';
subject(13).center = 'UPMC';
subject(13).curator = 'Richardson';
subject(13).age = 44.2;
subject(13).sex = 'm';

%% CLINICAL SCORES
subject(13).scores.updrs.total = 31;
subject(13).scores.updrs.left = 16;
subject(13).scores.updrs.right = 11;
subject(13).scores.updrs.axial = subject(13).scores.updrs.total-subject(13).scores.updrs.left-subject(13).scores.updrs.right;

%% SESSION RAW DATA FILE
subject(13).session(1).raw_filename = 'Session_Left_MER002_stn_vary.mat';

%% ECOG ELECTRODES 
subject(13).session(1).ecog(1).electrode_name = 'SML';
subject(13).session(1).ecog(1).electrode_type = 'AdTech8';
subject(13).session(1).ecog(1).target = 'sensorimotor';
subject(13).session(1).ecog(1).hemisphere  = 'left';
subject(13).session(1).ecog(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6','ecog_1_7','ecog_1_8'};
subject(13).session(1).ecog(1).spacing = 10;
subject(13).session(1).ecog(1).diameter = 4;
subject(13).session(1).ecog(1).exposure = 2.3;
subject(13).session(1).ecog(1).grid = [8 1];
subject(13).session(1).ecog(1).rereferencing = 'common_average';
subject(13).session(1).ecog(1).location = [-58.4186903900000,-13.9623285000000,52.4456290600000;-57.5150991300000,-21.5698493000000,56.4097234300000;-52.7204540900000,-29.1404066800000,61.9928852200000;-49.7468157000000,-38.5370430000000,64.5727139300000;-45.4280831400000,-46.3930169800000,65.6324217600000;-43.9033666600000,-54.6934681200000,64.2153317400000;-45.9222280800000,-61.4161102700000,59.5067860300000;-45.8218246800000,-67.3128845000000,54.7715798900000]'; %right is positive 
subject(13).session(1).ecog(1).space = 'MNI152_6th';

%% MOVEMENT TRACES
subject(13).session(1).movement(1).name = 'grip_force_right';
subject(13).session(1).movement(1).modality = 'force';
subject(13).session(1).movement(1).effector = 'hand';
subject(13).session(1).movement(1).side = 'right';
subject(13).session(1).movement(1).channel='analog2';

subject(13).session(1).movement(2).name = 'grip_force_left';
subject(13).session(1).movement(2).modality = 'force';
subject(13).session(1).movement(2).effector = 'hand';
subject(13).session(1).movement(2).side = 'left';
subject(13).session(1).movement(2).channel = 'analog1';

%% RECORDING segment
subject(13).session(1).segment(1).electrodes = {'SML'};
subject(13).session(1).segment(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6','ecog_1_7','ecog_1_8'};
subject(13).session(1).segment(1).timewindows = [6 309];
subject(13).session(1).segment(1).location = [];
subject(13).session(1).segment(2).electrodes = {'SML'};
subject(13).session(1).segment(2).timewindows = [615 693];
subject(13).session(1).segment(3).electrodes = {'SML'};
subject(13).session(1).segment(3).timewindows = [822 975];

subject(13).session(2).raw_filename = 'Session_Left_MT_DBS0001_stn_fixed.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
subject(13).session(2).ecog = subject(13).session(1).ecog;
%% LFP ELECTRODES
subject(13).session(2).lfp(1).electrode_name = 'STNL';
subject(13).session(2).lfp(1).electrode_type = 'Medtronic3389';
subject(13).session(2).lfp(1).target = 'stn'; 
subject(13).session(2).lfp(1).hemisphere = 'left';
subject(13).session(2).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
subject(13).session(2).lfp(1).spacing = 1.5;
subject(13).session(2).lfp(1).diameter = 1.3;
subject(13).session(2).lfp(1).length = 2;
subject(13).session(2).lfp(1).rereferencing = 'bipolar';
subject(13).session(2).lfp(1).location = [-13.1186796759479,-14.4877435121904,-6.41212569527863;-13.7855873946166,-13.8349501148418,-4.56013123868987;-14.4659414194427,-13.1796966195844,-2.73708255639679;-15.1527525771581,-12.5106122217318,-0.928961228284834]'; %1 is right
subject(13).session(2).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';

subject(13).session(2).movement = subject(13).session(1).movement;
%% RECORDING segment
subject(13).session(2).segment(1).electrodes = {'SML', 'STNL'};
subject(13).session(2).segment(1).timewindows = [36 480];

subject(13).session(3).raw_filename = 'Session_Right_MT_DBS0001_stn_fixed.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
subject(13).session(3).ecog(1).electrode_name = 'SMR';
subject(13).session(3).ecog(1).electrode_type = 'AdTech8';
subject(13).session(3).ecog(1).target = 'sensorimotor';
subject(13).session(3).ecog(1).hemisphere  = 'right';
subject(13).session(3).ecog(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6','ecog_1_7','ecog_1_8'};
subject(13).session(3).ecog(1).spacing = 10;
subject(13).session(3).ecog(1).diameter = 4;
subject(13).session(3).ecog(1).exposure = 2.3;
subject(13).session(3).ecog(1).grid = [8 1];
subject(13).session(3).ecog(1).rereferencing = 'common_average';
subject(13).session(3).ecog(1).location = [45.3719592115542,-52.7860296316485,63.3882763669541;49.0587818357063,-44.2154444510912,64.2255103134728;54.0414809368665,-36.7191803647704,62.1850181496547;57.0289434526562,-29.0746961488327,59.8399911950512;57.9217499883014,-20.9485881268021,58.2004272849054;59.3362623443461,-13.1820067674813,52.1896768156134;60.5273270643141,-6.05610977487875,47.5201193997382;61.6937829377539,-0.237704501946545,42.1717593667934]'; %right is positive 
subject(13).session(3).ecog(1).space = 'MNI152_6th';

subject(13).session(3).lfp(1).electrode_name = 'STNR';
subject(13).session(3).lfp(1).electrode_type = 'Medtronic3389';
subject(13).session(3).lfp(1).target = 'stn';
subject(13).session(3).lfp(1).hemisphere = 'right';
subject(13).session(3).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
subject(13).session(3).lfp(1).spacing = 1.5;
subject(13).session(3).lfp(1).diameter = 1.3;
subject(13).session(3).lfp(1).length = 2;
subject(13).session(3).lfp(1).rereferencing = 'bipolar';
subject(13).session(3).lfp(1).location = [7.86753447315156,-15.8404864600018,-8.07244538838131;8.72629726141320,-14.8446950419265,-6.36982280028147;9.62742722673595,-13.8673504736465,-4.70156134739750;10.5694381563571,-12.8910276647171,-3.06610654978364]'; %1 is right
subject(13).session(3).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';


subject(13).session(3).movement = subject(13).session(1).movement;
%% RECORDING segment
subject(13).session(3).segment(1).electrodes = {'SMR', 'STNR'};
subject(13).session(3).segment(1).timewindows = [45 480];

%% GENERAL SUBJECT INFORMATION SUBJECT 14
subject(14).ID = 'N014';
subject(14).center_ID = 'DBS4033';
subject(14).raw_dir = fullfile(subject_root,subject(14).center_ID);
subject(14).disease = 'PD';
subject(14).center = 'UPMC';
subject(14).curator = 'Richardson';
subject(14).age = 44.2;
subject(14).sex = 'm';

%% CLINICAL SCORES
subject(14).scores.updrs.total = 33;
subject(14).scores.updrs.left = 13;
subject(14).scores.updrs.right = 13;
subject(14).scores.updrs.axial = subject(14).scores.updrs.total-subject(14).scores.updrs.left-subject(14).scores.updrs.right;

%% SESSION RAW DATA FILE
subject(14).session(1).raw_filename = 'session1_left_stn_fixed.mat';

%% ECOG ELECTRODES 
subject(14).session(1).ecog(1).electrode_name = 'SML';
subject(14).session(1).ecog(1).electrode_type = 'AdTech8';
subject(14).session(1).ecog(1).target = 'sensorimotor';
subject(14).session(1).ecog(1).hemisphere  = 'left';
subject(14).session(1).ecog(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6','ecog_1_7','ecog_1_8'};
subject(14).session(1).ecog(1).spacing = 10;
subject(14).session(1).ecog(1).diameter = 4;
subject(14).session(1).ecog(1).exposure = 2.3;
subject(14).session(1).ecog(1).grid = [8 1];
subject(14).session(1).ecog(1).rereferencing = 'common_average';
subject(14).session(1).ecog(1).location = [-21.3344513808111,-58.9203260897279,71.5236648878082;-22.9240197797833,-50.6926209889040,75.1648518439171;-27.4289348757414,-38.9453358711195,76.8477458462098;-26.9376538918004,-30.8724968131621,78.0871751000272;-30.4283168245617,-19.6655691566395,76.4345528330102;-27.8045683167024,-10.9093503284109,74.7755984097974;-30.2809790862670,-0.242780133150183,69.7874598734707;-31.7164199777388,10.4120593405670,67.1728680942979]'; %right is positive 
subject(14).session(1).ecog(1).space = 'MNI152_6th';


%% LFP ELECTRODES
subject(14).session(1).lfp(1).electrode_name = 'STNL';
subject(14).session(1).lfp(1).electrode_type = 'Medtronic3389';
subject(14).session(1).lfp(1).target = 'stn'; 
subject(14).session(1).lfp(1).hemisphere = 'left';
subject(14).session(1).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
subject(14).session(1).lfp(1).spacing = 1.5;
subject(14).session(1).lfp(1).diameter = 1.3;
subject(14).session(1).lfp(1).length = 2;
subject(14).session(1).lfp(1).rereferencing = 'bipolar';
subject(14).session(1).lfp(1).location = [-13.0756212364011,-15.2409691676931,-9.84262103101776;-13.5978933875844,-14.4102539328313,-7.96353729778220;-14.1414316311722,-13.5886166295634,-6.10743099412300;-14.7072256254507,-12.7645440271197,-4.26350892180800]'; %1 is right
subject(14).session(1).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';

%% MOVEMENT TRACES
subject(14).session(1).movement(1).name = 'grip_force_right';
subject(14).session(1).movement(1).modality = 'force';
subject(14).session(1).movement(1).effector = 'hand';
subject(14).session(1).movement(1).side = 'right';
subject(14).session(1).movement(1).channel='analog2';

subject(14).session(1).movement(2).name = 'grip_force_left';
subject(14).session(1).movement(2).modality = 'force';
subject(14).session(1).movement(2).effector = 'hand';
subject(14).session(1).movement(2).side = 'left';
subject(14).session(1).movement(2).channel = 'analog1';

%% RECORDING segment
subject(14).session(1).segment(1).electrodes = {'SML', 'STNL'};
subject(14).session(1).segment(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6','ecog_1_7','ecog_1_8', 'stn1', 'stn2', 'stn3', 'stn4'};
subject(14).session(1).segment(1).timewindows = [8 465];
subject(14).session(1).segment(1).location = [];

subject(14).session(2).raw_filename = 'session2_1_right_stn_vary.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES

subject(14).session(2).ecog(1).electrode_name = 'SMR';
subject(14).session(2).ecog(1).electrode_type = 'AdTech8';
subject(14).session(2).ecog(1).target = 'sensorimotor';
subject(14).session(2).ecog(1).hemisphere  = 'right';
subject(14).session(2).ecog(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_1_5','ecog_1_6','ecog_1_7','ecog_1_8'};
subject(14).session(2).ecog(1).spacing = 10;
subject(14).session(2).ecog(1).diameter = 4;
subject(14).session(2).ecog(1).exposure = 2.3;
subject(14).session(2).ecog(1).grid = [8 1];
subject(14).session(2).ecog(1).rereferencing = 'common_average';
subject(14).session(2).ecog(1).location = [36.1822563265229,-57.4299504315433,64.7005957575888;37.7917526711855,-48.1333741420528,66.3771576036858;40.3898738374210,-39.7743774537631,66.1579913706088;45.0432170449460,-31.9674689482788,64.9768556253760;48.7075719731406,-23.2667823748536,63.3084975537840;49.1984894993243,-15.2377448501560,62.1649764020682;50.7036591887048,-7.74906478672036,57.6859389810426;51.1942132571311,0.236171204717389,54.1594674237937]'; %right is positive 
subject(14).session(2).ecog(1).space = 'MNI152_6th';
subject(14).session(2).movement = subject(14).session(1).movement;
%% RECORDING segment
subject(14).session(2).segment(1).electrodes = {'SMR'};
subject(14).session(2).segment(1).timewindows = [3 189];

subject(14).session(3).raw_filename = 'session2_2_right_stn_fixed.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
subject(14).session(3).ecog = subject(14).session(2).ecog;
subject(14).session(3).lfp(1).electrode_name = 'STNR';
subject(14).session(3).lfp(1).electrode_type = 'Medtronic3389';
subject(14).session(3).lfp(1).target = 'stn';
subject(14).session(3).lfp(1).hemisphere = 'right';
subject(14).session(3).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
subject(14).session(3).lfp(1).spacing = 1.5;
subject(14).session(3).lfp(1).diameter = 1.3;
subject(14).session(3).lfp(1).length = 2;
subject(14).session(3).lfp(1).rereferencing = 'bipolar';
subject(14).session(3).lfp(1).location = [9.58456509544666,-14.3983758894778,-7.12555081013236;10.3008176006332,-13.5604157434964,-5.44632915197853;11.0558917384165,-12.7245969496086,-3.78060009325512;11.8496698693173,-11.8851249072123,-2.14333599832328]'; %1 is right
subject(14).session(3).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';

subject(14).session(3).movement = subject(14).session(1).movement;
%% RECORDING segment
subject(14).session(3).segment(1).electrodes = {'SMR', 'STNR'};
subject(14).session(3).segment(1).timewindows = [31 419];

%% GENERAL SUBJECT INFORMATION SUBJECT 15
subject(15).ID = 'N015';
subject(15).center_ID = 'DBS4037';
subject(15).raw_dir = fullfile(subject_root,subject(15).center_ID);
subject(15).disease = 'PD';
subject(15).center = 'UPMC';
subject(15).curator = 'Richardson';
subject(15).age = 65.2;
subject(15).sex = 'f';

%% CLINICAL SCORES
subject(15).scores.updrs.total = 54;
subject(15).scores.updrs.left = 19;
subject(15).scores.updrs.right = 12;
subject(15).scores.updrs.axial = subject(15).scores.updrs.total-subject(15).scores.updrs.left-subject(15).scores.updrs.right;

%% SESSION RAW DATA FILE
subject(15).session(1).raw_filename = 'session_intraop2_1_LEFT_stn_vary.mat';

%% ECOG ELECTRODES 
subject(15).session(1).ecog(1).electrode_name = 'SML';
subject(15).session(1).ecog(1).electrode_type = 'AdTech6';
subject(15).session(1).ecog(1).target = 'sensorimotor';
subject(15).session(1).ecog(1).hemisphere  = 'left';
subject(15).session(1).ecog(1).channels = {'ecog_1','ecog_2','ecog_3','ecog_4','ecog_5','ecog_6'};
subject(15).session(1).ecog(1).spacing = 10;
subject(15).session(1).ecog(1).diameter = 4;
subject(15).session(1).ecog(1).exposure = 2.3;
subject(15).session(1).ecog(1).grid = [6 1];
subject(15).session(1).ecog(1).rereferencing = 'common_average';
subject(15).session(1).ecog(1).location = [-1.10833333333333,-70.2333333333333,61.1500000000000;-21.1803278688525,-64.9508196721312,69.5245901639344;-29.8709677419355,-54.7419354838710,73.7177419354839;-28.0740740740741,-44.4351851851852,75.7592592592593;-30.2987012987013,-35.5324675324675,75.7987012987013;-37.9333333333333,-25.5933333333333,74.3333333333333]'; %right is positive 
subject(15).session(1).ecog(1).space = 'MNI152_6th';

%% LFP ELECTRODES --> dummies here, there was no LFP recorded
% subject(15).session(1).lfp(1).electrode_name = 'STNL';
% subject(15).session(1).lfp(1).electrode_type = 'Medtronic3389';
% subject(15).session(1).lfp(1).target = 'stn'; 
% subject(15).session(1).lfp(1).hemisphere = 'left';
% subject(15).session(1).lfp(1).channels = {'stn_1_1','stn_1_2','stn_1_3','stn_1_4'};
% subject(15).session(1).lfp(1).spacing = 1.5;
% subject(15).session(1).lfp(1).diameter = 1.3;
% subject(15).session(1).lfp(1).length = 2;
% subject(15).session(1).lfp(1).rereferencing = 'bipolar';
% subject(15).session(1).lfp(1).location = coord_struct(14).STN_Coord{2}'; %1 is right, no stn recordings at all 
% subject(15).session(1).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';

%% MOVEMENT TRACES
subject(15).session(1).movement(1).name = 'grip_force_right';
subject(15).session(1).movement(1).modality = 'force';
subject(15).session(1).movement(1).effector = 'hand';
subject(15).session(1).movement(1).side = 'right';
subject(15).session(1).movement(1).channel='analog2';

subject(15).session(1).movement(2).name = 'grip_force_left';
subject(15).session(1).movement(2).modality = 'force';
subject(15).session(1).movement(2).effector = 'hand';
subject(15).session(1).movement(2).side = 'left';
subject(15).session(1).movement(2).channel = 'analog1';

%% RECORDING segment
subject(15).session(1).segment(1).electrodes = {'SML'};
subject(15).session(1).segment(1).channels = {'ecog_1','ecog_2','ecog_3','ecog_4','ecog_5','ecog_6'};
subject(15).session(1).segment(1).timewindows = [12 505];
subject(15).session(1).segment(1).location = [];

subject(15).session(2).raw_filename = 'session_intraop2_2_LEFT_stn_vary.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
subject(15).session(2).ecog = subject(15).session(1).ecog;
subject(15).session(2).movement = subject(15).session(1).movement;
%% RECORDING segment
subject(15).session(2).segment(1).electrodes = {'SML'};
subject(15).session(2).segment(1).timewindows = [1 324];

subject(15).session(3).raw_filename = 'session_intraop2_3_LEFT_stn_vary.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
subject(15).session(3).ecog = subject(15).session(1).ecog;
subject(15).session(3).movement = subject(15).session(1).movement;
%% RECORDING segment
subject(15).session(3).segment(1).electrodes = {'SML'};
subject(15).session(3).segment(1).timewindows = [36 288];


%% GENERAL SUBJECT INFORMATION SUBJECT 16
subject(16).ID = 'N016';
subject(16).center_ID = 'DBS4065';
subject(16).raw_dir = fullfile(subject_root,subject(16).center_ID);
subject(16).disease = 'PD';
subject(16).center = 'UPMC';
subject(16).curator = 'Richardson';
subject(16).age = 67;
subject(16).sex = 'm';

%% CLINICAL SCORES
subject(16).scores.updrs.total = 42;
subject(16).scores.updrs.left = 18;
subject(16).scores.updrs.right = 10;
subject(16).scores.updrs.axial = subject(16).scores.updrs.total-subject(16).scores.updrs.left-subject(16).scores.updrs.right;

%% SESSION RAW DATA FILE
subject(16).session(1).raw_filename = 'intraop1_left_stn_not_fixed.mat';

%% ECOG ELECTRODES 
subject(16).session(1).ecog(1).electrode_name = 'SML';
subject(16).session(1).ecog(1).electrode_type = 'AdTech4';
subject(16).session(1).ecog(1).target = 'sensorimotor';
subject(16).session(1).ecog(1).hemisphere  = 'left';
subject(16).session(1).ecog(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4'};
subject(16).session(1).ecog(1).spacing = 10;
subject(16).session(1).ecog(1).diameter = 4;
subject(16).session(1).ecog(1).exposure = 2.3;
subject(16).session(1).ecog(1).grid = [8 1];
subject(16).session(1).ecog(1).rereferencing = 'common_average';
subject(16).session(1).ecog(1).location = [-38.3630984542941,-19.5110564212931,68.3773097210308;-36.3734742902352,-10.5292061269576,65.9812866658733;-41.6164955041824,-0.237519109519024,61.6753679635836;-43.7383165967963,9.26671072169258,56.5009013172331]'; %right is positive 
subject(16).session(1).ecog(1).space = 'MNI152_6th';

subject(16).session(1).ecog(2).electrode_name = 'PFL';
subject(16).session(1).ecog(2).electrode_type = 'AdTech8';
subject(16).session(1).ecog(2).target = 'prefrontal';
subject(16).session(1).ecog(2).hemisphere  = 'left';
subject(16).session(1).ecog(2).channels = {'ecog_2_1','ecog_2_2','ecog_2_3','ecog_2_4','ecog_2_5','ecog_2_6','ecog_2_7','ecog_2_8'};
subject(16).session(1).ecog(2).spacing = 10;
subject(16).session(1).ecog(2).diameter = 4;
subject(16).session(1).ecog(2).exposure = 2.3;
subject(16).session(1).ecog(2).grid = [8 1];
subject(16).session(1).ecog(2).rereferencing = 'common_average';
subject(16).session(1).ecog(2).location = [-46.7900000000000,25.5600000000000,44.8800000000000;-47.2600000000000,20.3200000000000,48.1100000000000;-49.2700000000000,12.8700000000000,51.0200000000000;-18.1232402917909,62.5300922538173,1.77445716855770;-31.7242941924921,55.6154407675360,10.7623278818853;-41.0571380803893,48.7100507272135,18.4344175277508;-45.1777172304421,40.7807352684561,25.3459800622229;-46.0602218725134,33.4116702096765,31.9183303059609]'; %right is positive 
subject(16).session(1).ecog(2).space = 'MNI152_6th';


%% MOVEMENT TRACES
subject(16).session(1).movement(1).name = 'grip_force_right';
subject(16).session(1).movement(1).modality = 'force';
subject(16).session(1).movement(1).effector = 'hand';
subject(16).session(1).movement(1).side = 'right';
subject(16).session(1).movement(1).channel='analog2';

subject(16).session(1).movement(2).name = 'grip_force_left';
subject(16).session(1).movement(2).modality = 'force';
subject(16).session(1).movement(2).effector = 'hand';
subject(16).session(1).movement(2).side = 'left';
subject(16).session(1).movement(2).channel = 'analog1';

%% RECORDING segment
subject(16).session(1).segment(1).electrodes = {'SML', 'PFL'};
subject(16).session(1).segment(1).channels = {'ecog_1_1','ecog_1_2','ecog_1_3','ecog_1_4','ecog_2_1','ecog_2_2','ecog_2_3','ecog_2_4','ecog_2_5','ecog_2_6','ecog_2_7','ecog_2_8'};
subject(16).session(1).segment(1).timewindows = [30 270];
subject(16).session(1).segment(1).location = [];
subject(16).session(1).segment(2).electrodes = {'SML', 'PFL'};
subject(16).session(1).segment(2).timewindows = [375 480];
subject(16).session(1).segment(3).electrodes = {'SML', 'PFL'};
subject(16).session(1).segment(3).timewindows = [579 848];


subject(16).session(2).raw_filename = 'intraop2_1_left_stn_not_fixed.mat';
%% ECOG + LFP + MOVEMENT ELECTRODES
subject(16).session(2).ecog = subject(16).session(1).ecog;
subject(16).session(2).movement = subject(16).session(1).movement;
%% RECORDING segment
subject(16).session(2).segment(1).electrodes = {'SML', 'PFL'};
subject(16).session(2).segment(1).timewindows = [25 330];


% NEW SUBJECT

if exist('n','var') && n
    subject=subject(n);
    ID = subject.ID;
else
    ID={subject.ID};
end