% a. N?p ?nh và gây nhi?u mu?i - tiêu (salt and pepper noise) th? công
i = imread('coins.png');  % ??c ?nh

% Ki?m tra xem ?nh ?ã là ?nh xám ch?a
if size(i, 3) == 3
    i = rgb2gray(i);  % N?u ?nh là ?nh màu, chuy?n thành ?nh xám
end

% Gây nhi?u mu?i - tiêu v?i t? l? 3% (th? công)
[m, n] = size(i);
noisy_img_saltpepper = i;  % B?t ??u v?i ?nh g?c

% Xác ??nh t? l? nhi?u
noise_ratio = 0.03;

% S? l??ng pixel b? nhi?u
num_noise = round(noise_ratio * m * n);

% Ch?n ng?u nhiên các pixel ?? thay ??i thành 0 (mu?i) ho?c 255 (tiêu)
salt_pepper_pixels = rand(1, num_noise);  % T?o s? ng?u nhiên ?? xác ??nh mu?i và tiêu

% Gây nhi?u
% Ch?n các pixel mu?i (0) và tiêu (255)
noisy_img_saltpepper(randperm(m*n, num_noise)) = 255 * (salt_pepper_pixels > 0.5); % Mu?i-tiêu

% Hi?n th? ?nh g?c và ?nh ?ã gây nhi?u
figure;
subplot(1, 2, 1), imshow(i), title('?nh g?c');
subplot(1, 2, 2), imshow(noisy_img_saltpepper), title('?nh sau khi gây nhi?u mu?i - tiêu');

% b. L?c trung v? v?i kích th??c lân c?n 3x3 (th?c hi?n th? công)
% Kh?i t?o ?nh ??u ra
filtered_img_saltpepper = noisy_img_saltpepper;

% Kích th??c c?a m?t n?
mask_size = 3;
pad_size = floor(mask_size / 2);  % Kích th??c ph?n t? padding
noisy_img_padded = padarray(noisy_img_saltpepper, [pad_size, pad_size], 'replicate');

% Duy?t qua t?t c? các pixel trong ?nh
for row = 1:m
    for col = 1:n
        % L?y vùng lân c?n 3x3 xung quanh pixel (row, col)
        region = noisy_img_padded(row:row+mask_size-1, col:col+mask_size-1);
        
        % Tính trung v? c?a vùng lân c?n
        filtered_img_saltpepper(row, col) = median(region(:));
    end
end

% Hi?n th? ?nh sau khi l?c trung v?
figure;
imshow(filtered_img_saltpepper);
title('?nh sau khi l?c trung v? (mu?i - tiêu)');

% c. T?o nhi?u Gaussian th? công và áp d?ng l?c trung v?
% ?? l?ch chu?n c?a nhi?u Gaussian
std_dev = 0.02;  % ?? l?ch chu?n c?a nhi?u Gaussian
mean_val = 0;  % Giá tr? trung bình c?a nhi?u Gaussian

% Chuy?n ?nh g?c sang ki?u double ?? có th? c?ng v?i nhi?u Gaussian
i_double = double(i);

% Gây nhi?u Gaussian (th? công)
noise_gaussian = std_dev * randn(m, n);  % T?o nhi?u Gaussian v?i phân ph?i chu?n
noisy_img_gaussian = i_double + noise_gaussian * 255;  % C?ng nhi?u Gaussian vào ?nh (phóng ??i giá tr? pixel)

% ??m b?o giá tr? pixel trong ph?m vi [0, 255]
noisy_img_gaussian(noisy_img_gaussian > 255) = 255;
noisy_img_gaussian(noisy_img_gaussian < 0) = 0;

% Chuy?n ?nh v? l?i ki?u uint8
noisy_img_gaussian = uint8(noisy_img_gaussian);

% L?c trung v? ?nh ?ã gây nhi?u Gaussian (th?c hi?n th? công)
filtered_img_gaussian = noisy_img_gaussian;
noisy_img_padded = padarray(noisy_img_gaussian, [pad_size, pad_size], 'replicate');

% Duy?t qua t?t c? các pixel trong ?nh
for row = 1:m
    for col = 1:n
        % L?y vùng lân c?n 3x3 xung quanh pixel (row, col)
        region = noisy_img_padded(row:row+mask_size-1, col:col+mask_size-1);
        
        % Tính trung v? c?a vùng lân c?n
        filtered_img_gaussian(row, col) = median(region(:));
    end
end

% Hi?n th? ?nh gây nhi?u Gaussian và ?nh sau khi l?c
figure;
subplot(1, 2, 1), imshow(noisy_img_gaussian, []), title('?nh sau khi gây nhi?u Gaussian');
subplot(1, 2, 2), imshow(filtered_img_gaussian, []), title('?nh sau khi l?c trung v? (Gaussian)');
