function basename = m1_basename(ID,prefix)

settings = m1_settings;
subjects =m1_training_subjects;


n = m1_ci(ID,{subjects(:).ID});

subject = subjects(n);
basename = subject.(settings.write.basename{1});

for a = 2:length(settings.write.basename)
    basename = [basename '_' subject.(settings.write.basename{a})];
end

if exist('prefix','var')
    basename = [prefix '_' basename];
end