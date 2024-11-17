% ??c ?nh
I = imread('Fig0122(a)(fractal-iris).tif');

% Ki?m tra n?u ?nh không ph?i ?nh xám, chuy?n ??i
if size(I, 3) == 3
    I = rgb2gray(I);  % Chuy?n ?nh màu sang ?nh xám n?u c?n
end

% T?o ?nh t? bit plane th? 3
bit_plane = 3;
I3 = bitget(I, bit_plane);
bit_plane = 6;
I6 = bitget(I, bit_plane);

% Hi?n th? ?nh g?c và ?nh t? bit plane th? 3
figure;
subplot(2, 2, 1);
imshow(I);
title('?nh g?c');

subplot(2, 2, 2);
imshow(I3, []);
title(['Bit plane th? 3']);
subplot(2, 2, 3);
imshow(I3, []);
title(['Bit plane th? 6']);
