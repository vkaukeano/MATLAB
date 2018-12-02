clc;
clear;
load('square_coordinates_with_holes.mat'); % center of all squares
D = .1; % C/cm^2;
dS = 1; % Surface Area /cm^2 
e0 = 8.854e-10; % F/cm
E1 = (D * dS)/(4*pi*e0); % Coulomb's law 
E_matrix = [0 0 0 0]; 

tic
z = 17.25;
y = 0;
for x = 0:1:70;
observation_point_matrix = [x y z]; 
Radius = pdist2(square_coordinates, observation_point_matrix);% cm - cm
    E = E1./Radius.^2;
    E_total = sum(E);
    E_matrix = [E_matrix; x y z E_total];   
end
    toc