% ??c ?nh
I = imread('cell.tif');

% Hi?n th? ?nh
figure;
imshow(I);
title('?nh g?c');

% Truy xu?t gi� tr? t?i v? tr� pixel (100, 20)
i = 100;
j = 20;
original_value = I(i, j); % L?y gi� tr? pixel ban ??u

% Th?c hi?n ph�p to�n: c?ng v� tr? 25
I_add = I; % T?o b?n sao ?? th?c hi?n ph�p c?ng
I_sub = I; % T?o b?n sao ?? th?c hi?n ph�p tr?

I_add(i, j) = I_add(i, j) + 25; % C?ng 25 v�o pixel (100, 20)
I_sub(i, j) = I_sub(i, j) - 25; % Tr? 25 t? pixel (100, 20)

% ??m b?o gi� tr? pixel n?m trong kho?ng [0, 255] cho ?nh 8-bit
I_add = uint8(max(min(I_add, 255), 0));
I_sub = uint8(max(min(I_sub, 255), 0));

% Hi?n th? ?nh sau khi thay ??i pixel
figure;
subplot(1, 3, 1); imshow(I); title('?nh g?c');
subplot(1, 3, 2); imshow(I_add); title('C?ng 25 t?i (100, 20)');
subplot(1, 3, 3); imshow(I_sub); title('Tr? 25 t?i (100, 20)');

% Kh?i t?o hai ?nh m?i
[rows, cols] = size(I); % L?y k�ch th??c ?nh
I1 = zeros(rows, cols, 'uint8'); % ?nh I1: C?ng 25
I2 = zeros(rows, cols, 'uint8'); % ?nh I2: Tr? 25

% Duy?t qua t?ng pixel c?a ?nh v� th?c hi?n ph�p t�nh
for i = 1:rows
    for j = 1:cols
        % C?ng 25 v� ??m b?o gi� tr? kh�ng v??t qu� 255
        I1(i, j) = min(I(i, j) + 50, 255);
        
        % Tr? 25 v� ??m b?o gi� tr? kh�ng nh? h?n 0
        I2(i, j) = max(I(i, j) - 50, 0);
    end
end

% Hi?n th? k?t qu?
figure;
subplot(1, 3, 1); imshow(I); title('?nh g?c');
subplot(1, 3, 2); imshow(I1); title('?nh sau khi c?ng 25');
subplot(1, 3, 3); imshow(I2); title('?nh sau khi tr? 25');




