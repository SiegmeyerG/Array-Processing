%Funtions to find the angles with peak power
% P_beam: power spectrum
% num_sources: number of peaks
function angle = Search_DoA(P_beam,num_sources,n)
[peaks,locs] = findpeaks(abs(P_beam));
[~,ind]=sort(peaks,'descend');
locs = (locs-90*(1/n)-1)/(1/n);
angle = [];
for i=1:num_sources
    angle = [angle , locs(1,ind(1,i))];
end 
end