% ??c ?nh vào
f = imread('Fig1005(a)(wirebond_mask).tif');

% Chuy?n ?nh sang ?nh xám n?u ?nh là ?nh màu
if size(f, 3) == 3
    f = rgb2gray(f);
end

% B??c 1: T?o b? l?c Gaussian v?i sigma = 6
sigma1 = 6;
h1 = fspecial('gaussian', [5, 5], sigma1);  % B? l?c Gaussian 5x5 v?i sigma = 6

% Áp d?ng b? l?c Gaussian v?i sigma = 6
f_smooth1 = zeros(size(f));  % Kh?i t?o ?nh làm m?n v?i sigma = 6
[rows, cols] = size(f);

% Thêm padding cho ?nh ?? d? dàng th?c hi?n ch?p ? biên ?nh
pad_size = floor(size(h1, 1) / 2);  % L??ng padding c?n thi?t
f_padded1 = padarray(f, [pad_size, pad_size]);

for i = 1:rows
    for j = 1:cols
        region = f_padded1(i:i+4, j:j+4);  % L?y vùng con 5x5 xung quanh pixel (i, j)
        f_smooth1(i, j) = sum(sum(double(region) .* h1));  % Ch?p ?nh v?i b? l?c Gaussian
    end
end

% B??c 2: T?o b? l?c Gaussian v?i sigma = 12
sigma2 = 12;
h2 = fspecial('gaussian', [5, 5], sigma2);  % B? l?c Gaussian 5x5 v?i sigma = 12

% Áp d?ng b? l?c Gaussian v?i sigma = 12
f_smooth2 = zeros(size(f));  % Kh?i t?o ?nh làm m?n v?i sigma = 12
f_padded2 = padarray(f, [pad_size, pad_size]);

for i = 1:rows
    for j = 1:cols
        region = f_padded2(i:i+4, j:j+4);  % L?y vùng con 5x5 xung quanh pixel (i, j)
        f_smooth2(i, j) = sum(sum(double(region) .* h2));  % Ch?p ?nh v?i b? l?c Gaussian
    end
end

% B??c 3: Hi?n th? ?nh g?c và ?nh sau khi làm m?n v?i sigma = 6 và sigma = 12
figure;

subplot(1, 3, 1);
imshow(f);
title('?nh g?c');

subplot(1, 3, 2);
imshow(f_smooth1);
title('?nh v?i sigma = 6');

subplot(1, 3, 3);
imshow(f_smooth2);
title('?nh v?i sigma = 12');
