function basename = m1_basename(n,prefix)

settings = m1_settings;
info =m1_training_subjects(n);
basename = info.(settings.write.basename{1});

for a = 2:length(settings.write.basename)
    basename = [basename '_' info.(settings.write.basename{a})];
end

if exist('addition','var')
    basename = [prefix '_' basename];
end