function full = m1_offline_datastream(n)

settings = m1_settings;

if ~exist('n','var')
    n=0;
end


subjects = m1_training_subjects(n);
nstream=0;
full=[];
for nsubject = 1:length(subjects)
    
    subject = subjects(nsubject);
    
    sessions = subject.session;
    npatstream = 0;
    for nsession = 1:length(sessions)
        
        session = sessions(nsession);
        
        
        
        session_name = m1_session_name(subject.ID,nsession);
        
        movements = session.movement;
        
        
        segments = session.segment;
        
        for nsegment = 1:length(segments)
            segment = segments(nsegment);
            
            for nmovement = 1:length(movements)
                
                movement = movements(nmovement);
                
       
                fname = m1_segment_name(subject.ID,nsession,nsegment);
                filename = fullfile(subject.raw_dir,fname);
                raw=load(filename);
                
                
                movement.i = m1_ci(movement.name,raw.channels);
                movement.all_i=m1_ci('mvmt',raw.channels);
                movement.channel = raw.channels{movement.i};
                projection_matrix = [];
                projection_index=[];
                np=0;
                lfp.i = m1_ci('lfp',raw.chantype);
                if ~isempty(lfp.i)
                    lfp.channels = raw.channels(lfp.i);
                    lfp.rereferencing_method = raw.rereferencing_method(lfp.i);
                    lfp.location = raw.location(:,lfp.i);
                    lfp.target = raw.target(lfp.i);
                    lfp.adjusted_location =lfp.location;
                    [s,lfp.side] = m1_ipsi_contra(movement.side,raw.side(lfp.i));
                    lfp.adjusted_location(1,s==2)=abs(lfp.location(1,s==2));
                    lfp.adjusted_location(1,s==1)=-abs(lfp.location(1,s==1));
                    lfp_targets = unique(lfp.target);
                    nlfp_targets = length(lfp_targets);
                    
                    for c =1:length(lfp.i)
                        [lfp.projection_matrix,lfp.summed_projection_matrix,lfp.grid_distance] = m1_projection_matrix(lfp.adjusted_location,settings.grid.full.bilateral,settings.grid.lfp.(lfp.target{c}).max_distance);
                        np = np+1;
                        %                 if strcmp(lfp.rereferencing_method{c},'grandmean')
                        %                     projection_matrix(np,:) = lfp.summed_projection_matrix;
                        %                     projection_index(np) = lfp.i(c);
                        %                 else
                        projection_matrix(np,:)= lfp.projection_matrix(c,:);
                        projection_index(np) = lfp.i(c);
                        %                 end
                    end
                    
                    
                else
                    projection_matrix =[];
                    projection_index = [];
                    nlfp_targets = 0;
                    lfp_targets =[];
                end
                
                ecog.i = m1_ci('ecog',raw.chantype);
                if ~isempty(ecog.i)
                    ecog.channels = raw.channels(ecog.i);
                    ecog.rereferencing_method = raw.rereferencing_method(ecog.i);
                    ecog.location = raw.location(:,ecog.i);
                    ecog.target = raw.target(ecog.i);
                    ecog.adjusted_location =ecog.location;
                    [s,ecog.side] = m1_ipsi_contra(movement.side,raw.side(ecog.i));
                    ecog.adjusted_location(1,s==2)=abs(ecog.location(1,s==2));
                    ecog.adjusted_location(1,s==1)=-abs(ecog.location(1,s==1));
                    
                    [ecog.projection_matrix,ecog.summed_projection_matrix,ecog.grid_distance] = m1_projection_matrix(ecog.adjusted_location,settings.grid.full.bilateral,settings.grid.ecog.max_distance);
                    
                    for c = 1:length(ecog.i)
                        np = np+1;
                        projection_matrix(np,:)= ecog.projection_matrix(c,:);
                        projection_index(np) = ecog.i(c);
                    end
                    
                    
                end
                
                
                
                
                
                
                %% SIMULATE DATA STREAM
                % INITIALIZE STREAM VARIABLE
                
                nstream=nstream+1;
                npatstream = npatstream+1;
                stream =[];
                stream.settings = settings.stream;
                stream.session = raw.session;
                stream.nsession = raw.nsession;
                stream.segment = raw.segment;
                stream.movement = rmfield(movement,{'i','all_i'});
                stream.nstream = npatstream;
                stream.fname = ['stream_' num2str(npatstream) '_' movement.channel '_' fname];
                stream.subject = subject;
                stream.settings.normalization_samples = stream.settings.normalization_time*stream.settings.resample_rate;
                stream.settings.projection_index = projection_index;
                stream.settings.projection_matrix = projection_matrix;
                stream.raw.movement= smooth(raw.data(movement.i,:),round(raw.fs*stream.settings.movement.smoothing))';
                % FIND MOVEMENT THRESHOLD
                s=sort(stream.raw.movement);
                firstzero = find(s>=0,1,'first');
                mdl = fitlm([1:firstzero]',s(1:firstzero)');
                stream.settings.movement_threshold =mdl.predict(firstzero)+nanstd(stream.raw.movement<=mdl.predict(firstzero));
                % DEFINE MOVEMENT ONSET
                stream.raw.movement_index = mythresh(stream.raw.movement,stream.settings.movement_threshold);
                stream.raw.movement_index(stream.raw.movement_index<=max(raw.fs./stream.settings.seglengths)+(abs(stream.settings.perimovement_segment(1))*raw.fs))=[];
                stream.raw.movement_index(stream.raw.movement_index+max(abs(stream.settings.perimovement_segment(2))*raw.fs)>=raw.nsamples)=[];
                
                % DEFINE STREAM DATA SEGMENTS
                [stream.raw.epochs.index,stream.raw.index,stream.raw.trl] = wjn_create_raw_epochs(stream.raw.movement_index,[stream.settings.perimovement_segment(1)*raw.fs stream.settings.perimovement_segment(2)*raw.fs]);
                stream.raw.epochs.time = linspace(settings.stream.perimovement_segment(1),settings.stream.perimovement_segment(2),size(stream.raw.epochs.index,2));
                
                % PREPARE SEGMENTS
                stream.settings.downsample_factor = raw.fs/stream.settings.resample_rate;
                stream.settings.seglengths = round(raw.fs./stream.settings.seglengths);
                stream.settings.segments = downsample(stream.raw.index,stream.settings.downsample_factor);
                stream.raw.index(stream.raw.index>(raw.nsamples))=[];
                stream.raw.index(stream.raw.index<max(stream.settings.seglengths))=[];
                
                % TRANSFORM TIME AXIS
                stream.raw.time = raw.time;
                stream.raw.movement_onset = raw.time(stream.raw.movement_index);
                stream.raw.cut_time = raw.time(stream.raw.index);
                stream.raw_time = downsample(stream.raw.cut_time,stream.settings.downsample_factor);
                stream.movement.onset_index = m1_sc(stream.raw_time,stream.raw.movement_onset);
                stream.movement.onset_raw = stream.raw_time(stream.movement.onset_index);
                
                figure
                subplot(3+nlfp_targets,1,1:3)
                m1_plot_surface
                hold on
                m1_plot_spheres(settings.grid.full.bilateral,nansum(projection_matrix),3);
                camlight
                title(strrep({['ID: ' subject.ID];['SEGMENT: ' num2str(nsegment)];['MOVEMENT: ' movement.name]},'_',' '),'color','w')
                
                for c = 1:nlfp_targets
                    subplot(3+nlfp_targets,1,3+c)
                    p=m1_plot_surface(settings.grid.lfp.(lfp_targets{c}).surface,[.9 .9 .9]);
                    p.FaceAlpha = .2;
                    hold on
                    m1_plot_colored_spheres(settings.grid.full.bilateral',nansum(projection_matrix),.5);
                    xlim([min(settings.grid.lfp.(lfp_targets{c}).bilateral(1,:))-5 max(settings.grid.lfp.(lfp_targets{c}).bilateral(1,:))+5])
                    ylim([min(settings.grid.lfp.(lfp_targets{c}).bilateral(2,:))-5 max(settings.grid.lfp.(lfp_targets{c}).bilateral(2,:))+5])
                    zlim([min(settings.grid.lfp.(lfp_targets{c}).bilateral(3,:))-5 max(settings.grid.lfp.(lfp_targets{c}).bilateral(3,:))+5])
                    camlight
                end
                figone(15,14)
                
                if settings.write.stream.figures
                    m1_figprint(fullfile(subject.raw_dir,'figures',['projection_' stream.fname]))
                end
                
                
                figure
                subplot(2,1,1)
                plot(raw.time, stream.raw.movement,'linewidth',2,'color','k');
                hold on
                plot(raw.time(stream.raw.index), stream.raw.movement(stream.raw.index),'linewidth',2,'color','r','linestyle','none','marker','sq','MarkerSize',2)
                title(strrep(stream.fname,'_',' '));
                xlim([raw.time(1) raw.time(end)])
                subplot(2,1,2)
                stream.raw.epochs.movement = m1_raw_epoch(stream.raw.movement,stream.raw.epochs.index);
                plot(stream.raw.epochs.time,stream.raw.epochs.movement,'color',[.5 .5 .5]);
                hold on
                mypower(stream.raw.epochs.time,stream.raw.epochs.movement)
                figone(7,20)
                
                if settings.write.stream.figures
                    m1_figprint(fullfile(subject.raw_dir,'figures',['movement_' stream.fname]))
                end
                
                
                
                vfdata = zeros(numel(stream.settings.segments),length(stream.settings.projection_matrix),numel(stream.settings.freqnames));
                pvfdata = vfdata;
                rfdata = zeros(numel(stream.settings.segments),length(stream.settings.projection_index),numel(stream.settings.freqnames));
                prfdata = rfdata;
                
                stream.movement.data = vfdata(:,1);
                stream.movement.side = cell(size(stream.movement));
                stream.movement.all = repmat(stream.movement.data,1,length(movement.all_i));
                
                %%
                tstart=tic;tlast=tic;
                for c=1:numel(stream.settings.segments)
                    for d = 1:numel(stream.settings.freqnames)
                        if d==1
                         
                            data = raw.data(projection_index,stream.settings.segments(c)-stream.settings.seglengths(d)+1:stream.settings.segments(c));
                            %data = ft_preproc_padding(data,'mirror',round(raw.fs*stream.settings.padding),round(raw.fs*stream.settings.padding));
                            %data = data.*hanning(length(data))';
                        end
                        fdata = ft_preproc_bandpassfilter(data(:,end-stream.settings.seglengths(d)+1:end),raw.fs,stream.settings.freqranges(d,:));
                        rfdata(c,:,d) = nanvar(fdata,[],2)';
                        vfdata(c,:,d)=rfdata(c,:,d)*stream.settings.projection_matrix;
                    end
                    
                    if c<=stream.settings.normalization_samples
                        nindex = 1:c;
                    else
                        nindex=c-stream.settings.normalization_samples:c-stream.settings.resample_rate;
                    end
                
                    vmd = squeeze(nanmedian(vfdata(nindex,:,:),1));
                    rmd = squeeze(nanmedian(rfdata(nindex,:,:),1));
                    pvfdata(c,:,:)=(squeeze(vfdata(c,:,:))-vmd)./vmd;
                    prfdata(c,:,:)=(squeeze(rfdata(c,:,:))-rmd)./rmd;
                    stream.movement.side{c,1} = movement.side(1);
                    stream.movement.data(c,1) = nanmean(raw.data(movement.i,stream.settings.segments(c)-stream.settings.downsample_factor:stream.settings.segments(c)),2);
                    stream.movement.all(c,:) = nanmean(raw.data(movement.all_i,stream.settings.segments(c)-stream.settings.downsample_factor:stream.settings.segments(c)),2);
                    
                    toc(tstart)
                    toc(tlast)
                    tlast=tic;
                end

                stream.unprojected_channels = raw.channels(projection_index);
                stream.data(:,:,:) = pvfdata;
                stream.unrojected_data(:,:,:) = prfdata;
                %%
                stream.time = linspace(0,numel(stream.settings.segments)/stream.settings.resample_rate,numel(stream.settings.segments));
                stream.nsamples = length(stream.time);
                stream.fs = stream.settings.resample_rate;
                
                stream.movement.onset = stream.raw_time(stream.movement.onset_index);
                stream.movement.velocity = mydiff(stream.movement.data);
                stream.movement.speed = abs(stream.movement.velocity);
                stream.movement.acceleration = mydiff(stream.movement.speed);
                stream.movement.all_channels = raw.channels(m1_ci('mvmt',raw.channels));
                stream.dimensions={'samples','grid','frequencies','measures'};
                stream.frequencies = stream.settings.freqnames;
                stream.measures = {'variance'};
                stream.grid = settings.grid.full.bilateral;
                stream.active_nodes = find(nansum(projection_matrix));
                
                i = m1_create_raw_epochs(stream.movement.onset_index,[stream.raw.epochs.time([1 end])*stream.fs]);
                i(i>stream.nsamples)=stream.nsamples;
                for c  =1:size(i,1)
                    stream.epochs.data(c,:,:,:,:)=stream.data(i(c,:),:,:,:);
                    stream.epochs.movement(c,:) = stream.movement.data(i(c,:));
                end
                stream.epochs.time = linspace(stream.raw.epochs.time(1),stream.raw.epochs.time(end),size(i,2));
                
                figure
                for c = 1:length(stream.measures)
                    subplot(length(stream.measures),1,c)
                    imagesc(stream.epochs.time,1:length(stream.frequencies),squeeze(nanmedian(nanmedian(stream.epochs.data(:,:,stream.active_nodes,:,c),1),3))');
                    axis xy
                    set(gca,'YTick',1:length(stream.frequencies),'YTickLabel',strrep(stream.frequencies,'_',' '),'YTickLabelRotation',45);
                    xlabel('Time [s]')
                    hold on
                    plot(stream.epochs.time,nanmean(stream.epochs.movement+1,1),'color','k','linewidth',2)
                    if c ==1 
                        title(strrep(stream.fname,'_',' '))
                    end
                    caxis([-.5 .5])
                end
                
                if settings.write.stream.figures
                    m1_figprint(fullfile(subject.raw_dir,'figures',['stream_epoched_' stream.fname]))
                end
                
                save(fullfile(subject.raw_dir,stream.fname),'-struct','stream')
                full.stream(nstream)=stream;
            end
        end
    end
    close all
end

full.data = [];
full.movement = [];
for a = 1:length(full.stream)
    full.data = cat(1,full.data,full.stream(a).data);
    full.movement = cat(1,full.movement,full.stream(a).movement.data);
end
