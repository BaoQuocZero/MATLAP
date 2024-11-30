i = imread('Fig0333(a)(test_pattern_blurring_orig).tif');  % ??c ?nh t? file v� l?u v�o bi?n i

% N?u ?nh l� ?nh m�u, chuy?n th�nh ?nh x�m (grayscale)
if size(i, 3) == 3
    i = rgb2gray(i);  % Chuy?n ?nh m�u th�nh ?nh x�m
end

% X�y d?ng m?t b? l?c w (b? l?c 3x3 v?i m?i ph?n t? b?ng 1/9)
w = ones(3, 3) / 9;  % B? l?c trung b�nh 3x3 (c�c ph?n t? ??u c� gi� tr? b?ng 1/9)

% �p d?ng l?c tuy?n t�nh (d�ng Correlation ho?c Convolution)
g = imfilter(i, w, 'corr', 'replicate', 'same');  % L?c v?i Correlation, bi�n 'replicate', k�ch th??c 'same'

% Hi?n th? ?nh g?c v� ?nh sau khi l?c
figure;
subplot(1, 2, 1), imshow(i), title('?nh g?c');
subplot(1, 2, 2), imshow(g), title('?nh sau khi l?c');
