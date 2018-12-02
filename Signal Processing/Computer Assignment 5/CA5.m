%% Von Kaukeano & Chad Martin
clear;
clc;
load('hw5Data.mat')
%% Task 1: Plot

figure(1);clf;
plot(t_beep,beep)
xlabel(['Time(s)'])
title('No Filter: Beep')

soundsc(beep,fs)

%% Task 2: FIR Filter
% d must be between 0 < d < 1

d = .3;    % Increments the second beep by d seconds

% a must be abs(a) < 1

a = 1;    % Increments the magnitude/amplitude or how loud. 
          % a < 1 Starts loud, gets lower. a > 1 Starts low, gets louder

%FIR Filter
b = [1 zeros(1, d.*fs ) a];
y=filter(b,1,beep);

figure(2);clf;
plot(t_beep,y);
xlabel(['Time(s)'])
title('FIR Filter: Beep')


soundsc(y,fs)%------------------->Beep Sound FIR Filtered

%% Task 3: IIR Filter
d = .3;
a = .8;
b1 = [1 zeros(1, d.*fs ) a];
y1=filter(1,b1,beep);

figure(3);clf;
plot(t_beep,y1);
xlabel(['Time(s)'])
title('IIR Filter: Beep')

soundsc(y1,fs)%----------------------> Beep Sound IIR Filtered

%% Task 5: when |a|>1
d = .3;
a = 5;
b1 = [1 zeros(1, d.*fs ) a];
y1=filter(1,b1,beep);

figure(4);clf;
plot(t_beep,y1);
xlabel(['Time(s)'])
title('IIR Filter: Beep')

soundsc(y1,fs)%----------------------> Beep Sound IIR Filtered

%% Task 6: Audio 1 (Echo)
clear;
clc;
load('hw5Data.mat')
d = .4;
a = .4;
b1 = [1 zeros(1, d.*fs ) a];
y1=filter(1,b1,audio1);

soundsc(y1,fs);

%% Task 7: Audio 2
clear;
clc;
load('hw5Data.mat')
d = .05;
a = 1;
b = [1 zeros(1, d.*fs ) a];

sig_out(:,1) = audio2; % assign the left channel
sig_out(:,2)= filter(b,a,audio2); % introduce an echo to the right channel using an FIR or IIR filter

soundsc(sig_out,fs)

% Sounds better using a FIR filter. The IIR filter creates a continuous
% echo


%filename = 'Audio2.mp4';
%audiowrite(filename,sig_out,fs);