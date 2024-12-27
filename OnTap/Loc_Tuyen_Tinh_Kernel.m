% ??c ?nh có nhi?u mu?i tiêu
img = imread('Fig0335(a)(ckt_board_saltpep_prob_pt05).tif'); % ?nh m?c xám

% Hi?n th? ?nh g?c
figure;
imshow(img);
title('?nh g?c v?i nhi?u mu?i tiêu');

% T?o kernel l?c tuy?n tính (3x3)
kernel = ones(3, 3) / 9; % Kernel trung bình (Mean Filter)

% Áp d?ng l?c tuy?n tính v?i kernel
filtered_img = imfilter(img, kernel, 'replicate'); % Tùy ch?n 'replicate' ?? x? lý biên

% Hi?n th? ?nh sau l?c
figure;
subplot(1, 2, 1);
imshow(img);
title('?nh g?c');

subplot(1, 2, 2);
imshow(filtered_img);
title('?nh sau l?c tuy?n tính (Kernel 3x3)');
