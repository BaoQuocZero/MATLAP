% a. ??c ?nh f
f = imread('Fig0122(a)(fractal-iris).tif');  % ??c ?nh f

% N?u ?nh l� ?nh m�u, chuy?n th�nh ?nh x�m
if size(f, 3) == 3
    f = rgb2gray(f);
end

% T?o ?nh h b?ng c�ch ??t 4 bit th?p c?a ?nh f b?ng 0
mask = 240;  % 11110000 trong h? nh? ph�n, t??ng ?ng v?i gi� tr? 240
h = bitand(f, mask);  % �p d?ng ph�p AND ?? gi? 4 bit cao

% b. T?o ?nh g t? vi?c tr? hai ?nh f v� h
g = f - h;  % Tr? ?nh f v� h ?? t?o ?nh g

% c. C�n b?ng m?c x�m c?a ?nh g
% S? d?ng ph??ng ph�p c�n b?ng histogram
i = histeq(g);  % C�n b?ng m?c x�m c?a ?nh g

% Hi?n th? k?t qu?
figure;

% Hi?n th? ?nh f, h, g v� i
subplot(2, 2, 1), imshow(f), title('?nh f');
subplot(2, 2, 2), imshow(h), title('?nh h');
subplot(2, 2, 3), imshow(g), title('?nh g');
subplot(2, 2, 4), imshow(i), title('?nh i (c�n b?ng m?c x�m)');
