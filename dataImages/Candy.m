clc;
clear;
close all;

% ??c ?nh xám t? t?p 'trui.png'
A = imread('trui.png');

% Hi?n th? ?nh g?c ? v? trí (1,1) trên l??i 3x3
subplot(3,3,1), imshow(A,[]);
title('?nh g?c');

% T?o hai b? l?c Gaussian v?i các kích th??c và ?? l?ch chu?n khác nhau
h1 = fspecial('gaussian', [15 15], 6);  % Kernel 15x15, sigma = 6 (làm m? nh?)
h2 = fspecial('gaussian', [30 30], 12); % Kernel 30x30, sigma = 12 (làm m? m?nh h?n)

% Áp d?ng b? l?c Gaussian h1 và hi?n th? k?t qu? ? v? trí (2,1)
subplot(3,3,4), imshow(imfilter(A, h1), []);
title('?nh làm m? (Gaussian 15x15, sigma=6)');

% Áp d?ng b? l?c Gaussian h2 và hi?n th? k?t qu? ? v? trí (3,1)
subplot(3,3,7), imshow(imfilter(A, h2), []);
title('?nh làm m? (Gaussian 30x30, sigma=12)');

% Phát hi?n biên b?ng ph??ng pháp LoG (Laplacian of Gaussian) trên ?nh g?c
[bw, thresh] = edge(A, 'log');
subplot(3,3,2), imshow(bw, []);
title('Biên LoG (?nh g?c)');

% Phát hi?n biên b?ng ph??ng pháp Canny trên ?nh g?c
[bw, thresh] = edge(A, 'canny');
subplot(3,3,3), imshow(bw, []);
title('Biên Canny (?nh g?c)');

% Phát hi?n biên b?ng LoG trên ?nh ?ã làm m? b?ng Gaussian h1
[bw, thresh] = edge(imfilter(A, h1), 'log');
subplot(3,3,5), imshow(bw, []);
title('Biên LoG (Gaussian 15x15, sigma=6)');

% Phát hi?n biên b?ng Canny trên ?nh ?ã làm m? b?ng Gaussian h1
[bw, thresh] = edge(imfilter(A, h1), 'canny');
subplot(3,3,6), imshow(bw, []);
title('Biên Canny (Gaussian 15x15, sigma=6)');

% Phát hi?n biên b?ng LoG trên ?nh ?ã làm m? b?ng Gaussian h2
[bw, thresh] = edge(imfilter(A, h2), 'log');
subplot(3,3,8), imshow(bw, []);
title('Biên LoG (Gaussian 30x30, sigma=12)');

% Phát hi?n biên b?ng Canny trên ?nh ?ã làm m? b?ng Gaussian h2
[bw, thresh] = edge(imfilter(A, h2), 'canny');
subplot(3,3,9), imshow(bw, []);
title('Biên Canny (Gaussian 30x30, sigma=12)');
