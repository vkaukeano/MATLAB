%% Practicum 2
% Von Kaukeano

clc;
clear;

a = .999
h = [1 0 0 0 0 0 0 -a]

roots = roots(h)

figure(1)
zplane(h,1)
figure(2)
freqz(h,1)

%% 
N = 1000;
w = linspace(-pi, pi, N);
H = 1 - a * exp(-j*8*w);
Ha = abs(H);
Db  = 20*log10(Ha);
wn = w/pi;

figure(3)
subplot(211)
plot(wn,Db)
grid
ylabel('Magnitude')
xlabel('Normalized Frequency(rad/sample)')
subplot(212)
plot(wn,angle(H)*180/pi)
grid
ylabel('Phase (rad)')
xlabel('Normalized Frequency(rad/sample)')
