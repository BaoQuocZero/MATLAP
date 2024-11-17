% ??c ?nh g?c
r = imread('Fig0304(a)(breast_digital_Xray).tif');

% Ki?m tra n?u ?nh không ph?i ?nh xám, chuy?n ??i
if size(r, 3) == 3
    r = rgb2gray(r);  % Chuy?n ?nh màu sang ?nh xám n?u c?n
end

% Ch?n ng??ng t = 127
t = 127;

% T?o ?nh nh? phân t? ?nh xám
B = r >= t;  % M?i pixel >= ng??ng t s? thành 1 (tr?ng), còn l?i thành 0 (?en)

% Chuy?n ?nh nh? phân v? ki?u uint8 ?? hi?n th?
B = uint8(B) * 255;  % 1 tr? thành 255, 0 gi? nguyên

% Hi?n th? ?nh g?c và ?nh nh? phân
figure;
subplot(1, 2, 1);
imshow(r);
title('?nh xám g?c');

subplot(1, 2, 2);
imshow(B);
title('?nh nh? phân v?i ng??ng t = 127');