clear
%% spcom_10sep
load('spcom_10sep.mat')
n = 1024; % 1024-point fft
figure(1)
% Classical Beamformer
y = X(:)';
K = N;
P_bart0 = bart(y,K,n);
subplot(3,1,1);
plot(linspace(0,2*pi,n),fliplr(10*log10(fftshift(P_bart0(1:n)))))%-90 90
angle01 = Search_Spectrum(fliplr(fftshift(P_bart0(1:n)))',num_sources,n);
% MVDR
P_mv0 = minvar(X,n);
subplot(3,1,2);
plot(linspace(0,2*pi,n),fftshift(P_mv0(1:n)))
angle02 = Search_Spectrum(fftshift(P_mv0(1:n)),num_sources,n);
% MUSIC
P_music0 = music(X,num_sources,num_antenna,n);
subplot(3,1,3);
plot(linspace(0,2*pi,n),10*log10(fftshift(P_music0(1:n))))
angle03 = Search_Spectrum(10*log10(fftshift(P_music0(1:n))),num_sources,n);
%% spcom_50sep
load('spcom_50sep.mat')
n = 1024; % 1024-point fft
figure(2)
% Classical Beamformer
y = X(:)';
K = N;
P_bart1 = bart(y,K,n);
subplot(3,1,1);
plot(linspace(0,2*pi,n),fliplr(10*log10(fftshift(P_bart1(1:n)))))
angle11 = Search_Spectrum(fliplr(fftshift(P_bart1(1:n)))',num_sources,n);
% MVDR
P_mv1 = minvar(X,n);
subplot(3,1,2);
plot(linspace(0,2*pi,n),fftshift(P_mv1(1:n)))
angle12 = Search_Spectrum(fftshift(P_mv1(1:n)),num_sources,n);
% MUSIC
P_music1 = music(X,num_sources,num_antenna,n);
subplot(3,1,3);
plot(linspace(0,2*pi,n),10*log10(fftshift(P_music1(1:n))))
angle13 = Search_Spectrum(10*log10(fftshift(P_music1(1:n))),num_sources,n);