% ??c ?nh cell.tif
I = imread('cell.tif');
imshow(I); % Hi?n th? ?nh g?c
title('?nh g?c');

% L?y gi� tr? pixel t?i v? tr� (100,20)
x = 100; y = 20;
pixel_value = I(x, y);
fprintf('Gi� tr? pixel ban ??u t?i (%d, %d): %d\n', x, y, pixel_value);

% C?ng 25 v�o gi� tr? pixel
I_plus = I; % T?o b?n sao ?nh
I_plus(x, y) = I_plus(x, y) + 25;

% Tr? 25 t? gi� tr? pixel
I_minus = I; % T?o b?n sao ?nh
I_minus(x, y) = I_minus(x, y) - 25;

% Hi?n th? ?nh sau khi thay ??i
figure;
subplot(1, 3, 1);
imshow(I); title('?nh g?c');

subplot(1, 3, 2);
imshow(I_plus); title('?nh sau khi +25');

subplot(1, 3, 3);
imshow(I_minus); title('?nh sau khi -25');

% Hi?n th? gi� tr? pixel sau khi thay ??i
fprintf('Gi� tr? pixel sau khi +25 t?i (%d, %d): %d\n', x, y, I_plus(x, y));
fprintf('Gi� tr? pixel sau khi -25 t?i (%d, %d): %d\n', x, y, I_minus(x, y));
