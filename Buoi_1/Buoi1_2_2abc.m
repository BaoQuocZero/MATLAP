% ??c ?nh v�o bi?n I
I = imread('Fig0122(a)(fractal-iris).tif');

% Ki?m tra n?u ?nh kh�ng ph?i ?nh x�m, chuy?n ??i
if size(I, 3) == 3
    I = rgb2gray(I);  % Chuy?n ?nh m�u sang ?nh x�m n?u c?n
end

% T?o ?nh i3 t? bit plane th? 3 c?a ?nh I
bit_plane_3 = 3;
I3 = bitget(I, bit_plane_3);

% T?o ?nh i6 t? bit plane th? 6 c?a ?nh I
bit_plane_6 = 6;
I6 = bitget(I, bit_plane_6);

% Truy xu?t bit plane th? 7 v� th? 8
bit_plane_7 = bitget(I, 7);  % L?y bit th? 7
bit_plane_8 = bitget(I, 8);  % L?y bit th? 8

% T?o ?nh i78 b?ng c�ch k?t h?p bit th? 7 v� 8
i78 = bitset(zeros(size(I)), 7, bit_plane_7);  % ??t bit th? 7 c?a ?nh m?i
i78 = bitset(i78, 8, bit_plane_8);             % ??t bit th? 8 c?a ?nh m?i

% Hi?n th? ?nh g?c v� ?nh t? bit plane th? 3
figure;
subplot(2, 2, 1); imshow(I);
title('?nh g?c');

subplot(2, 2, 2); imshow(I3, []);  % Hi?n th? ?nh i3 (bit plane th? 3)
title('Bit plane th? 3');

% Hi?n th? ?nh t? bit plane th? 6
subplot(2, 2, 3); imshow(I6, []);  % Hi?n th? ?nh i6 (bit plane th? 6)
title('Bit plane th? 6');

% Hi?n th? ?nh t? bit plane th? 7 v� 8
subplot(2, 2, 4); imshow(i78, []);  % Hi?n th? ?nh i78 (bit plane th? 7 v� 8)
title('?nh i78 (Bit plane th? 7 v� 8)');