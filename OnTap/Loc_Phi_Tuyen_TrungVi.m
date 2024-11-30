% ??c ?nh g?c
img = imread('Fig0335(a)(ckt_board_saltpep_prob_pt05).tif'); % ?nh m?c xám

% Hi?n th? ?nh g?c
figure;
imshow(img);
title('?nh g?c v?i nhi?u mu?i tiêu');

% Áp d?ng l?c trung v? (Median Filtering) v?i c?a s? 3x3
filtered_img = medfilt2(img, [3 3]);

% Hi?n th? ?nh sau l?c
figure;
subplot(1, 2, 1);
imshow(img);
title('?nh g?c');

subplot(1, 2, 2);
imshow(filtered_img);
title('?nh sau l?c trung v? (3x3)');
