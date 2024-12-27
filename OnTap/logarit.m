% ??c ?nh g?c
img = imread('cameraman.tif');
img = im2double(img); % Chuy?n ??i sang ki?u double

% Bi?n ??i logarit
c = 1; % H?ng s? t? l?
log_img = c * log(1 + img);

% Hi?n th? ?nh
figure;
subplot(1, 2, 1), imshow(img), title('?nh g?c');
subplot(1, 2, 2), imshow(log_img), title('?nh bi?n ??i logarit');
