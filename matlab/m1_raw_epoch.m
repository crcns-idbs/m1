function epochs = m1_raw_epoch(data,trl)


n=0;
for a = 1:size(trl,1)    
    if trl(a,1)>0 && trl(a,end)<length(data)
        n=n+1;
        epochs(n,:) = data(:,trl(a,:));
    end
end
    