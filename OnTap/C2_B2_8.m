% B??c 1: ??c ?nh f
f = imread('Fig0122(a)(fractal-iris).tif');

% Ki?m tra n?u ?nh không ph?i ?nh xám, chuy?n ??i
if size(f, 3) == 3
    f = rgb2gray(f);
end

% B??c 2: T?o ?nh h t? vi?c ??t 4 bit th?p c?a ?nh f b?ng 0
% ??t 4 bit th?p c?a ?nh f b?ng 0
h = bitset(f, 1, 0);  % ??t bit th?p th? 1 (LSB) = 0
h = bitset(h, 2, 0);  % ??t bit th?p th? 2 = 0
h = bitset(h, 3, 0);  % ??t bit th?p th? 3 = 0
h = bitset(h, 4, 0);  % ??t bit th?p th? 4 = 0

% B??c 3: T?o ?nh g t? phép tr? f và h
g = f - h;

% B??c 4: Cân b?ng m?c xám c?a ?nh g
i = histeq(g);  % S? d?ng hàm histeq ?? cân b?ng m?c xám c?a ?nh g

% Hi?n th? k?t qu?
figure;
subplot(2, 2, 1); imshow(f); title('?nh f');
subplot(2, 2, 2); imshow(h); title('?nh h (4 bit th?p c?a f b?ng 0)');
subplot(2, 2, 3); imshow(g); title('?nh g (f - h)');
subplot(2, 2, 4); imshow(i); title('?nh i (Cân b?ng m?c xám c?a g)');
