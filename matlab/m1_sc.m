function [i,o]=m1_sc(vec,pts)

if size(vec,1)~=1
    vec = vec';
end

for a = 1:length(pts);
    [~,i(a)]=min(abs(diff([vec;ones(size(vec)).*pts(a)])));
    o(a)=vec(i(a));
end