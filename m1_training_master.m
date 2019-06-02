clear all;close all;
%% need to add the code folder to path
addpath ./code
files = m1_import_training_data(1);
full = m1_offline_datastream(1);