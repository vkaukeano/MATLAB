%% Von Kaukeano & Chad Martin - CA4
clear;
clc;

load('ca4data.mat')
%% Part 1

% Comparison between image 1 and 2

figure(1);clf;
subplot(2,2,1);
imagesc(im1)
axis equal;
colormap jet;
title('Image 1'); 
xlabel('x-axis'); 
ylabel('y-axis'); 

subplot(2,2,2);
myFFT2(im1);
title('Image 1 - Fourier Transform');

subplot(2,2,3);
imagesc(im2)
axis equal;
title('Image 2'); 
xlabel('x-axis'); 
ylabel('y-axis'); 

subplot(2,2,4);
myFFT2(im2);
title('Image 2 - Fourier Transform');

%% Comparison between image 2 and 3

figure(2);clf;
subplot(2,2,1);
imagesc(im2)
axis equal;
colormap jet;
title('Image 2'); 
xlabel('x-axis'); 
ylabel('y-axis');

subplot(2,2,2);
myFFT2(im2);
title('Image 2 - Fourier Transform');
xlim([-1 1])
ylim([-1 1])

subplot(2,2,3);
imagesc(im3)
axis equal;
title('Image 3'); 
xlabel('x-axis'); 
ylabel('y-axis');

subplot(2,2,4);
myFFT2(im3);
title('Image 3 - Fourier Transform');
xlim([-1 1])
ylim([-1 1])
%% Comparison between image 1 and 4

figure(3);clf;
subplot(2,2,1);
imagesc(im1)
axis equal;
colormap jet;
title('Image 1'); 
xlabel('x-axis'); 
ylabel('y-axis');

subplot(2,2,2);
myFFT2(im1);
title('Image 1 - Fourier Transform');

subplot(2,2,3);
imagesc(im4)
axis equal;
title('Image 4'); 
xlabel('x-axis'); 
ylabel('y-axis');

subplot(2,2,4);
myFFT2(im4);
title('Image 4 - Fourier Transform');

%% Image 5

figure(4);clf;
subplot(2,1,1);
imagesc(im5)
axis equal;
colormap jet;
title('Image 5'); 
xlabel('x-axis'); 
ylabel('y-axis');

subplot(2,1,2);
myFFT2(im5);
title('Image 5 - Fourier Transform');

%% Image 6

figure(5);clf;
subplot(2,1,1);
imagesc(im6)
axis equal;
colormap jet;
title('Image 6'); 
xlabel('x-axis'); 
ylabel('y-axis');

subplot(2,1,2);
myFFT2(im6);
title('Image 6 - Fourier Transform');
xlim([-1 1])
ylim([-1 1])
%% Part 2

% Moon

figure(6);clf;
subplot(2,1,1);
imagesc(moon); 
axis equal off; 
colormap gray;
title('Moon Image - No Filter');

subplot(2,1,2);
myFFT2(moon,'db');
title('Moon - Fourier Transform');

h_lpf = ftrans2(fir1(16,0.1));
moon_low = imfilter(moon,h_lpf);
figure(7);clf;
subplot(2,1,1);
imagesc(moon_low); 
axis equal off; 
colormap jet;
title('Moon Image - Low Pass Filter');

subplot(2,1,2);
myFFT2(moon_low,'db');
title('Low Pass Filtered Moon - Fourier Transform');

%% Part 3
h_hpf = ftrans2(fir1(16,0.2,'high'));
moon_high = imfilter(moon,h_hpf);
figure(8);clf;
subplot(2,1,1);
imagesc(moon_high); 
axis equal off; 
colormap jet;
title('Moon Image - High Pass Filter');

subplot(2,1,2);
myFFT2(moon_high,'db');
title('High Pass Filtered Moon - Fourier Transform');
