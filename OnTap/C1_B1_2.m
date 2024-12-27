% ??c ?nh I vào MATLAB
I = imread('cell.tif');

% Chuy?n ?nh thành ?nh grayscale n?u c?n
if size(I, 3) == 3
    I = rgb2gray(I);
end

% T?o hai ?nh I1 và I2 v?i kích th??c nh? ?nh g?c
I1 = I; 
I2 = I;

% L?p qua t?t c? các pixel c?a ?nh I
[rows, cols] = size(I);
for i = 1:rows
    for j = 1:cols
        % C?ng 25 vào pixel và ??m b?o không v??t quá gi?i h?n 0-255
        I1(i,j) = min(max(I(i,j) + 25, 0), 255);  % ??m b?o giá tr? trong ph?m vi 0-255 max(..., 0) ??m b?o không có giá tr? nào nh? h?n 0.
        I2(i,j) = min(max(I(i,j) + 25, 0), 255);  % ??m b?o giá tr? trong ph?m vi 0-255 min(..., 255) ??m b?o không có giá tr? nào v??t quá 255.
    end
end

% Hi?n th? ?nh I1 và I2
subplot(1, 2, 1);
imshow(I1);
title('?nh I1');

subplot(1, 2, 2);
imshow(I2);
title('?nh I2');