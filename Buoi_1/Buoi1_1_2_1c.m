% ??c ?nh
r = imread('Fig0304(a)(breast_digital_Xray).tif');

% Ki?m tra n?u ?nh kh�ng ph?i l� ?nh x�m, chuy?n ??i n�
if size(r, 3) == 3
    r = rgb2gray(r);  % Chuy?n ??i ?nh m�u sang ?nh x�m
end

% C?p m?c x�m c?a ?nh (L = 256 cho ?nh 8-bit)
L = 256;

% Th?c hi?n bi?n ??i �m b?n: sa = L - 1 - r
sa = L - 1 - r;

% T�nh histogram c?a ?nh g?c v� ?nh �m b?n
[counts_r, grayLevels_r] = imhist(r); % Histogram ?nh g?c
[counts_sa, grayLevels_sa] = imhist(sa); % Histogram ?nh �m b?n

% Hi?n th? ?nh g?c v� ?nh �m b?n
figure;
subplot(1, 2, 1);
imshow(r);
title('?nh g?c');

subplot(1, 2, 2);
imshow(sa);
title('?nh �m b?n');

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
