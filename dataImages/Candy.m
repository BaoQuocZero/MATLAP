clc;
clear;
close all;

% ??c ?nh x�m t? t?p 'trui.png'
A = imread('trui.png');

% Hi?n th? ?nh g?c ? v? tr� (1,1) tr�n l??i 3x3
subplot(3,3,1), imshow(A,[]);
title('?nh g?c');

% T?o hai b? l?c Gaussian v?i c�c k�ch th??c v� ?? l?ch chu?n kh�c nhau
h1 = fspecial('gaussian', [15 15], 6);  % Kernel 15x15, sigma = 6 (l�m m? nh?)
h2 = fspecial('gaussian', [30 30], 12); % Kernel 30x30, sigma = 12 (l�m m? m?nh h?n)

% �p d?ng b? l?c Gaussian h1 v� hi?n th? k?t qu? ? v? tr� (2,1)
subplot(3,3,4), imshow(imfilter(A, h1), []);
title('?nh l�m m? (Gaussian 15x15, sigma=6)');

% �p d?ng b? l?c Gaussian h2 v� hi?n th? k?t qu? ? v? tr� (3,1)
subplot(3,3,7), imshow(imfilter(A, h2), []);
title('?nh l�m m? (Gaussian 30x30, sigma=12)');

% Ph�t hi?n bi�n b?ng ph??ng ph�p LoG (Laplacian of Gaussian) tr�n ?nh g?c
[bw, thresh] = edge(A, 'log');
subplot(3,3,2), imshow(bw, []);
title('Bi�n LoG (?nh g?c)');

% Ph�t hi?n bi�n b?ng ph??ng ph�p Canny tr�n ?nh g?c
[bw, thresh] = edge(A, 'canny');
subplot(3,3,3), imshow(bw, []);
title('Bi�n Canny (?nh g?c)');

% Ph�t hi?n bi�n b?ng LoG tr�n ?nh ?� l�m m? b?ng Gaussian h1
[bw, thresh] = edge(imfilter(A, h1), 'log');
subplot(3,3,5), imshow(bw, []);
title('Bi�n LoG (Gaussian 15x15, sigma=6)');

% Ph�t hi?n bi�n b?ng Canny tr�n ?nh ?� l�m m? b?ng Gaussian h1
[bw, thresh] = edge(imfilter(A, h1), 'canny');
subplot(3,3,6), imshow(bw, []);
title('Bi�n Canny (Gaussian 15x15, sigma=6)');

% Ph�t hi?n bi�n b?ng LoG tr�n ?nh ?� l�m m? b?ng Gaussian h2
[bw, thresh] = edge(imfilter(A, h2), 'log');
subplot(3,3,8), imshow(bw, []);
title('Bi�n LoG (Gaussian 30x30, sigma=12)');

% Ph�t hi?n bi�n b?ng Canny tr�n ?nh ?� l�m m? b?ng Gaussian h2
[bw, thresh] = edge(imfilter(A, h2), 'canny');
subplot(3,3,9), imshow(bw, []);
title('Bi�n Canny (Gaussian 30x30, sigma=12)');
