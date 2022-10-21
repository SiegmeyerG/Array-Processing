function P_music = music(x,num_sources,M,n)
R = x*x';
[v,d] = eig(R);
[~,i] = sort(diag(d));
P_music = 0;
for j = 1:M-num_sources
    P_music = P_music + abs(fft(v(:,i(j)),n));% why there is not squre?
end
P_music = 1./P_music;
end