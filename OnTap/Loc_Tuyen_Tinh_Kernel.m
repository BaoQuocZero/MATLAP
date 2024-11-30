% ??c ?nh c� nhi?u mu?i ti�u
img = imread('Fig0335(a)(ckt_board_saltpep_prob_pt05).tif'); % ?nh m?c x�m

% Hi?n th? ?nh g?c
figure;
imshow(img);
title('?nh g?c v?i nhi?u mu?i ti�u');

% T?o kernel l?c tuy?n t�nh (3x3)
kernel = ones(3, 3) / 9; % Kernel trung b�nh (Mean Filter)

% �p d?ng l?c tuy?n t�nh v?i kernel
filtered_img = imfilter(img, kernel, 'replicate'); % T�y ch?n 'replicate' ?? x? l� bi�n

% Hi?n th? ?nh sau l?c
figure;
subplot(1, 2, 1);
imshow(img);
title('?nh g?c');

subplot(1, 2, 2);
imshow(filtered_img);
title('?nh sau l?c tuy?n t�nh (Kernel 3x3)');
