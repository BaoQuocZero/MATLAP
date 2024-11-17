% ??c ?nh
r = imread('Fig0304(a)(breast_digital_Xray).tif');

% Ki?m tra n?u ?nh không ph?i là ?nh xám, chuy?n ??i nó
if size(r, 3) == 3
    r = rgb2gray(r);  % Chuy?n ??i ?nh màu sang ?nh xám
end

% C?p m?c xám c?a ?nh (L = 256 cho ?nh 8-bit)
L = 256;

% Th?c hi?n bi?n ??i âm b?n: sa = L - 1 - r
sa = L - 1 - r;

% Tính histogram c?a ?nh g?c và ?nh âm b?n
[counts_r, grayLevels_r] = imhist(r); % Histogram ?nh g?c
[counts_sa, grayLevels_sa] = imhist(sa); % Histogram ?nh âm b?n

% Hi?n th? ?nh g?c và ?nh âm b?n
figure;
subplot(1, 2, 1);
imshow(r);
title('?nh g?c');

subplot(1, 2, 2);
imshow(sa);
title('?nh âm b?n');

% Hi?n th? histogram c?a ?nh g?c và ?nh âm b?n
figure;
subplot(1, 2, 1);
bar(grayLevels_r, counts_r);
xlabel('M?c xám');
ylabel('S? l??ng pixel');
title('Histogram ?nh g?c');

subplot(1, 2, 2);
bar(grayLevels_sa, counts_sa);
xlabel('M?c xám');
ylabel('S? l??ng pixel');
title('Histogram ?nh âm b?n');
