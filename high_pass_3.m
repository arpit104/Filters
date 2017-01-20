clear all;clc;close all;
fs = 8000; % in Hz
cutoff1 = 500; % in Hz
order = 50; % should be even number %%order = 50, and blackman window for good highpass operation
t = -order/2:order/2;  % This will be a 13-tap filter
win = blackman(length(t))';%rectwin(length(t))';% % hamming(length(t))';bartlett(length(t))';
r1 = 2*cutoff1/fs;
B = (sinc(t) - sinc(r1*t).*r1).*win; figure;plot(B);
freqz(B);
h = freqz(B);
figure;plot(linspace(0,fs/2,length(h)),20.*log10(abs(h)));
% T = 0:1/fs:0.0025; 
% ip = square(2*pi*2000*T);figure;plot(T,ip);
% op = filter(B,1,ip);
