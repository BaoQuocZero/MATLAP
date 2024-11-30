% a. ??c ?nh và gây nhi?u mu?i - tiêu (salt & pepper noise)
i = imread('coins.png');  % ??c ?nh i

% Ki?m tra xem ?nh ?ã là ?nh xám ch?a
if size(i, 3) == 3
    i = rgb2gray(i);  % N?u ?nh là ?nh màu, chuy?n thành ?nh xám
end

% Gây nhi?u mu?i - tiêu v?i t? l? 3%
noisy_img_saltpepper = imnoise(i, 'salt & pepper', 0.03);  % Gây nhi?u mu?i - tiêu 3%

% Hi?n th? ?nh g?c và ?nh ?ã gây nhi?u
figure;
subplot(1, 2, 1), imshow(i), title('?nh g?c');
subplot(1, 2, 2), imshow(noisy_img_saltpepper), title('?nh sau khi gây nhi?u mu?i - tiêu');

% b. L?c trung v? v?i kích th??c lân c?n 3x3
filtered_img_saltpepper = medfilt2(noisy_img_saltpepper, [3 3]);

% Hi?n th? ?nh sau khi l?c trung v?
figure;
imshow(filtered_img_saltpepper);
title('?nh sau khi l?c trung v? (mu?i - tiêu)');

% c. Gây nhi?u Gaussian 2% và áp d?ng l?c trung v?
noisy_img_gaussian = imnoise(i, 'gaussian', 0, 0.02);  % Gây nhi?u Gaussian v?i ?? l?ch chu?n 0.02

% L?c trung v? ?nh ?ã gây nhi?u Gaussian
filtered_img_gaussian = medfilt2(noisy_img_gaussian, [3 3]);

% Hi?n th? ?nh gây nhi?u Gaussian và ?nh sau khi l?c
figure;
subplot(1, 2, 1), imshow(noisy_img_gaussian), title('?nh sau khi gây nhi?u Gaussian');
subplot(1, 2, 2), imshow(filtered_img_gaussian), title('?nh sau khi l?c trung v? (Gaussian)');
