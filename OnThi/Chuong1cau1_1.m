% ??c ?nh màu
I = imread('trees.tif');

% Hi?n th? ?nh g?c
figure;
imshow(I);
title('?nh g?c');

% Xác ??nh v? trí pixel (100,20)
i = 100;
j = 20;
original_value = squeeze(I(i, j, :)); % L?y giá tr? pixel t?i (100,20) cho c? 3 kênh
disp(['Giá tr? pixel t?i (100,20) tr??c khi thay ??i: ', num2str(original_value')]);

% Th?c hi?n phép toán c?ng và tr? trên c? 3 kênh
I_add = I;
I_add(i, j, :) = min(I_add(i, j, :) + 25, 255); % ??m b?o không v??t quá 255

I_sub = I;
I_sub(i, j, :) = max(I_sub(i, j, :) - 25, 0); % ??m b?o không nh? h?n 0

% Hi?n th? ?nh sau khi c?ng
figure;
imshow(I_add);
title('?nh sau khi c?ng 25 vào pixel (100,20)');

% Hi?n th? ?nh sau khi tr?
figure;
imshow(I_sub);
title('?nh sau khi tr? 25 t? pixel (100,20)');

% Hi?n th? giá tr? pixel sau thay ??i
disp(['Giá tr? pixel sau khi c?ng 25: ', num2str(squeeze(I_add(i, j, :))')]);
disp(['Giá tr? pixel sau khi tr? 25: ', num2str(squeeze(I_sub(i, j, :))')]);
