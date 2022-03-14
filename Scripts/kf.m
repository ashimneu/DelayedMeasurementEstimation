clear; clc;

deg2radi = 1; %pi/180;
d = 50;
x_s = 1; % scaling factor
y_s = 2;

x1 = 0:0.1:50-0.1;
x2 = 50:0.1:100;
x = [x1 x2];

y1 = [2*x1 -3*x2];
y2 = [2*(x1+d) -3*(x2+d)];

% x = (0:0.1:60);
% y1 = 2*(x_s*x*deg2radi);
%y2 = 2*((d + x_s*x)*deg2radi);

corcoef = corrcoef(y1,y2)

figure(1); clf; 
subplot(211); hold on; grid on
plot(x,y1,'.b');
plot(x,y2,'.m')
xlabel('x'); ylabel('y');
legend('y1','y2');

subplot(212); hold on; grid on
[c,lags] = xcorr(y1,y2,'normalized');
stem(lags,c)
xlabel('lag')

[max,idx] = max(c);
idx - numel(x)