% ??c ?nh ??u v�o
pillsetc = imread('pillsetc.png');
tape = imread('tape.png');
coins = imread('coins.png');
eight = imread('eight.tif');

% Thi?t l?p ng??ng (threshold) ?? chuy?n sang nh? ph�n
threshold = 0.1;

% Chuy?n ??i c�c ?nh
pillsetc_1 = convert_to_binary(pillsetc, threshold);
tape_1 = convert_to_binary(tape, threshold);
coins_1 = convert_to_binary(coins, threshold);
eight_1 = convert_to_binary(eight, threshold);

% Hi?n th? ?nh g?c v� nh? ph�n
figure;
subplot(4, 2, 1), imshow(pillsetc);
title('?nh g?c: pillsetc');
subplot(4, 2, 2), imshow(pillsetc_1);
title('?nh nh? ph�n: pillsetc');

subplot(4, 2, 3), imshow(tape);
title('?nh g?c: tape');
subplot(4, 2, 4), imshow(tape_1);
title('?nh nh? ph�n: tape');

subplot(4, 2, 5), imshow(coins);
title('?nh g?c: coins');
subplot(4, 2, 6), imshow(coins_1);
title('?nh nh? ph�n: coins');

subplot(4, 2, 7), imshow(eight);
title('?nh g?c: eight');
subplot(4, 2, 8), imshow(eight_1);
title('?nh nh? ph�n: eight');

% H�m chuy?n ??i ?nh sang nh? ph�n d�ng v�ng l?p
function binary_image = convert_to_binary(image, threshold)
    % Chu?n h�a ng??ng (0-255 -> 0-1 n?u ?nh ki?u uint8)
    if isa(image, 'uint8')
        threshold = threshold * 255;
    end
    
    % Kh?i t?o ?nh nh? ph�n c�ng k�ch th??c ?nh g?c
    [rows, cols] = size(image);
    binary_image = zeros(rows, cols, 'logical');
    
    % Duy?t t?ng pixel v� g�n gi� tr? nh? ph�n
    for i = 1:rows
        for j = 1:cols
            if image(i, j) >= threshold
                binary_image(i, j) = 1; % Pixel s�ng
            else
                binary_image(i, j) = 0; % Pixel t?i
            end
        end
    end
end