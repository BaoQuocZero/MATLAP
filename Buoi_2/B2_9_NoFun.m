% B??c 1: ??c ?nh
f = imread('Fig0333(a)(test_pattern_blurring_orig).tif');

% B??c 2: T?o m?t n? l?c W
w = (1/3) * [1 1 1; 1 1 1; 1 1 1];

% B??c 3: Áp d?ng hàm l?c imfilter
% filtering_mode: 'conv' ?? tích ch?p (default), 'corr' cho t??ng quan.
% boundary_options: 'replicate' ?? l?p l?i giá tr? biên.
% size_options: 'same' ?? gi? nguyên kích th??c.
g = imfilter(f, w, 'conv', 'replicate', 'same');

% B??c 4: Hi?n th? k?t qu?
figure;
subplot(1, 2, 1);
imshow(f);
title('?nh g?c');

subplot(1, 2, 2);
imshow(g);
title('?nh sau khi l?c trung bình');
