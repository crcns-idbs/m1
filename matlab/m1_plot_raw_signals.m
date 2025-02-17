function p=m1_plot_raw_signals(time,data,chanlabels)

if ~exist('chanlabels','var')
    for a = 1:size(data,1)
        chanlabels{a} = ['chan' num2str(a)];
    end
end

for a = 1:size(data,1)
    p(a)=plot(time,m1_zscore(data(a,:))./10+a);
    hold on
end
set(gca,'YTick',[1:size(data,1)],'YTickLabel',chanlabels,'YTickLabelRotation',45);
xlim([time(1) time(end)]);
ylim([0 length(chanlabels)+1]);