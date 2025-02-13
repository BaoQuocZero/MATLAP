clc; 
clear; 
close all;

% a) ??c ?nh v� hi?n th? ?nh g?c
i = imread('Fig0316(4)(bottom_left).tif');
i = double(i); % Chuy?n sang ki?u double ?? x? l�
figure;
subplot(2,2,1);
imshow(uint8(i)); 
title('?nh g?c');

% V? histogram g?c
[rows, cols] = size(i);
histogram = zeros(1, 256);
for x = 1:rows
    for y = 1:cols
        pixel_value = i(x, y) + 1; % MATLAB index starts from 1
        histogram(pixel_value) = histogram(pixel_value) + 1;
    end
end

subplot(2,2,2);
bar(0:255, histogram, 'k');
title('Histogram ?nh g?c');

% b) C�n b?ng histogram th? c�ng
cdf = cumsum(histogram) / sum(histogram); % T�nh CDF (H�m ph�n ph?i t�ch l?y)
equalized_img = zeros(size(i));

% �nh x? m?c x�m m?i
for x = 1:rows
    for y = 1:cols
        equalized_img(x, y) = round(cdf(i(x, y) + 1) * 255);
    end
end

% c) Hi?n th? ?nh ?� c�n b?ng
subplot(2,2,3);
imshow(uint8(equalized_img));
title('?nh sau khi c�n b?ng m?c x�m');

% V? histogram sau khi c�n b?ng
histogram_eq = zeros(1, 256);
for x = 1:rows
    for y = 1:cols
        pixel_value = equalized_img(x, y) + 1;
        histogram_eq(pixel_value) = histogram_eq(pixel_value) + 1;
    end
end

subplot(2,2,4);
bar(0:255, histogram_eq, 'k');
title('Histogram ?nh ?� c�n b?ng');
