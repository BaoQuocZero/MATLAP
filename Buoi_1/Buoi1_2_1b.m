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

% Hi?n th? ?nh g?c v� ?nh �m b?n
figure;
subplot(1, 2, 1);
imshow(r);
title('Anh goc');

subplot(1, 2, 2);
imshow(sa);
title('Anh am ban');
