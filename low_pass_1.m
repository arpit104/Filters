clear all;clc;close all;
fs = 8000; % in Hz
cutoff = 3500; % in Hz
order = 12; % should be even number %%order = 50, and blackman window for 70 db cancellation
t = -order/2:order/2;  % This will be a 13-tap filter
win = blackman(length(t))';%rectwin(length(t))';% % hamming(length(t))';bartlett(length(t))';
r = 2*cutoff/fs;
B = sinc(r*t).*r .*win; figure;plot(B);
freqz(B);
h = freqz(B);
figure;plot(linspace(0,fs/2,length(h)),20.*log10(abs(h)));
T = 0:1/fs:0.0025; 
ip = square(2*pi*2000*T);figure;plot(T,ip);
op = filter(B,1,ip);
% figure;plot(abs(fft(op)));hold on;plot(abs(fft(ip)));

% fs = 8000; % sampling frequency in Hz
% cutoff_freq = 3500; % cutoff frequency of lowpass filter in Hz
% filter_order = 10;
% fs_piscl = pi;
% cutoff_piscl = cutoff_freq*(fs_piscl/(fs/2));
% total_resp = ones(fs/2,1);
% lowpass_resp = [ones(cutoff_freq,1);zeros(fs/2 - cutoff_freq - 1,1)];
% % figure;plot(total_resp);hold on;plot(lowpass_resp);
% time_int = 10;
% n = linspace(0,time_int,filter_order + 1);
% filt_resp = (cutoff_freq/fs)*sinc((cutoff_freq/fs)*n);
% figure;stem(filt_resp);
% win = hamming(length(filt_resp))';%rectwin(length(filt_resp))'; %
% hamming((length(filt_resp))';bartlett((length(filt_resp))';
% win_fil = win.*filt_resp;
% filt_resp_f = fft(filt_resp,filter_order + 1);
% filt_coefs = ifft(filt_resp_f,filter_order + 1);
% figure;plot(linspace(0,fs,length(filt_resp_f)/2),20.*log10(abs(filt_resp_f(1:filter_order/2) )));
% xlabel('frequency');ylabel('magnitude response');