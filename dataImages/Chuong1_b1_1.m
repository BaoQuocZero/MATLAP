% ??c ?nh
I = imread('cell.tif');

% Hi?n th? ?nh g?c
figure;
subplot(1, 3, 1); % S? d?ng subplot(1, 3, x) thay vì subplot(1, 2, x)
imshow(I);
title('?nh g?c');

% Truy xu?t giá tr? c?a pixel t?i v? trí (100, 20)
pixel_value = I(100, 20);

% Hi?n th? giá tr? c?a pixel
disp(['Giá tr? pixel t?i (100, 20): ', num2str(pixel_value)]);

% C?ng 25 vào giá tr? c?a pixel t?i v? trí (100, 20)
I_plus = I;
I_plus(100, 20) = I_plus(100, 20) + 25;

% ??m b?o giá tr? pixel sau phép c?ng không v??t quá gi?i h?n (0-255)
I_plus(100, 20) = min(max(I_plus(100, 20), 0), 255);

% Hi?n th? ?nh sau khi c?ng
subplot(1, 3, 2);
imshow(I_plus);
title('?nh sau khi c?ng 25 t?i (100, 20)');

% Tr? 25 t? giá tr? c?a pixel t?i v? trí (100, 20)
I_minus = I;
I_minus(100, 20) = I_minus(100, 20) - 25;

% ??m b?o giá tr? pixel sau phép tr? không nh? h?n 0
I_minus(100, 20) = min(max(I_minus(100, 20), 0), 255);

% Hi?n th? ?nh sau khi tr?
subplot(1, 3, 3);
imshow(I_minus);
title('?nh sau khi tr? 25 t?i (100, 20)');

% Hi?n th? ?nh g?c, ?nh sau phép c?ng và ?nh sau phép tr?
figure;
subplot(1, 3, 1); imshow(I); title('?nh g?c');
subplot(1, 3, 2); imshow(I_plus); title('C?ng 25 t?i (100, 20)');
subplot(1, 3, 3); imshow(I_minus); title('Tr? 25 t?i (100, 20)');