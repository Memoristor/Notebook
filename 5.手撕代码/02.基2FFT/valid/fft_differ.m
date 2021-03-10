%% C�������н��
clc;
clear;
close all;


%% ��������
fid = fopen('fft_differ.txt');
lines = textscan(fid,'%s');
fclose(fid);


%% ��������
str_singal = strsplit(lines{1}{1}, ',');
str_singal_differ_c = strsplit(lines{1}{2}, ',');
str_singal_differ_t = strsplit(lines{1}{3}, ',');

N = length(str_singal);

for i = 1: N
    singal(i) = str2num(str_singal{i});
    singal_differ_c(i) = str2num(str_singal_differ_c{i});
    singal_differ_t(i) = str2num(str_singal_differ_t{i});
end

%% Ƶ�׷���
singal_differ_fft_c = abs(fft(singal_differ_c)) * 2 / N;
singal_differ_fft_c(1) = singal_differ_fft_c(1) / 2;

singal_differ_fft_t = abs(fft(singal_differ_t)) * 2 / N;
singal_differ_fft_t(1) = singal_differ_fft_t(1) / 2;


%% ����ͼ��
figure;
plot(singal, 'r');hold on;
plot(singal_differ_c, 'g');hold on;
plot(singal_differ_t, 'b-.');hold on;
legend('singal', 'singal\_differ\_c', 'singal\_differ\_t');


figure;
plot(singal_differ_fft_c, 'g');hold on;
plot(singal_differ_fft_t, 'b-.');hold on;
legend('singal\_differ\_fft\_c', 'singal\_differ\_fft\_t');

%% End