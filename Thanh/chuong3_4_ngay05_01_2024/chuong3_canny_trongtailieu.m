% ??c ?nh
A = imread('trui.png');

% Hi?n th? ?nh g?c
subplot(3, 3, 1), imshow(A, []);
title('?nh g?c');

% T?o b? l?c Gaussian v?i sigma = 6 v� sigma = 12
h1 = fspecial('gaussian', [15 15], 6);
h2 = fspecial('gaussian', [30 30], 12);

% �p d?ng b? l?c Gaussian v� hi?n th? k?t qu?
subplot(3, 3, 4), imshow(imfilter(A, h1), []);
title('Gaussian filter (15x15, sigma=6)');
subplot(3, 3, 7), imshow(imfilter(A, h2), []);
title('Gaussian filter (30x30, sigma=12)');

% Ph�t hi?n bi�n b?ng ph??ng ph�p Laplacian of Gaussian (LOG)
[bw, thresh] = edge(A, 'log');  % Ph�t hi?n bi�n b?ng LOG
subplot(3, 3, 2), imshow(bw, []);
title('Bi�n v?i LOG');

% Ph�t hi?n bi�n b?ng ph??ng ph�p Canny
[bw, thresh] = edge(A, 'canny');  % Ph�t hi?n bi�n b?ng Canny
subplot(3, 3, 3), imshow(bw, []);
title('Bi�n v?i Canny');

% �p d?ng b? l?c Gaussian (sigma = 6) v� ph�t hi?n bi�n v?i LOG
[bw, thresh] = edge(imfilter(A, h1), 'log');
subplot(3, 3, 5), imshow(bw, []);
title('Bi�n v?i LOG (Gaussian 15x15, sigma=6)');

% �p d?ng b? l?c Gaussian (sigma = 6) v� ph�t hi?n bi�n v?i Canny
[bw, thresh] = edge(imfilter(A, h1), 'canny');
subplot(3, 3, 6), imshow(bw, []);
title('Bi�n v?i Canny (Gaussian 15x15, sigma=6)');

% �p d?ng b? l?c Gaussian (sigma = 12) v� ph�t hi?n bi�n v?i LOG
[bw, thresh] = edge(imfilter(A, h2), 'log');
subplot(3, 3, 8), imshow(bw, []);
title('Bi�n v?i LOG (Gaussian 30x30, sigma=12)');

% �p d?ng b? l?c Gaussian (sigma = 12) v� ph�t hi?n bi�n v?i Canny
[bw, thresh] = edge(imfilter(A, h2), 'canny');
subplot(3, 3, 9), imshow(bw, []);
title('Bi�n v?i Canny (Gaussian 30x30, sigma=12)');
