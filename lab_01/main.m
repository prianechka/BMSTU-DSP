% Параметр F, в котором спектр Гаусса определен 
F = 2

% Параметр для сигнала Гаусса (от 1 до 3)
sigma = 1;

% Параметр для прямоугольного сигнала (от 1 до 2)
L = 2

% Ввод данных
N = input('Введите количество рассматриваемых дискрет: ');
dt = input('Введите шаг для дискретизации: ');
t_max = dt*(N-1)/2;
t = -t_max:dt:t_max; 

% Дискретизация
gauss_discrete = exp(-(t/sigma).^2);
rect_discrete = zeros(size(t));
rect_discrete(abs(t) - F < 0) = 1 / L;

% Исходные сигналы
x = -t_max:0.001:t_max;
gauss_src = exp(-(x/sigma).^2);
rect_src = zeros(size(x));
rect_src(abs(x) - F < 0) = 1 / L;

% Восстановленные сигналы
gauss_restored = zeros(1, length(x));
rect_restored = zeros(1, length(x));
for i=1:length(x)
   for j = 1:N
       gauss_restored(i) = gauss_restored(i) + gauss_discrete(j)*sinc((x(i)-t(j))  / dt);
       rect_restored(i) = rect_restored(i) + rect_discrete(j) * sinc((x(i)-t(j)) / dt);
   end
end

figure;

subplot(2,1,1);
title('Прямоугольный импульс');
hold on;
grid on;
plot(x, rect_src, 'k');
plot(x, rect_restored, 'b');
plot(t, rect_discrete, '.m');
legend('Исходная', 'Восстановленная', 'Дискретная');

subplot(2,1,2);
title('Гауссовский фильтр');
hold on;
grid on;
plot(x, gauss_src, 'k');
plot(x, gauss_restored, 'b');
plot(t, gauss_discrete, '.m');
legend('Исходная', 'Восстановленная', 'Дискретная');