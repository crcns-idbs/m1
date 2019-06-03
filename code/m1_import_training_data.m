function fnames=m1_import_training_data(n)

info = m1_training_subjects(n);
settings = m1_settings('default');
raw=load(fullfile(info.raw_dir,info.raw_filename));

%% PREPARE RAW DATA
fprintf('PREPARE RAW DATA \n')
basename = m1_basename(n);
fprintf(basename)

d=[];
switch info.center
    case 'UPMC'
        
        d.data = raw.D.data;
        d.nsamples = size(raw.D.data,2);
        d.time = raw.D.time;
        d.channels = raw.D.label;
        d.fs = round(1/(raw.D.time(2)-raw.D.time(1)));
        d.time = linspace(0,d.nsamples/d.fs,d.nsamples);
end


for a = 1:length(info.lfp)
    d.electrode_name(ci(info.lfp(a).channels,d.channels,1)) = {info.lfp(a).electrode_name};
    d.chantype(ci(info.lfp(a).channels,d.channels,1))={'lfp'};
    d.location(:,ci(info.lfp(a).channels,d.channels,1))=info.lfp(a).location;
    d.electrode_type(ci(info.lfp(a).channels,d.channels,1)) = {info.lfp(a).electrode_type};
    d.side(ci(info.lfp(a).channels,d.channels,1)) = {info.lfp(a).hemisphere};
    d.target(ci(info.lfp(a).channels,d.channels,1)) = {info.lfp(a).target};
end
for a = 1:length(info.ecog)
    d.electrode_name(ci(info.ecog(a).channels,d.channels,1)) = {info.ecog(a).electrode_name};
    d.chantype(ci(info.ecog(a).channels,d.channels,1))={'ecog'};
    d.location(:,ci(info.ecog(a).channels,d.channels,1))=m1_transform_ecog_locations(info.ecog(a).location,info.center);
    d.electrode_type(ci(info.ecog(a).channels,d.channels,1)) = {info.ecog(a).electrode_type};
    d.side(ci(info.ecog(a).channels,d.channels,1)) = {info.ecog(a).hemisphere};
    d.target(ci(info.ecog(a).channels,d.channels,1)) = {info.ecog(a).target};
end
for a = 1:length(info.movement)
    d.electrode_name(ci(info.movement(a).channel,d.channels,1)) = {info.movement(a).name};
    d.chantype(ci(info.movement(a).channel,d.channels,1))={'mvmt'};
    d.location(:,ci(info.movement(a).channel,d.channels,1))=[nan(3,1)];
    d.electrode_type(ci(info.movement(a).channel,d.channels,1)) = {info.movement(a).modality};
    d.side(ci(info.movement(a).channel,d.channels,1)) = {info.movement(a).side};
    d.target(ci(info.movement(a).channel,d.channels,1)) = {info.movement(a).effector};
end


clear raw


%% REREFERENCE LFP

reref=[];
for a =1:length(info.lfp)
    
    fprintf(['REREFERENCE LFP ' num2str(a) ' \n'])
    n=length(reref)+1;
    i = ci(info.lfp(a).channels,d.channels,1);
    reref(n).name = ['lfp_' info.lfp(a).electrode_name '_' num2str(a)];
    if isfield(info.lfp(a),'referencing') && ~isempty(info.lfp(a).rereferencing)
        reref(n).method = info.lfp(a).rereferencing;
    else
        reref(n).method = settings.preproc.rereferencing.(info.lfp(a).electrode_type);
    end
    [refdata,refchannels,reflocation,montage] = wjn_raw_rereference(d.data(i,:),reref(n).method,strcat({[reref(a).name '_']},num2str([1:length(i)]')),info.lfp(a).location);
    
    
    if settings.preproc.grandmean
        reref(n).channels{1,1} = [reref(a).name '_gm'];
        reref(n).data(1,:) = nanmean(d.data(i,:));
        reref(n).location=[nanmean(reflocation,2) reflocation];
        reref(n).montage = [ones(1,size(montage,2));montage];
        reref(n).data(2:length(refchannels)+1,:) = refdata;
        reref(n).channels(2:length(refchannels)+1)=refchannels;
        reref(n).rereferencing_method= [{'grandmean'} repmat({reref(n).method},[1 length(reref(n).channels)-1])];
       
    else
       reref(n).location=[reflocation];
        reref(n).montage = [montage];
        reref(n).data(1:length(refchannels),:) = refdata;
        reref(n).channels(1:length(refchannels))=refchannels;
        reref(n).rereferencing_method= repmat({reref(n).method},[1 length(reref(n).channels)]);
      
    end
    reref(n).chantype=repmat({'lfp'},[1 length(reref(n).channels)]);
    reref(n).electrode_type = repmat({info.lfp(a).electrode_type},[1 length(reref(n).channels)]);
    reref(n).electrode_name = repmat({info.lfp(a).electrode_name},[1 length(reref(n).channels)]);
    reref(n).side = repmat({info.lfp(a).hemisphere},[1 length(reref(n).channels)]);
    reref(n).target = repmat({info.lfp(a).target},[1 length(reref(n).channels)]);
    
end

%% REREFERENCE ECOG
if ~exist('reref','var')
    reref=[];
end

for a =1:length(info.ecog)
    fprintf(['REREFERENCE ECOG ' num2str(a) ' \n'])
    n=length(reref)+1;
    i = ci(info.ecog(a).channels,d.channels,1);
    reref(n).name = ['ecog_' info.ecog(a).electrode_name '_' num2str(a)];
    
    if isfield(info.ecog(a),'referencing') && ~isempty(info.ecog(a).rereferencing)
        reref(n).method = info.ecog(a).rereferencing;
    else
        reref(n).method = settings.preproc.rereferencing.(info.ecog(a).electrode_type);
    end
    [refdata,refchannels,reflocation] = wjn_raw_rereference(d.data(i,:),reref(n).method,strcat({[reref(n).name '_']},num2str([1:length(i)]')),info.ecog(a).location);
    
    if settings.preproc.grandmean
        reref(n).channels{1,1} = [reref(a).name '_gm'];
        reref(n).data(1,:) = nanmean(d.data(i,:));
        reref(n).rereferencing_method= [{'grandmean'} repmat({reref(n).method},[1 length(reref(n).channels)-1])];
        reref(n).location=[nanmean(reflocation,2) reflocation];
        reref(n).montage = [ones(1,size(montage,2));montage];
        reref(n).data(2:length(refchannels)+1,:) = refdata;
        reref(n).channels(2:length(refchannels)+1)=refchannels;
    else
        reref(n).rereferencing_method= repmat({reref(n).method},[1 length(reref(n).channels)]);
        reref(n).location=[reflocation];
        reref(n).montage = [montage];
        reref(n).data(1:length(refchannels),:) = refdata;
        reref(n).channels(1:length(refchannels))=refchannels;
    end
    reref(n).chantype=repmat({'ecog'},[1 length(reref(n).channels)]);
    reref(n).electrode_type = repmat({info.ecog(a).electrode_type},[1 length(reref(n).channels)]);
    reref(n).electrode_name = repmat({info.ecog(a).electrode_name},[1 length(reref(n).channels)]);
    reref(n).target = repmat({info.ecog(a).target},[1 length(reref(n).channels)]);
    reref(n).side = repmat({info.ecog(a).hemisphere},[1 length(reref(n).channels)]);
    reref(n).rereferencing_method= [{'grandmean'} repmat({reref(n).method},[1 length(reref(n).channels)-1])];
    
    fprintf(['TRANSFORM ECOG ' num2str(a) ' LOCATIONS \n'])
    reref(n).location =[nanmean(reflocation,2) reflocation];
    
end

%% MERGE REREFERENCED DATA


fprintf(['MERGE REREFERENCED DATA \n'])
r.data=[];
r.fs = d.fs;
r.chantype = [];
r.channels = [];
r.location=[];
r.electrode_type ={};
r.electrode_name = {};
r.side = {};
r.rereferencing_method ={};
r.target = {};
for a = 1:length(reref)
    r.data = [r.data;reref(a).data];
    r.channels = [r.channels,reref(a).channels];
    r.chantype = [r.chantype, reref(a).chantype];
    r.location = [r.location reref(a).location];
    r.electrode_type = [r.electrode_type reref(a).electrode_type];
    r.electrode_name = [r.electrode_name reref(a).electrode_name];
    r.target = [r.target reref(a).target];
    r.side = [r.side reref(a).side];
    r.rereferencing_method = [r.rereferencing_method reref(a).rereferencing_method];
end

%% GET AND SORT MOVEMENT SIGNALS
m=[];
for a = 1:length(info.movement)
    m.channels{a} = ['mvmt_' info.movement(a).name '_' num2str(a)];
    fprintf(['GET MOVEMENT ' num2str(a) ' \n'])
    fprintf([m.channels{a} ' \n'])
    m.data(a,:) = wjn_zscore(d.data(ci(info.movement(a).channel,d.channels,1),:));
    m.chantype{a} = 'zmvmt';
    m.location(:,a) = nan(3,1);
    m.electrode_type{a} = info.movement(a).modality;
    m.electrode_name{a} = info.movement(a).name;
    m.target{a} = info.movement(a).effector;
    m.side{a} = info.movement(a).side;
    m.rereferencing_method{a} = 'na';
end

%% MERGE AND SAVE ALL DATA (FULL DATASET)

fprintf(['PREPROCESS MERGED DATASET' ' \n'])
raw.fname = ['merge_' basename];
raw.fullfile = fullfile(info.raw_dir,raw.fname);
raw.ID = info.ID;
raw.disease = info.disease;
raw.electrode_type = [d.electrode_type,r.electrode_type,m.electrode_type];
raw.electrode_name = [d.electrode_name,r.electrode_name,m.electrode_name];
raw.target = [d.target,r.target,m.target];
raw.side = [d.side, r.side,m.side];
raw.rereferencing_method = [repmat({'na'},size(d.channels)) r.rereferencing_method m.rereferencing_method];
raw.data = [d.data;r.data;m.data];
raw.fdata = ft_preproc_dftfilter(raw.data,r.fs,settings.preproc.linenoise.(info.center));
raw.channels=[d.channels,r.channels,m.channels];
raw.chantype=[d.chantype,r.chantype,m.chantype];
raw.rereferenced = [zeros(size(d.channels)) ones(size(r.channels)) zeros(size(m.channels))];
raw.location = [d.location,r.location,m.location];
raw.time = d.time;
raw.nsamples = d.nsamples;
raw.fs = d.fs;
raw.info = info;

if settings.write.preproc.mergefile
    save(fullfile(info.raw_dir,raw.fname),'-struct','raw')
    if settings.write.preproc.spm
        D=wjn_import_rawdata(fullfile(info.raw_dir,['spmeeg_' raw.fname]),raw.fdata,raw.channels,raw.fs);
        D.info = info;
        D.location = raw.location;
        D.rereferenced = raw.rereferenced;
        D.rereferencing_method = raw.rereferencing_method;
        D.electrode_type = raw.electrode_type;
        D.electrode_name = raw.electrode_name;
        D.target = raw.target;
        D.side = raw.side;
        D=chantype(D,':',raw.chantype);
        D=conditions(D,1,'mvmt');
        D.ID = info.ID;
        save(D)
    end
end
%% PLOT RAW DATA AND SEGMENTS

fprintf(['PLOT RAW DATA AND SEGMENTS  \n'])
segments = info.segments;

figure
wjn_plot_raw_signals(d.time,d.data,d.channels);
hold on
for a =1:length(segments)
    segments(a).index = wjn_index_segments(segments(a).timewindows,d.time);
    i = sort(ci(segments(a).channels,d.channels,1));
    for c=1:length(i)
        plot(d.time(segments(a).index),ones(size(segments(a).index)).*(i(c)+.5),'color','k');
    end
    text(d.time(segments(a).index(1)),length(d.channels)+.5,num2str(a));
end
figone(7,30)
title(info.ID)

if settings.write.preproc.figures
    myprint(fullfile(info.raw_dir,'figures',['segments_' basename]))
end


for a = 1:length(segments)
    channel_selection = [intersect(ci(segments(a).electrodes,raw.electrode_name),find(raw.rereferenced)) ci('zmvmt',raw.chantype,1)];
    seg=[];
    seg.fname = ['segment_' num2str(a) '_' basename];
    seg.info=info;
    seg.fs=raw.fs;
    seg.electrode_type = raw.electrode_type(channel_selection);
    seg.electrode_name = raw.electrode_name(channel_selection);
    seg.side = raw.side(channel_selection);
    seg.rereferencing_method = raw.rereferencing_method(channel_selection);
    seg.channels = raw.channels(channel_selection);
    seg.chantype = raw.chantype(channel_selection);
    seg.target = raw.target(channel_selection);
    seg.location = raw.location(:,channel_selection);
    if isfield(segments(a),'location') && ~isempty(segments(a).location)
        for b = 1:length(segments(a).electrodes)
            selected_channels = raw.channels(intersect(ci(segments(a).channels,raw.channels,1),ci(segments(a).electrodes{b},raw.electrode_name,1)));
            rereferenced_indices = ci(segments(a).electrodes{b},seg.electrode_name,1);
            [rereferencing_methods,method_indices,channel_indices] = unique(seg.rereferencing_method(rereferenced_indices));
            for c = 1:length(rereferencing_methods)
                switch rereferencing_methods{c}
                    case 'grandmean'
                        seg.location(:,rereferenced_indices(channel_indices==c)) = nanmean(segments(a).location(:,ci(selected_channels,segments(a).channels)),2);
                    case 'common_average'
                        seg.location(:,rereferenced_indices(channel_indices==c)) = segments(a).location(:,ci(selected_channels,segments(a).channels));
                    case 'bipolar'
                        seg.location(:,rereferenced_indices(channel_indices==c)) = wjn_rereference_bipolar_location(segments(a).location(:,ci(selected_channels,segments(a).channels)));
                end
            end
        end
    end
    seg.data = ft_preproc_detrend(raw.fdata(channel_selection,segments(a).index));
    seg.original_time = raw.time(segments(a).index);
    seg.nsamples = numel(segments(a).index);
    seg.time = linspace(0,seg.nsamples/seg.fs,seg.nsamples);
    seg.segment = segments(a);
    if isfield(segments(a),'location') && ~isempty(segments(a).location)
        seg.location=segments(a).location;
    end
    
    if settings.write.preproc.segments
        fprintf(['WRITE SEGMENT ' seg.fname ' \n'])
        save(fullfile(info.raw_dir,seg.fname),'-struct','seg')
        fnames{a} = fullfile(info.raw_dir,seg.fname);
        
        if settings.write.preproc.spm
            D=wjn_import_rawdata(fullfile(info.raw_dir,['spmeeg_' seg.fname]),seg.data,seg.channels,seg.fs);
            
            D.original_time = seg.original_time;
            D.info = info;
            D.segment = segments(a);
            D.location = seg.location;
            D.rereferencing_method = seg.rereferencing_method;
            D.electrode_type = seg.electrode_type;
            D.electrode_name = seg.electrode_name;
            D.target = seg.target;
            D.side = raw.side;
            D=chantype(D,':',seg.chantype);
            D.ID = info.ID;
            save(D)
        end
    end
end


