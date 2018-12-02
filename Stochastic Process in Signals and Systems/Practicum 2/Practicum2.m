%% Von Kaukeano
% Practicum 2
% 915596703

% #1

clear
clc

N = 100000;

SNR = 6;

signal = randi([0 1], N, 1);    % bit stream with 0's & 1's

noise = randn(N,1);         % additive Gaussian noise

received = (signal*2-1) + noise * 10^(-SNR/20);

P = normcdf(received,1,10^(-SNR/20));

scatter(received, P);

ylabel('Probability of Error');
xlabel('Symbol 1: 0 ');
title('CDF');

%% #2               

average_BER = 0;

for ii = 1:100

signal = randi([0 1], N, 1);    

noise = randn(N,1);         

received = (signal*2-1) + noise * 10^(-SNR/20);
                           
detect = (received > 0);
    
[number,ratio] = biterr(detect,signal);

average_BER = average_BER + ratio;

end

average_BER= average_BER / ii;

fprintf('The average BER is %4.6f\n', average_BER)


