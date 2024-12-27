% a. ??c ?nh v� g�y nhi?u mu?i - ti�u (salt & pepper noise)
i = imread('coins.png');  % ??c ?nh i

% Ki?m tra xem ?nh ?� l� ?nh x�m ch?a
if size(i, 3) == 3
    i = rgb2gray(i);  % N?u ?nh l� ?nh m�u, chuy?n th�nh ?nh x�m
end

% G�y nhi?u mu?i - ti�u v?i t? l? 3%
noisy_img_saltpepper = imnoise(i, 'salt & pepper', 0.03);  % G�y nhi?u mu?i - ti�u 3%

% Hi?n th? ?nh g?c v� ?nh ?� g�y nhi?u
figure;
subplot(1, 2, 1), imshow(i), title('?nh g?c');
subplot(1, 2, 2), imshow(noisy_img_saltpepper), title('?nh sau khi g�y nhi?u mu?i - ti�u');

% b. L?c trung v? v?i k�ch th??c l�n c?n 3x3
filtered_img_saltpepper = medfilt2(noisy_img_saltpepper, [3 3]);

% Hi?n th? ?nh sau khi l?c trung v?
figure;
imshow(filtered_img_saltpepper);
title('?nh sau khi l?c trung v? (mu?i - ti�u)');

% c. G�y nhi?u Gaussian 2% v� �p d?ng l?c trung v?
noisy_img_gaussian = imnoise(i, 'gaussian', 0, 0.02);  % G�y nhi?u Gaussian v?i ?? l?ch chu?n 0.02

% L?c trung v? ?nh ?� g�y nhi?u Gaussian
filtered_img_gaussian = medfilt2(noisy_img_gaussian, [3 3]);

% Hi?n th? ?nh g�y nhi?u Gaussian v� ?nh sau khi l?c
figure;
subplot(1, 2, 1), imshow(noisy_img_gaussian), title('?nh sau khi g�y nhi?u Gaussian');
subplot(1, 2, 2), imshow(filtered_img_gaussian), title('?nh sau khi l?c trung v? (Gaussian)');
