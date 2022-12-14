%Using original DoA algorithm to estimate DoA
clear
%% spcom_10sep
load('spcom_10sep.mat')
figure(1)
r = 0.1; % determines the reslution of plot.
% Classical Beamformer
P_beam0 = Beamformer_DoA(X,M,Delta,r);
subplot(3,1,1);
plot(linspace(-90,90,(1/r)*180+1),10*log10(abs(P_beam0)));
xlim([-90 90]);
xlabel('Broadside Angle(degrees)');
ylabel('Power(dB)');
title('Beamscan Spatial Spectrum');
angle01 = Search_DoA(P_beam0,num_sources,r);
grid on;
% MVDR
P_MVDR0 = MVDR_DoA(X,M,Delta,r);
subplot(3,1,2);
plot(linspace(-90,90,(1/r)*180+1),10*log10(abs(P_MVDR0)));
xlim([-90 90]);
xlabel('Broadside Angle(degrees)');
ylabel('Power(dB)');
title('MVDR Spatial Spectrum');
angle02 = Search_DoA(P_MVDR0,num_sources,r);
grid on;
% MUSIC
P_MUSIC0 = MUSIC_DoA(X,M,num_sources,Delta,r);
subplot(3,1,3);
plot(linspace(-90,90,(1/r)*180+1),10*log10(abs(P_MUSIC0)));
xlim([-90 90]);
xlabel('Broadside Angle(degrees)');
ylabel('Power(dB)');
title('MUSIC Spatial Spectrum');
angle03 = Search_DoA(P_MUSIC0,num_sources,r);
grid on;
%% spcom_50sep
load('spcom_50sep.mat')
figure(2)
r = 0.1; % determines the reslution of plot.
% Classical Beamformer
P_beam1 = Beamformer_DoA(X,M,Delta,r);
subplot(3,1,1);
plot(linspace(-90,90,(1/r)*180+1),10*log10(abs(P_beam1)));
xlim([-90 90]);
xlabel('Broadside Angle(degrees)');
ylabel('Power(dB)');
title('Beamscan Spatial Spectrum');
angle11 = Search_DoA(P_beam1,num_sources,r);
grid on;
% MVDR
P_MVDR1 = MVDR_DoA(X,M,Delta,r);
subplot(3,1,2);
plot(linspace(-90,90,(1/r)*180+1),10*log10(abs(P_MVDR1)));
xlim([-90 90]);
xlabel('Broadside Angle(degrees)');
ylabel('Power(dB)');
title('MVDR Spatial Spectrum');
angle12 = Search_DoA(P_MVDR1,num_sources,r);
grid on;
% MUSIC
P_MUSIC1 = MUSIC_DoA(X,M,num_sources,Delta,r);
subplot(3,1,3);
plot(linspace(-90,90,(1/r)*180+1),10*log10(abs(P_MUSIC1)));
xlim([-90 90]);
xlabel('Broadside Angle(degrees)');
ylabel('Power(dB)');
title('MUSIC Spatial Spectrum');
angle13 = Search_DoA(P_MUSIC1,num_sources,r);
grid on;