function [Xt,yt]=m1_extract_feature_table(stream_file,frequencies,measures)

stream = load(stream_file);

for a = 1:length(stream.measures)
    for b = 1:length(stream.frequencies)
        for c = 1:length(stream.grid)
            X.([stream.frequencies{b} '_' stream.measures{a} '_' num2str(c)]) = stream.data(:,c,b,a);
        end
    end
end

Xt = struct2table(X);

if exist('frequencies','var')
    Xt = Xt(:,ci(frequencies,Xt.Properties.VariableNames));
end

if exist('measures','var')
    Xt = Xt(:,ci(measures,Xt.Properties.VariableNames));
end

y.data = stream.movement.data;
y.velocity = stream.movement.velocity;
y.acceleration = stream.movement.acceleration;
y.speed = stream.movement.speed;
yt = struct2table(y); 