%% master reset
clear;
clc;
%% global variabls
dia = 9; %cm
len = 11; %cm
N_turns = 6;
current = 13; %ma
data_points_per_turn = 1000;
pitch = len/N_turns;

%% create all points of coil
t=0:pi/data_points_per_turn:((2*pi)*N_turns);   
r = (dia/2);            % radius
x = (dia/2) * sin(t);
y = (dia/2) * cos(t);
z = pitch/(2*pi) * t;
coil_pos_matrix = [x' y' z'];

%% create observation point matrix
observation_point_matrix = [(0.*coil_pos_matrix(:,1)) (0.*coil_pos_matrix(:,2)) coil_pos_matrix(:,3)];% change this point to do the calculations later on
z= linspace((-6*len),(5*len),(data_points_per_turn*2*N_turns)+1);%use this for creating the axis of obsevation
observation_point_matrix(:,3) = z';
observation_point_matrix(:,2) = -1*(dia/2);
observation_point_matrix(:,1) = 0;

%% preform calculations standard units are mA and cm
[row col] = size(coil_pos_matrix);
H_X_Y_Z_NORM = [0 0 0 0];

delta_L_X = pdist2(coil_pos_matrix(1,1), coil_pos_matrix(2,1)); % length in X
delta_L_Y = pdist2(coil_pos_matrix(1,2), coil_pos_matrix(2,2)); % length in Y
delta_L_Z = pdist2(coil_pos_matrix(1,3), coil_pos_matrix(2,3)); % length in Z
delta_L_matrix = [(delta_L_X.*(coil_pos_matrix(:,1).^0)) (delta_L_Y.*(coil_pos_matrix(:,1).^0)) (delta_L_Z.*(coil_pos_matrix(:,1).^0))]; % concatimnate the distance in each direction


for i = 1:1:row
Radius = pdist2(coil_pos_matrix, observation_point_matrix(i,:));

Radius_X = pdist2(coil_pos_matrix(:,1), observation_point_matrix(i,1));%distance in X
Radius_Y = pdist2(coil_pos_matrix(:,2), observation_point_matrix(i,2));%distance in Y
Radius_Z = pdist2(coil_pos_matrix(:,3), observation_point_matrix(i,3));%distance in Z
Radius_matrix =[Radius_X Radius_Y Radius_Z] ; % vector origin points
A_r = Radius_matrix./Radius;

cross_product = cross(delta_L_matrix, A_r);

H_vector_componets = (current.*cross_product)./(4*pi*(Radius(1,1)^2)); % calculate H vector componets

H_X_buff = sum(H_vector_componets(:,1)); % norm of H vetorial componets
H_Y_buff = sum(H_vector_componets(:,2)); % norm of H vetorial componets
H_Z_buff = sum(H_vector_componets(:,3)); % norm of H vetorial componets

H_buff = sqrt(H_X_buff^2+H_Y_buff^2+H_Z_buff^2);

H_X_Y_Z_NORM = [H_X_Y_Z_NORM; H_X_buff H_Y_buff H_Z_buff H_buff];
end
H_X_Y_Z_NORM(1, :) = [];
 %% plot of coil with H vectors
figure(3); clf;
subplot(1,2,1);
hold on
scatter3(coil_pos_matrix(:,1),coil_pos_matrix(:,2),coil_pos_matrix(:,3), 'filled')
scatter3(observation_point_matrix(:,1),observation_point_matrix(:,2),observation_point_matrix(:,3), 'filled')
xlabel('x')
ylabel('y')
zlabel('z as length of spring')
title('Z as a variable for axis of observation')
hold off
subplot(1,2,2);
hold on
scatter3(coil_pos_matrix(:,1),coil_pos_matrix(:,2),coil_pos_matrix(:,3), 'filled')
q = quiver3(observation_point_matrix(:,1), observation_point_matrix(:,2), observation_point_matrix(:,3), H_X_Y_Z_NORM(:,1), H_X_Y_Z_NORM(:,2), H_X_Y_Z_NORM(:,3), 1e1);
xlabel('x')
ylabel('y')
axis equal
q.ShowArrowHead = 'off';
zlabel('z as length of spring')
hold off

title('Z as a variable with resulting magnetic field')