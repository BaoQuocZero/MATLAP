% ??c ?nh ??u vào
pillsetc = imread('pillsetc.png');
tape = imread('tape.png');
coins = imread('coins.png');
eight = imread('eight.tif');

% Thi?t l?p ng??ng (threshold) ?? chuy?n sang nh? phân
threshold = 0.1;

% Chuy?n ??i các ?nh
pillsetc_1 = convert_to_binary(pillsetc, threshold);
tape_1 = convert_to_binary(tape, threshold);
coins_1 = convert_to_binary(coins, threshold);
eight_1 = convert_to_binary(eight, threshold);

% Hi?n th? ?nh g?c và nh? phân
figure;
subplot(4, 2, 1), imshow(pillsetc);
title('?nh g?c: pillsetc');
subplot(4, 2, 2), imshow(pillsetc_1);
title('?nh nh? phân: pillsetc');

subplot(4, 2, 3), imshow(tape);
title('?nh g?c: tape');
subplot(4, 2, 4), imshow(tape_1);
title('?nh nh? phân: tape');

subplot(4, 2, 5), imshow(coins);
title('?nh g?c: coins');
subplot(4, 2, 6), imshow(coins_1);
title('?nh nh? phân: coins');

subplot(4, 2, 7), imshow(eight);
title('?nh g?c: eight');
subplot(4, 2, 8), imshow(eight_1);
title('?nh nh? phân: eight');

% Hàm chuy?n ??i ?nh sang nh? phân dùng vòng l?p
function binary_image = convert_to_binary(image, threshold)
    % Chu?n hóa ng??ng (0-255 -> 0-1 n?u ?nh ki?u uint8)
    if isa(image, 'uint8')
        threshold = threshold * 255;
    end
    
    % Kh?i t?o ?nh nh? phân cùng kích th??c ?nh g?c
    [rows, cols] = size(image);
    binary_image = zeros(rows, cols, 'logical');
    
    % Duy?t t?ng pixel và gán giá tr? nh? phân
    for i = 1:rows
        for j = 1:cols
            if image(i, j) >= threshold
                binary_image(i, j) = 1; % Pixel sáng
            else
                binary_image(i, j) = 0; % Pixel t?i
            end
        end
    end
end