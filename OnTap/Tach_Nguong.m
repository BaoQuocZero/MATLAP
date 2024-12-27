% ??c ?nh g?c
img = imread('cameraman.tif');

% T�ch ng??ng
T = 100; % Ng??ng (gi� tr? m?c x�m)
threshold_img = img > T; % T�ch ng??ng th�nh ?nh nh? ph�n 
% Pixel l?n h?n ho?c b?ng T ???c ??t th�nh 1 (ho?c gi� tr? t?i ?a), c�c pixel kh�c l� 0.

% Hi?n th? ?nh
figure;
subplot(1, 2, 1), imshow(img), title('?nh g?c');
subplot(1, 2, 2), imshow(threshold_img), title(['?nh t�ch ng??ng (T = ', num2str(T), ')']);
