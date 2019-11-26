function i = m1_index_segments(seg,d)

i=[];
for a = 1:size(seg,1)
    i=[i,m1_sc(d,seg(a,1)):m1_sc(d,seg(a,2))];
end