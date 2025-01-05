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
f_smooth1 = imfilter(f, h1);

% B??c 2: T?o b? l?c Gaussian v?i sigma = 12
sigma2 = 12;
h2 = fspecial('gaussian', [5, 5], sigma2);  % B? l?c Gaussian 5x5 v?i sigma = 12

% Áp d?ng b? l?c Gaussian v?i sigma = 12
f_smooth2 = imfilter(f, h2);

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
