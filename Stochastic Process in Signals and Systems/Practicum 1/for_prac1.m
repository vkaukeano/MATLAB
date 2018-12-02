%% ========== Matlab code sample for Practicum 1 ===========
% Simulation: Tossing an unfair coin
%
clear

n = 1000; % Number of tosses

range_x = [0:1];

for ii=1:n
    x(ii) = (rand>0.7);
end

figure(1)
hist_x = hist(x, range_x); 
bar(range_x,hist_x/n);
xlabel('Value of face')
ylabel('Simulated probability mass function')

mean_x = mean(x);
std_x = std(x);

fprintf('The mean value is %4.2f\n',mean_x);
fprintf('The standard deviation is %4.2f\n', std_x);