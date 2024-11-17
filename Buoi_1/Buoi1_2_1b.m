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

% Hi?n th? ?nh g?c và ?nh âm b?n
figure;
subplot(1, 2, 1);
imshow(r);
title('Anh goc');

subplot(1, 2, 2);
imshow(sa);
title('Anh am ban');
