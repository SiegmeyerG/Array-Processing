%Funtions to find the angles with peak power
% P_beam: power spectrum
% num_sources: number of peaks
function angle = Search_Spectrum(P_beam,num_sources,n)
[peaks,locs] = findpeaks(P_beam);% the fftshift is extremely important.
w = locs/n*2*pi-pi;
sita = asin(w/pi)/pi*180;%convert frequency to spatial
[~,ind]=sort(peaks,'descend');
angle = [];
for i=1:num_sources
    angle = [angle , sita(ind(i,1),1)];
end 
end