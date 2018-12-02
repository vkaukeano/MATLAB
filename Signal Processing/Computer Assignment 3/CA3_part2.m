clear;
clc;
%% create graph to find carrier freq of the AM data
load('ca3_AM_Data.mat');
load('fs.mat');
 
[x1,f1] = myFFT(modulated_signal,fs2);
figure(1);clf;
plot(f1,abs(x1));
xlim([0 1e5]);
ylabel('|H(\omega)|')
xlabel('Frequency(Hz)');
title('Stations Available')
 
%% discoverd carrier freq are
%30000
%55000
%85000
 
%%
desired_carrier = str2double(input('Please enter as station from the stations available in Hz: ','s'));
if isnan(desired_carrier) || fix(desired_carrier) ~= desired_carrier
  disp('Please enter a station from the list')
end

t = (0:3840000-1)/fs2;
carrier_cosine = cos(2 * pi * desired_carrier .* t);
 
frequency_shift = modulated_signal .* carrier_cosine;

[x2,f2] = myFFT(frequency_shift,fs2);
figure(2);clf;
plot(f2,abs(x2));
xlim([0 1e5]);
ylabel('|H(\omega)|')
xlabel('Frequency(Hz)');
title('Stations Available Shifted')
 
Wn = (2*pi*20000);
 
[b,a] = butter(3,Wn,'low','s');
H1 = tf(b,a);
y1 = lsim(H1,frequency_shift,t);
 
figure(3);clf;
plot(t,frequency_shift,t,y1);
ylabel('Amplitude');
xlabel('Time(s)');
title('Filtered Signal');
 
[Y,Ty] = resample(y1,t,fs);
 
soundsc(Y,44.1e3);