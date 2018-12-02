%% Practicum 1
% Von Kaukeano
% TUID:915596703

clc
clear

num_of_experiments = 5000;

die_one = .2;
die_two = .2;
die_three = .2;
die_four = .2;
die_five = .1;
die_six = .1;

n = [1:6];

probability = [die_one die_two die_three die_four die_five die_six];

PMF = randsample(n,num_of_experiments,true,probability);

figure(1)
hist_x = hist(PMF, n); 
bar(n,hist_x/num_of_experiments);
title('PMF of an Unfair Die')
xlabel('Value of face')
ylabel('Simulated probability mass function')

mean_PMF = mean(PMF);
std_PMF = std(PMF);

fprintf('The mean value is %4.2f\n',mean_PMF);
fprintf('The standard deviation is %4.2f\n', std_PMF);


