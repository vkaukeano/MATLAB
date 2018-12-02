% Von Kaukeano & Chad Martin
clear;
clc;

%%

%load data for computer assignment
%
load('ca2Data_fixed.mat');

%play "typed" message as audio
%
%soundsc(x,fs);

%%
figure(1); clf;
plot(x);
title('time interval graph for inspection')
%%

[X1,f1] = myFFT(x(2.2e4:3.5e4),fs,2^20);
figure(2); clf;
plot(f1,abs(X1))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('1st keystroke')


[X2,f2] = myFFT(x(3.5e4:4.5e4),fs,2^20);
figure(3); clf;
plot(f2,abs(X2))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('2nd keystroke')

[X3,f3] = myFFT(x(5e4:6e4),fs,2^20);
figure(4); clf;
plot(f3,abs(X3))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('3rd keystroke')

[X4,f4] = myFFT(x(7.5e4:8.5e4),fs,2^20);
figure(5); clf;
plot(f4,abs(X4))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('4th keystroke')

[X5,f5] = myFFT(x(8.9e4:9.8e4),fs,2^20);
figure(6); clf;
plot(f5,abs(X5))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('5th keystroke')

[X6,f6] = myFFT(x(10.2e4:11.2e4),fs,2^20);
figure(7); clf;
plot(f6,abs(X6))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('6th keystroke')

[X7,f7] = myFFT(x(11.5e4:12.5e4),fs,2^20);
figure(8); clf;
plot(f7,abs(X7))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('7th keystroke')

[X8,f8] = myFFT(x(12.8e4:13.8e4),fs,2^20);
figure(9); clf;
plot(f8,abs(X8))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('8th keystroke')

[X9,f9] = myFFT(x(15.5e4:16.5e4),fs,2^20);
figure(10); clf;
plot(f9,abs(X9))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('9th keystroke')

[X10,f10] = myFFT(x(16.8e4:17.8e4),fs,2^20);
figure(11); clf;
plot(f10,abs(X10))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('10th keystroke')

[X11,f11] = myFFT(x(18.1e4:19.1e4),fs,2^20);
figure(12); clf;
plot(f11,abs(X11))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('11th keystroke')

[X12,f12] = myFFT(x(19.4e4:20.4e4),fs,2^20);
figure(13); clf;
plot(f12,abs(X12))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('12th keystroke')

[X13,f13] = myFFT(x(20.8e4:21.8e4),fs,2^20);
figure(14); clf;
plot(f13,abs(X13))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('13th keystroke')

[X14,f14] = myFFT(x(23.4e4:24.4e4),fs,2^20);
figure(15); clf;
plot(f14,abs(X14))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('14th keystroke')

[X15,f15] = myFFT(x(24.8e4:25.8e4),fs,2^20);
figure(16); clf;
plot(f15,abs(X15))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('15th keystroke')

[X16,f16] = myFFT(x(26e4:27e4),fs,2^20);
figure(17); clf;
plot(f16,abs(X16))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('16th keystroke')

[X17,f17] = myFFT(x(27.4e4:28.4e4),fs,2^20);
figure(18); clf;
plot(f17,abs(X17))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('17th keystroke')

[X18,f18] = myFFT(x(30e4:31e4),fs,2^20);
figure(19); clf;
plot(f18,abs(X18))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('18th keystroke')

[X19,f19] = myFFT(x(31.4e4:32.4e4),fs,2^20);
figure(20); clf;
plot(f19,abs(X19))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('19th keystroke')

[X20,f20] = myFFT(x(32.7e4:33.7e4),fs,2^20);
figure(21); clf;
plot(f20,abs(X20))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('20th keystroke')

[X21,f21] = myFFT(x(34e4:35e4),fs,2^20);
figure(22); clf;
plot(f21,abs(X21))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('21th keystroke')

[X22,f22] = myFFT(x(35.3e4:36.3e4),fs,2^20);
figure(23); clf;
plot(f22,abs(X22))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('22th keystroke')

[X23,f23] = myFFT(x(38e4:39e4),fs,2^20);
figure(24); clf;
plot(f23,abs(X23))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('23th keystroke')

[X24,f24] = myFFT(x(40.6e4:41.6e4),fs,2^20);
figure(25); clf;
plot(f24,abs(X24))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('24th keystroke')

[X25,f25] = myFFT(x(42e4:43e4),fs,2^20);
figure(26); clf;
plot(f25,abs(X25))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('25th keystroke')

[X26,f26] = myFFT(x(43.3e4:44.3e4),fs,2^20);
figure(27); clf;
plot(f26,abs(X26))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('26th keystroke')

[X27,f27] = myFFT(x(44.6e4:45.6e4),fs,2^20);
figure(28); clf;
plot(f27,abs(X27))
xlim([600 1600]);
ylabel("|H(\omega)|")
xlabel("\omega")
title('27th keystroke')





