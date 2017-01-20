clear all;clc;close all;
fs = 48000; % Sampling rate in Hz
cutoff1 = 100; % Lower cutoff frequency in Hz
cutoff2 = 16000; % Higher cutoff frequency in Hz
order = 10000; % should be even number %%order = 1000, and blackman window for good resemblence,
t = -order/2:order/2;  % 
win = blackman(length(t))';%rectwin(length(t))';% % hamming(length(t))';bartlett(length(t))';
r1 = 2*cutoff1/fs;
r2 = 2*cutoff2/fs;
B1 = 1.*(sinc(r1*t).*r1).*win; figure;plot(B1);
B2 = 0.5.*(sinc(r2*t).*r2).*win; figure;plot(B2);
freqz(B1+B2);
h = freqz(B1+B2);
figure;plot(linspace(0,fs/2,length(h)),20.*log10(abs(h)));
% T = 0:1/fs:0.0025; 
% ip = square(2*pi*2000*T);figure;plot(T,ip);
% op = filter(B,1,ip);
