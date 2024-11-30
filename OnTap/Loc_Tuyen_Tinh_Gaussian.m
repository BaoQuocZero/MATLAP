% ??c ?nh v?i nhi?u mu?i tiêu
img = imread('Fig0335(a)(ckt_board_saltpep_prob_pt05).tif');

% Hi?n th? ?nh g?c
figure;
imshow(img);
title('?nh g?c v?i nhi?u mu?i tiêu');

% T?o b? l?c Gaussian (3x3, sigma=0.5)
gaussian_kernel = fspecial('gaussian', [3 3], 0.5);

% Áp d?ng l?c Gaussian
filtered_img_gaussian = imfilter(img, gaussian_kernel, 'replicate');

% Hi?n th? ?nh sau l?c
figure;
subplot(1, 2, 1);
imshow(img);
title('?nh g?c');

subplot(1, 2, 2);
imshow(filtered_img_gaussian);
title('?nh sau l?c Gaussian (3x3)');
