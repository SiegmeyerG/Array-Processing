%This is the spectrum estimation for MUSIC method
%Parameter x: sampled signal vector
%parameter num_sources: number of signal source
%Parameter M: dimention of autocorrelatio matrix 
%Parameter n: fft length
function P_music = music(x,num_sources,M,n)
R = x*x';
[v,d] = eig(R);
[~,i] = sort(diag(d)); %
% sort the eienvector so we can multiple from 1 to M-num_souces
% rather than num_sources+1 to M
P_music = 0;
for j = 1:M-num_sources
    P_music = P_music + abs(fft(v(:,i(j)),n));
end
P_music = 1./P_music;
end