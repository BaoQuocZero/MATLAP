% ??c ?nh vào bi?n I
I = imread('Fig0122(a)(fractal-iris).tif');

% Kích th??c ?nh
[rows, cols] = size(I);

% 2.2a: T?o ?nh i3 t? bit plane th? 3 c?a ?nh I
bit_plane_3 = 3; % Bit th? 3
I3 = zeros(rows, cols); % Kh?i t?o ma tr?n ?nh I3
for i = 1:rows
    for j = 1:cols
        % L?y giá tr? bit th? 3 c?a m?i pixel
        I3(i, j) = bitand(I(i, j), 2^(bit_plane_3 - 1)) > 0;
    end
end

% 2.2b: T?o ?nh i6 t? bit plane th? 6 c?a ?nh I
bit_plane_6 = 6; % Bit th? 6
I6 = zeros(rows, cols); % Kh?i t?o ma tr?n ?nh I6
for i = 1:rows
    for j = 1:cols
        % L?y giá tr? bit th? 6 c?a m?i pixel
        I6(i, j) = bitand(I(i, j), 2^(bit_plane_6 - 1)) > 0;
    end
end

% Truy xu?t bit plane th? 7 và th? 8
bit_plane_7 = 7;
bit_plane_8 = 8;

bit7 = zeros(rows, cols); % ?nh ch?a bit th? 7
bit8 = zeros(rows, cols); % ?nh ch?a bit th? 8
for i = 1:rows
    for j = 1:cols
        % L?y giá tr? bit th? 7 và 8
        bit7(i, j) = bitand(I(i, j), 2^(bit_plane_7 - 1)) > 0;
        bit8(i, j) = bitand(I(i, j), 2^(bit_plane_8 - 1)) > 0;
    end
end

% T?o ?nh i78 b?ng cách k?t h?p bit th? 7 và 8
i78 = zeros(rows, cols, 'uint8'); % Kh?i t?o ?nh i78
for i = 1:rows
    for j = 1:cols
        % ??t bit th? 7 và th? 8
        i78(i, j) = bit7(i, j) * 2^(bit_plane_7 - 1) + bit8(i, j) * 2^(bit_plane_8 - 1);
    end
end

% Hi?n th? ?nh
figure;
subplot(2, 2, 1); imshow(I);
title('?nh g?c');

subplot(2, 2, 2); imshow(I3, []);
title('Bit plane th? 3');

subplot(2, 2, 3); imshow(I6, []);
title('Bit plane th? 6');

subplot(2, 2, 4); imshow(i78, []);
title('?nh i78 (Bit plane th? 7 và 8)');