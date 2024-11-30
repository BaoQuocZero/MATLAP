% ??c ?nh I v�o MATLAB
I = imread('cell.tif');

% Chuy?n ?nh th�nh ?nh grayscale n?u c?n
if size(I, 3) == 3
    I = rgb2gray(I);
end

% T?o hai ?nh I1 v� I2 v?i k�ch th??c nh? ?nh g?c
I1 = I; 
I2 = I;

% L?p qua t?t c? c�c pixel c?a ?nh I
[rows, cols] = size(I);
for i = 1:rows
    for j = 1:cols
        % C?ng 25 v�o pixel v� ??m b?o kh�ng v??t qu� gi?i h?n 0-255
        I1(i,j) = min(max(I(i,j) + 25, 0), 255);  % ??m b?o gi� tr? trong ph?m vi 0-255 max(..., 0) ??m b?o kh�ng c� gi� tr? n�o nh? h?n 0.
        I2(i,j) = min(max(I(i,j) + 25, 0), 255);  % ??m b?o gi� tr? trong ph?m vi 0-255 min(..., 255) ??m b?o kh�ng c� gi� tr? n�o v??t qu� 255.
    end
end

% Hi?n th? ?nh I1 v� I2
subplot(1, 2, 1);
imshow(I1);
title('?nh I1');

subplot(1, 2, 2);
imshow(I2);
title('?nh I2');