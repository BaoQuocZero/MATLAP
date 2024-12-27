% ??c ?nh v�o bi?n r
r = imread('Fig0304(a)(breast_digital_Xray).tif');

%C�u 2.1ab=================================================================

% C?p m?c x�m c?a ?nh (L = 256 cho ?nh 8-bit)
L = 256;

% Th?c hi?n bi?n ??i �m b?n: sa = L - 1 - r
sa = L - 1 - r;

% T�nh histogram c?a ?nh g?c v� ?nh �m b?n
[counts_r, grayLevels_r] = imhist(r); % Histogram ?nh g?c
[counts_sa, grayLevels_sa] = imhist(sa); % Histogram ?nh �m b?n

% Hi?n th? histogram c?a ?nh g?c v� ?nh �m b?n
figure;
subplot(1, 2, 1);
bar(grayLevels_r, counts_r);
xlabel('M?c x�m');
ylabel('S? l??ng pixel');
title('Histogram ?nh g?c');

subplot(1, 2, 2);
bar(grayLevels_sa, counts_sa);
xlabel('M?c x�m');
ylabel('S? l??ng pixel');
title('Histogram ?nh �m b?n');

%C�u 2.1cd=================================================================

% Ch?n ng??ng t = 127
t = 127;

% T?o ?nh nh? ph�n t? ?nh x�m
B = r >= t;  % M?i pixel >= ng??ng t s? th�nh 1 (tr?ng), c�n l?i th�nh 0 (?en)

% Chuy?n ?nh nh? ph�n v? ki?u uint8 ?? hi?n th?
% Duy?t t?ng pixel ?? t?o ?nh nh? ph�n
for i = 1:size(r, 1)  % Duy?t qua t?ng h�ng
    for j = 1:size(r, 2)  % Duy?t qua t?ng c?t
        if r(i, j) >= t
            B(i, j) = 255;  % Pixel >= ng??ng t chuy?n th�nh 255 (tr?ng)
        else
            B(i, j) = 0;    % Pixel < ng??ng t chuy?n th�nh 0 (?en)
        end
    end
end

% Hi?n th? ?nh g?c v� ?nh nh? ph�n tr�n m?t c?a s?
figure;
subplot(2, 2, 1);
imshow(r);
title('?nh x�m g?c');

subplot(2, 2, 2);
imshow(sa);
title('?nh �m b?n');

subplot(2, 2, 3);
imshow(B);
title('?nh nh? ph�n v?i ng??ng t = 127');