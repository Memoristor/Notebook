%% �����������
clc;
clear;
close all;

%% ����ԭʼ����
fs = 500;
N = 1024;
n = 0: N-1;
t = n / fs;

s = 5 + 2 * sin(25 * pi * t) + 1.5 * sin(50 * pi * t) + 4 * cos(40 * pi * t);
s_han = s .* hanning(N)';


%% ����Ҷ�任
s_fft = fft(s, N);
s_han_fft = fft(s_han, N);

s_fft_amp = abs(s_fft) * 2 / N; 
s_fft_amp(1) = s_fft_amp(1) / 2;

s_han_fft_amp = abs(s_han_fft) * 2 / N; 
s_han_fft_amp(1) = s_han_fft_amp(1) / 2;
s_han_fft_amp = s_han_fft_amp * 2;


%% ����ͼ��
figure;
plot(s, 'r');hold on;
plot(s_han, 'g'); hold on;
legend('ԭʼ�ź�', 'ԭʼ�ź�+������')

figure;
plot(s_fft_amp, 'r');hold on;
plot(s_han_fft_amp, 'g');hold on;
legend('ԭʼ�ź�', 'ԭʼ�ź�+������')



