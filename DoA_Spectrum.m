%Using spectrum estimation to determine DoA
clear
%% spcom_10sep
load('spcom_10sep.mat')
n = 1024; % 1024-point fft
w = linspace(-pi,pi,n);
theta = asind(w/pi);% match frequecny domain to spatial domain
% Classical Beamformer
y = X(:)'; % 5*20 to 1*100 
K = N;
P_bart0 = bart(y,K,n);
subplot(3,1,1);
plot(theta,fliplr(10*log10(fftshift(P_bart0(1:n)))))%represented in dB
xlim([-90 90]);
xlabel('Broadside Angle(degrees)');
ylabel('Power(dB)');
title('Bartlett Spectrum');
angle01 = Search_Spectrum(fliplr(fftshift(P_bart0(1:n)))',num_sources,n);
grid on;
% MVDR
P_mv0 = minvar(X,n);
subplot(3,1,2);
plot(theta,fftshift(P_mv0(1:n)));
xlim([-90 90]);
xlabel('Broadside Angle(degrees)');
ylabel('Power(dB)');
title('MVDR Spectrum');
angle02 = Search_Spectrum(fftshift(P_mv0(1:n)),num_sources,n);
grid on;
% MUSIC
P_music0 = music(X,num_sources,num_antenna,n);
subplot(3,1,3);
plot(theta,10*log10(fftshift(P_music0(1:n))))
xlim([-90 90]);
xlabel('Broadside Angle(degrees)');
ylabel('Power(dB)');
title('MUSIC Spectrum');
angle03 = Search_Spectrum(10*log10(fftshift(P_music0(1:n))),num_sources,n);
grid on;
%% spcom_50sep
load('spcom_50sep.mat')
n = 1024; % 1024-point fft
figure(2)
% Classical Beamformer
y = X(:)';
K = N;
P_bart1 = bart(y,K,n);
subplot(3,1,1);
plot(theta,fliplr(10*log10(fftshift(P_bart1(1:n)))));
xlim([-90 90]);
xlabel('Broadside Angle(degrees)');
ylabel('Power(dB)');
title('Bartlett Spectrum');
angle11 = Search_Spectrum(fliplr(fftshift(P_bart1(1:n)))',num_sources,n);
grid on;
% MVDR
P_mv1 = minvar(X,n);
subplot(3,1,2);
plot(theta,fftshift(P_mv1(1:n)))
xlim([-90 90]);
xlabel('Broadside Angle(degrees)');
ylabel('Power(dB)');
title('MVDR Spectrum');
angle12 = Search_Spectrum(fftshift(P_mv1(1:n)),num_sources,n);
grid on;
% MUSIC
P_music1 = music(X,num_sources,num_antenna,n);
subplot(3,1,3);
plot(theta,10*log10(fftshift(P_music1(1:n))));
xlim([-90 90]);
xlabel('Broadside Angle(degrees)');
ylabel('Power(dB)');
title('MUSIC Spectrum');
angle13 = Search_Spectrum(10*log10(fftshift(P_music1(1:n))),num_sources,n);
grid on;