%% Von Kaukeano & Chad Martin
% Computer Assignment 3
%
 
%% Modulization
clear;
clc;
 
% Load song1, song2.wav, and sampling frequency
load('song1.mat')
load('song2.mat')
load('fs.mat')
 
% fs = 44100 which is uploaded when loading song
fs2= 384000;
 
% Song1
x_upsample = resample(data(:,1),fs2,fs);
 
% Song 2
y_upsample = resample(data2(:,1),fs2,fs);
 
% Carrier Frequencies
fmodx=30000;
fmody=70000;
 
% Creates sampling rate equal x,y_upsample
t = (0:length(x_upsample)-1)/fs2;
 
% Carrier Cosine wave with selected frequencies fmod(x,y)
carrier_x= cos(2*pi*fmodx*t);
carrier_y= cos(2*pi*fmody*t);
 
x_modulated= x_upsample' .* carrier_x;
y_modulated= y_upsample' .* carrier_y;
 
[x,f1] = myFFT(data(:,1),fs);
figure(1);clf;
plot(f1,abs(x));
title ('myFFT(x)');
ylabel("|H(\omega)|")
xlabel("freq.")
 
[X_Modulated,f2] = myFFT(x_modulated,fs2);
figure(2);clf;
plot(f2,abs(X_Modulated));
title ('myFFT(X Modulated)');
ylabel("|H(\omega)|")
xlabel("freq.")
xlim([0 2e5]);
 
[y,f3] = myFFT(data(:,2),fs);
figure(3);clf;
plot(f3,abs(y));
title ('myFFT(y)');
ylabel("|H(\omega)|")
xlabel("freq.")
 
[Y_Modulated,f4] = myFFT(y_modulated,fs2);
figure(4);clf;
plot(f4,abs(Y_Modulated));
title ('myFFT(Y Modulated)');
ylabel("|H(\omega)|")
xlabel("freq.")
xlim([0 2e5]);
 
% Modulated_signal
modulated_signal = x_modulated + y_modulated;
 
[Modulated_Signal,f5] = myFFT(modulated_signal,fs2);
figure(5);clf;
plot(f5,abs(Modulated_Signal));
title ('myFFT(Modulated Signal)');
ylabel("|H(\omega)|")
xlabel("freq.")
xlim([0 2e5]);
 
%% Demodulation
%
 
% Song 1
 
frequency_shift = modulated_signal .* carrier_x;
 
[x_shift,f6] = myFFT(frequency_shift,fs2);
figure(6);clf;
plot(f6,abs(x_shift));
title ('myFFT(X Frequency Shift)');
ylabel("|H(\omega)|")
xlabel("freq.")
xlim([0 2e5]);
 
% Cut off frequency
Wn = (2*pi*20000);
 
% Low Pass Filter @20000 Hz
[b,a] = butter(3,Wn,'low','s');
H1 = tf(b,a);
y1 = lsim(H1,frequency_shift,t);
 
figure(7);clf;
plot(t,frequency_shift,t,y1);
xlabel('Time(s)');
ylabel("Amplitude");
title ('Filtered Signal');
 
 
Y1 = resample(y1,t,fs);
 
% Song 2

frequency_shift2 = modulated_signal .* carrier_y;
 
[y_shift,f6] = myFFT(frequency_shift2,fs2);
figure(8);clf;
plot(f6,abs(y_shift));
title ('myFFT(Y Frequency Shift)');
ylabel("|H(\omega)|")
xlabel("freq.")
xlim([0 2e5]);

[b1,a1] = butter(3,Wn,'low','s');
H2 = tf(b1,a1);
y2 = lsim(H1,frequency_shift2,t);

figure(9);clf;
plot(t,frequency_shift2,t,y2);
xlabel('Time(s)');
ylabel("Amplitude");
title ('Filtered Signal');

Y2 = resample(y2,t,fs);

%soundsc(Y1,fs)
%soundsc(Y2,fs)