ft_defaults
bml_defaults
format long
SUBJECT='DBS4003';
DATE=datestr(now,'yyyymmdd');
PATH_DATA='Z:\DBS';
PATH_SUBJECT=[PATH_DATA filesep SUBJECT];
PATH_TRELLIS=[PATH_DATA filesep SUBJECT filesep 'Raw' filesep 'Trellis'];

%% loading trellis %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  generate table with trellis files for this subject
cfg=[];
cfg.path=PATH_TRELLIS;
cfg.pattern='*.ns2';
cfg.filetype='trellis.ns2';                                     %1000Hz sampling frequency
info_ns2=bml_info_raw(cfg);
info_ns2 = bml_roi_table(info_ns2,'trellis')                    % check here for the required channel
session_idx =2;
cfg=[];
cfg.roi=info_ns2;
cfg.roi=cfg.roi(session_idx,:);
hdr=bml_read_header(cfg);
hdr.chaninfo

%% load data from one of the files
cfg=[];
cfg.roi=info_ns2;
cfg.roi=cfg.roi(session_idx,:);
cfg.channel = hdr.chaninfo.label([1:4,9:12, 17:24])';           % select here the used channels form the IntrOp file
cfg.chantype = 'lfp'; 
[trellis, loaded_epoch] = bml_load_continuous(cfg);

cfg=[];
cfg.roi=info_ns2;
cfg.roi=cfg.roi(session_idx,:);
cfg.chantype = 'analog';                                        % analog1 is left, analog2 is right
%cfg.channel = {'analog 1'; 'analog 2'} %hdr.chaninfo.label(1:2);
[grip_force, loaded_epoch] = bml_load_continuous(cfg);

cfg=[];
cfg.appenddim  = 'chan';
D = ft_appenddata(cfg,trellis,grip_force);

% display data
cfg=[];
cfg.viewmode = 'vertical';
cfg.continuous = 'yes';
cfg.blocksize = 30;
ft_databrowser(cfg,D)


%% load dbs lead contact locations and plot it wrt to the STN 
load('Z:\DBS\DBS4003\Anatomy\leaddbs_DBS4003\ea_reconstruction.mat', 'reco')
% right sided contacts:
reco.mni.coords_mm{1,1}
% left sided contacts:
reco.mni.coords_mm{1,2}

load('E:\MATLAB\lead_v2.1.5\templates\space\MNI_ICBM_2009b_NLIN_ASYM\atlases\DISTAL Minimal (Ewert 2017)\atlas_index.mat')
idx_surface = 1;
figure;
for side =1:2
    Hp1 = patch('vertices', atlases.fv{idx_surface,side}.vertices,'faces', atlases.fv{idx_surface,side}.faces,...
        'facecolor',[.50 .50 .50],'edgecolor','none',...
        'facelighting', 'gouraud', 'specularstrength', .50);
    camlight('headlight','infinite');
    axis off; axis equal
    alpha 0.5
    hold on;
end

hold on; plot3(reco.mni.coords_mm{1,1}(:,1), reco.mni.coords_mm{1,1}(:,2), reco.mni.coords_mm{1,1}(:,3), 'r.', 'markersize', 12)
hold on; plot3(reco.mni.coords_mm{1,1}(:,2), reco.mni.coords_mm{1,1}(:,2), reco.mni.coords_mm{1,1}(:,2), 'b.', 'markersize', 12)
