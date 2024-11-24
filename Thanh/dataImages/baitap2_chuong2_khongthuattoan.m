% a. ??c ?nh g?c
img = imread('Fig0122(a)(fractal-iris).tif');  % ??c ?nh ?a m?c xám
img = double(img);  % Chuy?n ?nh v? ki?u double ?? x? lý

% b. T?o ?nh i3 t? bit plane th? 3
% Chúng ta s? d?ng m?t n? bit 2^(3-1) = 4 (bit th? 3 t? ph?i sang)
mask_3 = 4;
i3 = mod(floor(img / mask_3), 2);  % L?y bit th? 3 và ??a v? giá tr? 0 ho?c 1

% c. T?o ?nh i6 t? bit plane th? 6
% M?t n? bit th? 6: 2^(6-1) = 32
mask_6 = 32;
i6 = mod(floor(img / mask_6), 2);  % L?y bit th? 6 và ??a v? giá tr? 0 ho?c 1

% d. T?o ?nh i78 t? bit plane th? 7 và 8
% M?t n? bit th? 7: 2^(7-1) = 64
% M?t n? bit th? 8: 2^(8-1) = 128
mask_7 = 64;
mask_8 = 128;

i7 = mod(floor(img / mask_7), 2);  % L?y bit th? 7
i8 = mod(floor(img / mask_8), 2);  % L?y bit th? 8

% Ghép bit 7 và 8 l?i
i78 = i7 * 2 + i8;  % T?o ?nh nh? phân có 2 bit (bit 7 và bit 8)

% e. Hi?n th? k?t qu?
% Hi?n th? ?nh g?c
figure;
imshow(img, []);
title('?nh g?c');

% Hi?n th? ?nh i3
figure;
imshow(i3, []);
title('?nh i3 t? bit plane th? 3');

% Hi?n th? ?nh i6
figure;
imshow(i6, []);
title('?nh i6 t? bit plane th? 6');

% Hi?n th? ?nh i78
figure;
imshow(i78, []);
title('?nh i78 t? bit plane th? 7 và 8');
