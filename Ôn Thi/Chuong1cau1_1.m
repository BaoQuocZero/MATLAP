% ??c ?nh m�u
I = imread('trees.tif');

% Hi?n th? ?nh g?c
figure;
imshow(I);
title('?nh g?c');

% X�c ??nh v? tr� pixel (100,20)
i = 100;
j = 20;
original_value = squeeze(I(i, j, :)); % L?y gi� tr? pixel t?i (100,20) cho c? 3 k�nh
disp(['Gi� tr? pixel t?i (100,20) tr??c khi thay ??i: ', num2str(original_value')]);

% Th?c hi?n ph�p to�n c?ng v� tr? tr�n c? 3 k�nh
I_add = I;
I_add(i, j, :) = min(I_add(i, j, :) + 25, 255); % ??m b?o kh�ng v??t qu� 255

I_sub = I;
I_sub(i, j, :) = max(I_sub(i, j, :) - 25, 0); % ??m b?o kh�ng nh? h?n 0

% Hi?n th? ?nh sau khi c?ng
figure;
imshow(I_add);
title('?nh sau khi c?ng 25 v�o pixel (100,20)');

% Hi?n th? ?nh sau khi tr?
figure;
imshow(I_sub);
title('?nh sau khi tr? 25 t? pixel (100,20)');

% Hi?n th? gi� tr? pixel sau thay ??i
disp(['Gi� tr? pixel sau khi c?ng 25: ', num2str(squeeze(I_add(i, j, :))')]);
disp(['Gi� tr? pixel sau khi tr? 25: ', num2str(squeeze(I_sub(i, j, :))')]);
