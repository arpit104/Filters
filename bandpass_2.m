clear all;clc;close all;
fs = 44100; % Sampling rate in Hz
cutoff1 = 500; % lower cutoff frequency in Hz
cutoff2 = 10000; % lower cutoff frequency in Hz
order = 500; % should be even number %%order = 500, and blackman window for good bandpass operation
t = -order/2:order/2;  % number of taps in filter
win = blackman(length(t))';%rectwin(length(t))';% % hamming(length(t))';bartlett(length(t))';
r1 = 2*cutoff1/fs;
r2 = 2*cutoff2/fs;
B = (sinc(r2*t).*r2 - sinc(r1*t).*r1).*win; figure;plot(B);
freqz(B);
h = freqz(B);
figure;plot(linspace(0,fs/2,length(h)),20.*log10(abs(h)));
% T = 0:1/fs:0.0025; 
% ip = square(2*pi*2000*T);figure;plot(T,ip);
% op = filter(B,1,ip);
