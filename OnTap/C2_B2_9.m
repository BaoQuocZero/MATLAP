i = imread('Fig0333(a)(test_pattern_blurring_orig).tif');  % ??c ?nh t? file và l?u vào bi?n i

% N?u ?nh là ?nh màu, chuy?n thành ?nh xám (grayscale)
if size(i, 3) == 3
    i = rgb2gray(i);  % Chuy?n ?nh màu thành ?nh xám
end

% Xây d?ng m?t b? l?c w (b? l?c 3x3 v?i m?i ph?n t? b?ng 1/9)
w = ones(3, 3) / 9;  % B? l?c trung bình 3x3 (các ph?n t? ??u có giá tr? b?ng 1/9)

% Áp d?ng l?c tuy?n tính (dùng Correlation ho?c Convolution)
g = imfilter(i, w, 'corr', 'replicate', 'same');  % L?c v?i Correlation, biên 'replicate', kích th??c 'same'

% Hi?n th? ?nh g?c và ?nh sau khi l?c
figure;
subplot(1, 2, 1), imshow(i), title('?nh g?c');
subplot(1, 2, 2), imshow(g), title('?nh sau khi l?c');
