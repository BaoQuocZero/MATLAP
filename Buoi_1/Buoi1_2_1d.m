% ??c ?nh g?c
r = imread('Fig0304(a)(breast_digital_Xray).tif');

% Ki?m tra n?u ?nh kh�ng ph?i ?nh x�m, chuy?n ??i
if size(r, 3) == 3
    r = rgb2gray(r);  % Chuy?n ?nh m�u sang ?nh x�m n?u c?n
end

% Ch?n ng??ng t = 127
t = 127;

% T?o ?nh nh? ph�n t? ?nh x�m
B = r >= t;  % M?i pixel >= ng??ng t s? th�nh 1 (tr?ng), c�n l?i th�nh 0 (?en)

% Chuy?n ?nh nh? ph�n v? ki?u uint8 ?? hi?n th?
B = uint8(B) * 255;  % 1 tr? th�nh 255, 0 gi? nguy�n

% Hi?n th? ?nh g?c v� ?nh nh? ph�n
figure;
subplot(1, 2, 1);
imshow(r);
title('?nh x�m g?c');

subplot(1, 2, 2);
imshow(B);
title('?nh nh? ph�n v?i ng??ng t = 127');