%% ========== Matlab code sample for Practicum 2 ===========
% Simulation: Compute number of erroneously detected bits
%

clear

N = 10000;                  % number of bits transmitted

SNR = 5;                    % signal-to-noise ratio in dB  

signal = randi([0 1], N, 1);    % bit stream with 0's & 1's

noise = randn(N,1);         % additive Gaussian noise

received = (signal*2-1) + noise * 10^(-SNR/20);
                            % received noisy signal

detect = (received > 0);    % detected result

num_error = sum(abs(detect - signal));  
                            % number of erroneously detected bits

fprintf('%d bits transmitted; %d bits of errors detected\n', N, num_error)
