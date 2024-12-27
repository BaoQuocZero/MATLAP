% ??c ?nh
I = imread('Fig0122(a)(fractal-iris).tif');

% Ki?m tra n?u ?nh không ph?i ?nh xám, chuy?n ??i
if size(I, 3) == 3
    I = rgb2gray(I);  % Chuy?n ?nh màu sang ?nh xám n?u c?n
end

% Truy xu?t bit plane th? 7 và th? 8
bit_plane_7 = bitget(I, 7); % L?y bit th? 7
bit_plane_8 = bitget(I, 8); % L?y bit th? 8

% T?o ?nh i78 b?ng cách k?t h?p bit th? 7 và 8
i78 = bitset(zeros(size(I)), 7, bit_plane_7);  % ??t bit th? 7 c?a ?nh m?i
i78 = bitset(i78, 8, bit_plane_8);             % ??t bit th? 8 c?a ?nh m?i

% Hi?n th? ?nh g?c và ?nh i78
figure;
subplot(1, 2, 1);
imshow(I);
title('?nh g?c');

subplot(1, 2, 2);
imshow(i78, []);
title('?nh i78 (Bit plane th? 7 và 8)');
