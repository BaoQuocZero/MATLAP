% ??c ?nh g?c
img = imread('cameraman.tif');
img = im2double(img); % Chuy?n ??i sang ki?u double

% Bi?n ??i l?y th?a
gamma = 0.5; % Giá tr? gamma
c = 1; % H?ng s? t? l?
power_img = c * img.^gamma; % T?t c? ph?n t? c?a img s? có m? là gamma, img^gamma

% Hi?n th? ?nh
figure;
subplot(1, 2, 1), imshow(img), title('?nh g?c');
subplot(1, 2, 2), imshow(power_img), title(['?nh bi?n ??i l?y th?a (\gamma = ', num2str(gamma), ')']);