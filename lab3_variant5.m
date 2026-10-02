clc;
clear;
close all;


x = 0:0.5:2*pi;
f = sin(x) + cos(x).^2;

figure;

plot(x, f, 'ro', 'MarkerFaceColor', 'y');

xlabel('x');
ylabel('f(x)');
title('f(x) = sin(x) + cos^2(x)');

grid on;


x = 0:0.01:2;

f1 = x.^6;
f2 = x.^(2*exp(1));
f3 = x.^(3*exp(1));

figure;

plot(x, f1, 'LineWidth', 1.5);
hold on;

plot(x, f2, 'LineWidth', 1.5);
plot(x, f3, 'LineWidth', 1.5);

xlabel('x');
ylabel('f(x)');
title('Comparison of three functions');

grid on;

legend('x^6', 'x^{2e}', 'x^{3e}', ...
       'Location', 'northwest');

xlim([min(x) max(x)]);

ymin = min([f1 f2 f3]);
ymax = max([f1 f2 f3]);

ylim([ymin ymax]);

hold off;


x = -2*pi:0.2:2*pi;
y = x.^3 + sin(x);

figure;

quiver(x, zeros(size(x)), zeros(size(x)), y);

xlabel('x');
ylabel('y');

title('y = x^3 + sin(x) - Vector representation');

grid on;



figure;

bar(x, y);

xlabel('x');
ylabel('y');

title('y = x^3 + sin(x) - Bar representation');

grid on;



A = 6;
f = 2;

t = 0:0.005:4;

U1 = 4;
U2 = 2;


n = randn(size(t));

s = A*cos(2*pi*f*t) + n;



sf = s;

sf(abs(sf) < U2) = 0;



selected = s;

selected(abs(selected) <= U1) = 0;


minVoltage = min(sf);
maxVoltage = max(sf);

minIndex = find(sf == minVoltage);
maxIndex = find(sf == maxVoltage);


figure;

subplot(1,2,1);

plot(t, s, 'LineWidth', 2, ...
     'DisplayName', 'Original signal');

hold on;

plot(t, sf, ':', 'LineWidth', 2, ...
     'DisplayName', 'Filtered signal');

yline(U1, '--', ...
      'Color', [0.49 0.18 0.56], ...
      'LineWidth', 1.5, ...
      'DisplayName', 'U_1');

yline(U2, '--', ...
      'Color', [0.49 0.18 0.56], ...
      'LineWidth', 1.5, ...
      'DisplayName', 'U_2');

yline(-U1, '--', ...
      'Color', [0.49 0.18 0.56], ...
      'LineWidth', 1.5, ...
      'HandleVisibility', 'off');

yline(-U2, '--', ...
      'Color', [0.49 0.18 0.56], ...
      'LineWidth', 1.5, ...
      'HandleVisibility', 'off');

xlabel('Time (s)');
ylabel('Voltage (V)');

title('Original and filtered signals');

grid on;

legend('Location', 'northeast');

xlim([min(t) max(t)]);

ylim([min([s sf])-1 max([s sf])+1]);

hold off;



subplot(1,2,2);

stem(t, selected, 'LineWidth', 1);

hold on;


plot(t(maxIndex), maxVoltage, 'go', ...
     'MarkerSize', 9, ...
     'LineWidth', 1.5, ...
     'DisplayName', 'Maximum');


plot(t(minIndex), minVoltage, 'ro', ...
     'MarkerSize', 9, ...
     'LineWidth', 1.5, ...
     'DisplayName', 'Minimum');


xlabel('Time (s)');
ylabel('Voltage (V)');

title('Signal values exceeding U_1');

grid on;

legend('Selected signal', 'Maximum', 'Minimum', ...
       'Location', 'northeast');

xlim([min(t) max(t)]);

hold off;