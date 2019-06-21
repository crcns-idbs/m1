function [subject,ID] = m1_training_subjects(n)

%% ROOT FOLDER

settings=m1_settings;

%% CHECK IF TIMON OR JULIAN

if exist('E:\Dropbox (Personal)\Motorneuroscience\crcns-m1','dir')
    subject_root= 'E:\Dropbox (Personal)\Motorneuroscience\crcns-m1\subjects\';
else
    subject_root = 'add your subject folder Timon';
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
subject(1).session(1).ecog(1).location = 1.2.*[[15.7594787700000,19.9826963200000,22.3920033800000,27.3182671500000,40.3226778500000,43.4209534600000;-36.3338918900000,-26.3715512600000,-16.8776492200000,-7.75809222400000,-1.23647465800000,6.34938605800000;70.6782508900000,68.9606861800000,65.7155998500000,60.9157754000000,54.3605757500000,48.3352039100000]];
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
subject(1).session(1).movement(1).channel='analog1';

subject(1).session(1).movement(2).name = 'grip_force_left';
subject(1).session(1).movement(2).modality = 'force';
subject(1).session(1).movement(2).effector = 'hand';
subject(1).session(1).movement(2).side = 'left';
subject(1).session(1).movement(2).channel = 'analog2';

%% RECORDING segment
subject(1).session(1).segment(1).electrodes = {'SMR','STNR'};
subject(1).session(1).segment(1).channels = {'ecog1','ecog2','ecog3','ecog4','ecog5','ecog6','stn1','stn2','stn3','stn4'};
subject(1).session(1).segment(1).timewindows = [880 1147];
subject(1).session(1).segment(1).location = [];

subject(1).session(1).segment(2).electrodes = {'SMR'};
subject(1).session(1).segment(2).channels = {'ecog1','ecog2','ecog3','ecog4','ecog5','ecog6'};
subject(1).session(1).segment(2).timewindows =  [323 500];
subject(1).session(1).segment(2).location = [];

subject(1).session(1).segment(3).electrodes = {'SMR'};
subject(1).session(1).segment(3).channels = {'ecog1','ecog2','ecog3','ecog4','ecog5','ecog6'};
subject(1).session(1).segment(3).timewindows =  [500 800];
subject(1).session(1).segment(3).location = [];

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
subject(2).session(1).segment(1).location = [];

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
%% LFP ELECTRODES
subject(2).session(4).lfp(1).electrode_name = 'STNR';
subject(2).session(4).lfp(1).electrode_type = 'Medtronic3389';
subject(2).session(4).lfp(1).target = 'stn';
subject(2).session(4).lfp(1).hemisphere = 'right';
subject(2).session(4).lfp(1).channels = {'stn1','stn2','stn3','stn4'};
subject(2).session(4).lfp(1).spacing = 1.5;
subject(2).session(4).lfp(1).diameter = 2;
subject(2).session(4).lfp(1).rereferencing = 'bipolar';
subject(2).session(4).lfp(1).location = [9.29895017655514,-15.5284132003050,-9.82246535931812;9.62407705014301,-14.8511773920758,-7.62442751844796;9.94523822271819,-14.1336979059156,-5.46922214702858;10.2547044196215,-13.3797185569532,-3.34564271352136]';
subject(2).session(4).lfp(1).space = 'MNI_ICBM_2009b_NLIN_ASYM';


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
subject(2).session(5).lfp = subject(2).session(4).lfp;
subject(2).session(5).movement = subject(2).session(4).movement;
%% RECORDING segment
subject(2).session(5).segment(1).electrodes = {'PFR','SMR','STNR'};
subject(2).session(5).segment(1).timewindows = [1 279];




% NEW SUBJECT

if exist('n','var') && n
    subject=subject(n);
    ID = subject.ID;
else
    ID={subject.ID};
end