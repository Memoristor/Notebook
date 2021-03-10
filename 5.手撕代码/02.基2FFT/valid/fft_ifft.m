%% C�������н��
clc;
clear;
close all;


%% ��������
fid = fopen('fft_ifft.txt');
lines = textscan(fid,'%s');
fclose(fid);


%% ��������
str_singal = strsplit(lines{1}{1}, ',');
str_singal_fft_c = strsplit(lines{1}{2}, ',');
str_singal_ifft_c = strsplit(lines{1}{3}, ',');

N = length(str_singal);

for i = 1: N
    singal(i) = str2num(str_singal{i});
    singal_fft_c(i) = str2num(str_singal_fft_c{i});
    singal_ifft_c(i) = str2num(str_singal_ifft_c{i});
end


%% MATLAB Ƶ�ױ任
singal_fft_m = abs(fft(singal, N)) * 2 / N; 
singal_fft_m(1) = singal_fft_m(1) / 2;


%% ����ͼ��
figure;
plot(singal, 'r');hold on;
plot(singal_ifft_c, 'b-.');hold on;
legend('singal', 'singal\_ifft\_c');

figure;
plot(singal_fft_m, 'r');hold on;
plot(singal_fft_c, 'b-.');hold on;
legend('singal\_fft\_m', 'singal\_fft\_c');


%% End