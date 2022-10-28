%This file uses the functions from MATLAB libraray to calculate DoA
%using phased functions
clear
%% spcom_10sep
figure(1);
load('spcom_10sep.mat')
array0 = phased.ULA('NumElements',M,'ElementSpacing',Delta);
% Classical Beamformer
spatialspectrum00 = phased.BeamscanEstimator('SensorArray',array0,'ScanAngles',-90:0.01:90,'DOAOutputPort',true,'NumSignals',num_sources);
[~,ang00] = spatialspectrum00(X');
subplot(3,1,1);
plotSpectrum(spatialspectrum00);
% MVDR
spatialspectrum01 = phased.MVDREstimator('SensorArray',array0,'ScanAngles',-90:0.01:90,'DOAOutputPort',true,'NumSignals',num_sources);
[~,ang01] = spatialspectrum01(X');
subplot(3,1,2);
plotSpectrum(spatialspectrum01); 
% MUSIC
spatialspectrum02 = phased.MUSICEstimator('SensorArray',array0,'ScanAngles',-90:0.01:90,'DOAOutputPort',true,'NumSignalsSource','Property','NumSignals',num_sources);
[~,ang02] = spatialspectrum02(X');
subplot(3,1,3);
plotSpectrum(spatialspectrum02);
% RootMUSIC
spatialspectrum03 = phased.RootMUSICEstimator('SensorArray',array0,'NumSignalsSource','Property','ForwardBackwardAveraging',true,'NumSignals',num_sources);
ang03 = spatialspectrum03(X');
% ESPRITE
spatialspectrum04 = phased.ESPRITEstimator('SensorArray',array0,'ForwardBackwardAveraging',true,'NumSignalsSource','Property','NumSignals',num_sources);
ang04 = spatialspectrum04(X');
%% spcom_50sep
figure(2);
load('spcom_50sep.mat')
array1 = phased.ULA('NumElements',M,'ElementSpacing',Delta);
% Classical Beamformer
spatialspectrum10 = phased.BeamscanEstimator('SensorArray',array1,'ScanAngles',-90:0.01:90,'DOAOutputPort',true,'NumSignals',num_sources);
[~,ang10] = spatialspectrum10(X');
subplot(3,1,1);
plotSpectrum(spatialspectrum10);
% MVDR
spatialspectrum11 = phased.MVDREstimator('SensorArray',array1,'ScanAngles',-90:0.01:90,'DOAOutputPort',true,'NumSignals',num_sources);
[~,ang11] = spatialspectrum11(X');
subplot(3,1,2);
plotSpectrum(spatialspectrum11); 
% MUSIC
spatialspectrum12 = phased.MUSICEstimator('SensorArray',array1,'ScanAngles',-90:0.01:90,'DOAOutputPort',true,'NumSignalsSource','Property','NumSignals',num_sources);
[~,ang12] = spatialspectrum12(X');
subplot(3,1,3);
plotSpectrum(spatialspectrum12);
% RootMUSIC
spatialspectrum13 = phased.RootMUSICEstimator('SensorArray',array1,'NumSignalsSource','Property','ForwardBackwardAveraging',true,'NumSignals',num_sources);
ang13 = spatialspectrum13(X');
% ESPRITE
spatialspectrum14 = phased.ESPRITEstimator('SensorArray',array1,'ForwardBackwardAveraging',true,'NumSignalsSource','Property','NumSignals',num_sources);
ang14 = spatialspectrum14(X');