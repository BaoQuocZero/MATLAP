% ??c ?nh
I = imread('cell.tif');

% Hi?n th? ?nh g?c
figure;
subplot(1, 3, 1); % S? d?ng subplot(1, 3, x) thay v� subplot(1, 2, x)
imshow(I);
title('?nh g?c');

% Truy xu?t gi� tr? c?a pixel t?i v? tr� (100, 20)
pixel_value = I(100, 20);

% Hi?n th? gi� tr? c?a pixel
disp(['Gi� tr? pixel t?i (100, 20): ', num2str(pixel_value)]);

% C?ng 25 v�o gi� tr? c?a pixel t?i v? tr� (100, 20)
I_plus = I;
I_plus(100, 20) = I_plus(100, 20) + 25;

% ??m b?o gi� tr? pixel sau ph�p c?ng kh�ng v??t qu� gi?i h?n (0-255)
I_plus(100, 20) = min(max(I_plus(100, 20), 0), 255);

% Hi?n th? ?nh sau khi c?ng
subplot(1, 3, 2);
imshow(I_plus);
title('?nh sau khi c?ng 25 t?i (100, 20)');

% Tr? 25 t? gi� tr? c?a pixel t?i v? tr� (100, 20)
I_minus = I;
I_minus(100, 20) = I_minus(100, 20) - 25;

% ??m b?o gi� tr? pixel sau ph�p tr? kh�ng nh? h?n 0
I_minus(100, 20) = min(max(I_minus(100, 20), 0), 255);

% Hi?n th? ?nh sau khi tr?
subplot(1, 3, 3);
imshow(I_minus);
title('?nh sau khi tr? 25 t?i (100, 20)');

% Hi?n th? ?nh g?c, ?nh sau ph�p c?ng v� ?nh sau ph�p tr?
figure;
subplot(1, 3, 1); imshow(I); title('?nh g?c');
subplot(1, 3, 2); imshow(I_plus); title('C?ng 25 t?i (100, 20)');
subplot(1, 3, 3); imshow(I_minus); title('Tr? 25 t?i (100, 20)');