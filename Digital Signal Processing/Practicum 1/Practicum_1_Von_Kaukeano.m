%% ========== Matlab code sample for Practicum 1 ===========
% Simulation: Image Deconvolution
% Von Kaukeano 
% 915596703
clear
close all

%% (a)

load('pic.mat');

[height,width]=size(xx);

whos

figure(1)
imshow(xx, [0 255])

%% (b)

zz= [];
for i=1:height
    zz(i,:)=conv([1 -0.9], xx(i,:));
end
zz=zz(:,1:width);

figure(2)

imshow(zz, [-255 255])
%% (d)
N = 25;
yy= [];
k =[0:N];
for i = 1:height
    yy(i,:)=conv(.9.^k, zz(i,:));
end    
yy= yy(:,1:width);

figure(3);
imshow(yy, [0 255])

%% (f)
bb=[];
for i=1:height
    for n = 1:width
        bb(i,n) = .9*bb(i,n-1) + zz(i,n);
    end
end
 
bb=bb(:,1:width);
 
figure(4)
 
imshow(bb, [0 255])
