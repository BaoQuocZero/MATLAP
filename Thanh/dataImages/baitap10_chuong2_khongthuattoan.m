% a. N?p ?nh v� g�y nhi?u mu?i - ti�u (salt and pepper noise) th? c�ng
i = imread('coins.png');  % ??c ?nh

% Ki?m tra xem ?nh ?� l� ?nh x�m ch?a
if size(i, 3) == 3
    i = rgb2gray(i);  % N?u ?nh l� ?nh m�u, chuy?n th�nh ?nh x�m
end

% G�y nhi?u mu?i - ti�u v?i t? l? 3% (th? c�ng)
[m, n] = size(i);
noisy_img_saltpepper = i;  % B?t ??u v?i ?nh g?c

% X�c ??nh t? l? nhi?u
noise_ratio = 0.03;

% S? l??ng pixel b? nhi?u
num_noise = round(noise_ratio * m * n);

% Ch?n ng?u nhi�n c�c pixel ?? thay ??i th�nh 0 (mu?i) ho?c 255 (ti�u)
salt_pepper_pixels = rand(1, num_noise);  % T?o s? ng?u nhi�n ?? x�c ??nh mu?i v� ti�u

% G�y nhi?u
% Ch?n c�c pixel mu?i (0) v� ti�u (255)
noisy_img_saltpepper(randperm(m*n, num_noise)) = 255 * (salt_pepper_pixels > 0.5); % Mu?i-ti�u

% Hi?n th? ?nh g?c v� ?nh ?� g�y nhi?u
figure;
subplot(1, 2, 1), imshow(i), title('?nh g?c');
subplot(1, 2, 2), imshow(noisy_img_saltpepper), title('?nh sau khi g�y nhi?u mu?i - ti�u');

% b. L?c trung v? v?i k�ch th??c l�n c?n 3x3 (th?c hi?n th? c�ng)
% Kh?i t?o ?nh ??u ra
filtered_img_saltpepper = noisy_img_saltpepper;

% K�ch th??c c?a m?t n?
mask_size = 3;
pad_size = floor(mask_size / 2);  % K�ch th??c ph?n t? padding
noisy_img_padded = padarray(noisy_img_saltpepper, [pad_size, pad_size], 'replicate');

% Duy?t qua t?t c? c�c pixel trong ?nh
for row = 1:m
    for col = 1:n
        % L?y v�ng l�n c?n 3x3 xung quanh pixel (row, col)
        region = noisy_img_padded(row:row+mask_size-1, col:col+mask_size-1);
        
        % T�nh trung v? c?a v�ng l�n c?n
        filtered_img_saltpepper(row, col) = median(region(:));
    end
end

% Hi?n th? ?nh sau khi l?c trung v?
figure;
imshow(filtered_img_saltpepper);
title('?nh sau khi l?c trung v? (mu?i - ti�u)');

% c. T?o nhi?u Gaussian th? c�ng v� �p d?ng l?c trung v?
% ?? l?ch chu?n c?a nhi?u Gaussian
std_dev = 0.02;  % ?? l?ch chu?n c?a nhi?u Gaussian
mean_val = 0;  % Gi� tr? trung b�nh c?a nhi?u Gaussian

% Chuy?n ?nh g?c sang ki?u double ?? c� th? c?ng v?i nhi?u Gaussian
i_double = double(i);

% G�y nhi?u Gaussian (th? c�ng)
noise_gaussian = std_dev * randn(m, n);  % T?o nhi?u Gaussian v?i ph�n ph?i chu?n
noisy_img_gaussian = i_double + noise_gaussian * 255;  % C?ng nhi?u Gaussian v�o ?nh (ph�ng ??i gi� tr? pixel)

% ??m b?o gi� tr? pixel trong ph?m vi [0, 255]
noisy_img_gaussian(noisy_img_gaussian > 255) = 255;
noisy_img_gaussian(noisy_img_gaussian < 0) = 0;

% Chuy?n ?nh v? l?i ki?u uint8
noisy_img_gaussian = uint8(noisy_img_gaussian);

% L?c trung v? ?nh ?� g�y nhi?u Gaussian (th?c hi?n th? c�ng)
filtered_img_gaussian = noisy_img_gaussian;
noisy_img_padded = padarray(noisy_img_gaussian, [pad_size, pad_size], 'replicate');

% Duy?t qua t?t c? c�c pixel trong ?nh
for row = 1:m
    for col = 1:n
        % L?y v�ng l�n c?n 3x3 xung quanh pixel (row, col)
        region = noisy_img_padded(row:row+mask_size-1, col:col+mask_size-1);
        
        % T�nh trung v? c?a v�ng l�n c?n
        filtered_img_gaussian(row, col) = median(region(:));
    end
end

% Hi?n th? ?nh g�y nhi?u Gaussian v� ?nh sau khi l?c
figure;
subplot(1, 2, 1), imshow(noisy_img_gaussian, []), title('?nh sau khi g�y nhi?u Gaussian');
subplot(1, 2, 2), imshow(filtered_img_gaussian, []), title('?nh sau khi l?c trung v? (Gaussian)');
