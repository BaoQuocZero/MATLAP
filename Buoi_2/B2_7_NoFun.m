% ??c các ?nh ??u vào
pillsetc = imread('pillsetc.png');
tape = imread('tape.png');
coins = imread('coins.png');
eight = imread('eight.tif');

% Chuy?n ??i ?nh sang ?nh nh? phân v?i ng??ng c? ??nh
pillsetc_1 = im2bw(pillsetc, 0.1); % Tách ng??ng t? ??ng v?i ng??ng 0.1
tape_1 = im2bw(tape, 0.1);         % Tách ng??ng t? ??ng v?i ng??ng 0.1
coins_1 = im2bw(coins, 0.1);       % Tách ng??ng t? ??ng v?i ng??ng 0.1
eight_1 = im2bw(eight, 0.1);       % Tách ng??ng t? ??ng v?i ng??ng 0.1

% Hi?n th? các ?nh g?c và ?nh ?ã tách ng??ng
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
