% Input parameters
A = 1.0;
sigma = 0.5;

mult = 5;
step = 0.005;
t = -mult:step:mult;

function y = gauspls(x,A,s)
	y = A * exp(-(x / s).^2);
end

x0 = gauspls(t, A, sigma);

NA = 0;
NS = 0.05;
n1 = normrnd(NA, NS, [1 length(x0)]);
x1 = x0 + n1;

function y = impnoise(size, N, mult)
    step = floor(size / N);
    y = zeros(1, size);
    for i = 1:floor(N / 2)
        y(round(size / 2) + i * step) = mult * (0.5 + rand);
        y(round(size / 2) - i * step) = mult * (0.5 + rand);
    end
end

% Impulsive noise generation
count = 7;
M = 0.4;
n2 = impnoise(length(x0), count, M);
x2 = x0 + n2;

function y = wiener(x,n)
    y = 1 - (n./x).^2;
end

y1 = wiener(fft(x1), fft(n1));
y2 = wiener(fft(x2), fft(n2));

% Notch filter
function y = notch_filter(x,n)
    y = zeros(1, length(x));
    for i = 1:length(x)
        if abs(x(i)) - abs(n(i)) > 1
            y(i) = 1;
        else
            y(i) = 0;
        end
    end
end

y3 = notch_filter(fft(x1), fft(n1));
y4 = notch_filter(fft(x2), fft(n2));
    
figure(1)
plot(t, x1, t, ifft(fft(x1).*y1));
title('Фильтрация сигнала Гаусса фильтром Винера');
legend('С шумами','Очищенная');

figure(2)
plot(t, x2, t, ifft(fft(x2).*y2));
title('Фильтрация импульсного сигнала фильтром Винера');
legend('С шумами','Очищенная');

figure(3)
plot(t, x1, t, ifft(fft(x1).*y3));
title('Фильтрация сигнала Гаусса режекторным фильтром');
legend('С шумами','Без шумов');

figure(4)
plot(t, x2, t, ifft(fft(x2).*y4));
title('Фильтрация импульсного сигнала режекторным фильтром');
legend('С шумами','Без шумов');