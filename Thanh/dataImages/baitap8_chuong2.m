% a. ??c ?nh f
f = imread('Fig0122(a)(fractal-iris).tif');  % ??c ?nh f

% N?u ?nh là ?nh màu, chuy?n thành ?nh xám
if size(f, 3) == 3
    f = rgb2gray(f);
end

% T?o ?nh h b?ng cách ??t 4 bit th?p c?a ?nh f b?ng 0
mask = 240;  % 11110000 trong h? nh? phân, t??ng ?ng v?i giá tr? 240
h = bitand(f, mask);  % Áp d?ng phép AND ?? gi? 4 bit cao

% b. T?o ?nh g t? vi?c tr? hai ?nh f và h
g = f - h;  % Tr? ?nh f và h ?? t?o ?nh g

% c. Cân b?ng m?c xám c?a ?nh g
% S? d?ng ph??ng pháp cân b?ng histogram
i = histeq(g);  % Cân b?ng m?c xám c?a ?nh g

% Hi?n th? k?t qu?
figure;

% Hi?n th? ?nh f, h, g và i
subplot(2, 2, 1), imshow(f), title('?nh f');
subplot(2, 2, 2), imshow(h), title('?nh h');
subplot(2, 2, 3), imshow(g), title('?nh g');
subplot(2, 2, 4), imshow(i), title('?nh i (cân b?ng m?c xám)');
