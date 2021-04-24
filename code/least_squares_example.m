clear all; close all; clc;
% a = 1.5;
% b = 3;
% T = 0.5;
% xdata =[-5:T:5];
% tdata = a*xdata+b + 4*rand(1,length(xdata))-2;
% tdata = a*xdata + 4*rand(1,length(xdata))-2;
% save('captured_data.mat', 'xdata', 'tdata');
% fun = @(x,xdata)x(1)*xdata+x(2);
% data = [xdata' tdata']
% save('data.txt','data','-ascii')
load('captured_data.mat');
fun = @(a,xdata)a(1)*xdata;
% x0 = [1,2];
a0 = 10;
disp('MATLAB Optimization Toolbox çözümü:');
a = lsqcurvefit(fun, a0, xdata, tdata)

figure(1); set(gcf, 'position', [488  342  502.6  420]);
plot(xdata, tdata, 'k.', 'markersize', 12);
grid on; set(gca,'gridlinestyle','--');
xlabel('x (input)', 'fontsize', 16); ylabel('t (target)', 'fontsize', 16);
set(gca,'xtick', [-5:1:5], 'fontsize', 14, ...
    'ytick', [-10:2:10], 'position', [0.1194    0.1448    0.8663    0.8343]);

figure(2); set(gcf, 'position', [488  342  502.6  420]);
plot(xdata, a*xdata, 'r-', 'linewidth', 1.6);
grid on; set(gca,'gridlinestyle','--'); hold on;
set(gca,'gridlinestyle','--');
xlabel('x (input)', 'fontsize', 16); ylabel('t (target)', 'fontsize', 16);
plot(xdata, tdata, 'k.', 'markersize', 12);
set(gca,'xtick', [-5:1:5], 'fontsize', 14, ...
    'ytick', [-10:2:10], 'position', [0.1194    0.1448    0.8663    0.8343]);
legend('a = 1.52 olarak bulunduğunda y = ax modeli', 'location', 'northwest');
%% kendimiz eğim düşümü (gradient descent) yöntemi ile çözelim
n = 7; % epoch sayısı
a = a0; % başlangıç değeri
alpha = 0.005; % adım büyüklüğü - step size
ahistory = zeros(1,n); % parametre arayışının yolculuğunu kaydedelim
lossFunction = zeros(1, n+1);
for i=1:length(xdata)
    lossFunction(1) = lossFunction(1) + 0.5*(tdata(i)-a*xdata(i))^2;
end

for i=1:n % epoch numarası
    for j=1:length(xdata) % batch'deki her bir veriyi tek tek giriş olarak veriyoruz
        a = a + alpha*(tdata(j)-a*xdata(j))*xdata(j); % eğim düşümü yöntemi (gradient descent) ile parametreyi güncelliyoruz
        ahistory((i-1)*length(xdata)+j) = a;
        lossFunction(i+1) = lossFunction(i+1) + 0.5*(tdata(j)-a*xdata(j))^2;
    end
end
disp('Eğim düşümü (gradient descent) yöntemi ile kendi çözümümüz:');
a
plot(xdata, a*xdata, 'b--');
hold off
legend('veriler', 'MATLAB optimtool', 'kendi eğim düşümümüz (gradient descent)');
set(legend, 'location', 'northwest');
xlabel('x');
title('En küçük kareler metodu ile doğru uydurma (line-curve fitting)');

figure(3); set(gcf, 'position', [488  342  502.6  420]);
plot([0 1:n*length(xdata)], [a0 ahistory], 'b.-', 'markersize', 11, 'linewidth', 1.5);
grid on; set(gca,'gridlinestyle','--');
xlabel('veri sıralaması', 'fontsize', 16); ylabel('a', 'fontsize', 16);
title('Öngörülen y = ax modeline göre a parametresinin bulunma yolculuğu');
set(gca,'xtick', [0:length(xdata):n*length(xdata)], 'fontsize', 14, ...
    'ytick', [1:a0], 'position', [0.0975    0.1448    0.8707    0.7995]);
axis([0 n*length(xdata) 1 a0]);

figure(4); set(gcf, 'position', [488  342  502.6  420]);
plot(0:n, lossFunction, 'b.-', 'markersize', 11, 'linewidth', 1.5);
xlabel('Epoch number', 'fontsize', 16); ylabel('Loss function (kayıp fonksiyonu)', 'fontsize', 16);
grid on; set(gca,'gridlinestyle','--', 'xtick', [0:n], 'fontsize', 14, ...
    'position', [0.1539    0.1360    0.8286    0.8444]);
axis([0 n 0 max(lossFunction)]);