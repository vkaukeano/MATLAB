% Chad Martin & Von Kaukeano
% ECE3512 - Signals
% Computer Assignment 1

%% Part 1
clear;
load ca1Data.mat

A=A1; % CHANGE FOR DIFFRENT DATA SETS
freqs=freqs1; % CHANGE FOR DIFFRENT DATA SETS

samples=.04*fs; % samples per window

[num_windows,num_samples]=size(A); % windows and samples

num_samples = num_samples - 0 % decrease number of samples

p=angle(A); % phase angle in rads/sec
k=2*abs(A); % magnitude
t=(1/fs):(1/fs):(samples/fs);
w=freqs*2*pi; %frequency in rads/sec

%initialize to zero
window_sum = zeros(1,samples); % storage for sum of cosines
signal_array = zeros(1,samples*num_windows); % storage for calculations on next row

for i=1:num_windows
    for j=1:num_samples
        window_sum = window_sum + (k(i,j)*cos((w(i,j))*t+p(i,j))); % sum all cosines in for i
    end
    signal_array((1:samples)+samples*(i-1)) = window_sum; % string togeather window sums
    window_sum = zeros(1,samples);% reset window for next trip through loop
end

%soundsc(signal_array,fs)

%Graph final audio clip
figure(1);
plot(t,signal_array(1:1764))
xlabel('Time (seconds)');
ylabel('Magnitude');
title('Decompressed Window')



