% ??c ?nh g?c (m?c x�m)
img = imread('Fig0335(a)(ckt_board_saltpep_prob_pt05).tif'); % ?nh m?c x�m

% T?o kernel l?c trung b�nh (3x3)
kernel = ones(3, 3) / 9;

% L?c trung b�nh
filtered_img = imfilter(img, kernel, 'replicate');

% Hi?n th? k?t qu?
figure;
subplot(1, 2, 1), imshow(img), title('?nh g?c');
subplot(1, 2, 2), imshow(filtered_img), title('?nh sau l?c trung b�nh (3x3)');
