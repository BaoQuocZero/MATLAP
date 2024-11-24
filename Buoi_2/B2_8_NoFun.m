% ??c ?nh f
f = imread('Fig0122(a)(fractal-iris).tif');

% a. T?o ?nh h b?ng cách ??t 4 plane bit th?p c?a ?nh f b?ng 0
h = bitset(f, 1, 0); % ??t bit 1 b?ng 0
h = bitset(h, 2, 0); % ??t bit 2 b?ng 0
h = bitset(h, 3, 0); % ??t bit 3 b?ng 0
h = bitset(h, 4, 0); % ??t bit 4 b?ng 0

% b. T?o ?nh g t? phép tr? f - h s? d?ng vòng l?p
[M, N] = size(f);  % Kích th??c ?nh
g = zeros(M, N, 'uint8');  % Kh?i t?o ?nh g v?i kích th??c gi?ng f và h

for x = 1:M
    for y = 1:N
        g(x, y) = f(x, y) - h(x, y);  % Phép tr? t?ng pixel
    end
end

% c. T?o ?nh i t? vi?c cân b?ng m?c xám c?a ?nh g
i = histeq(g); % Cân b?ng histogram c?a ?nh g

% Hi?n th? các ?nh
figure;

subplot(2, 2, 1);
imshow(f);
title('?nh g?c f');

subplot(2, 2, 2);
imshow(h);
title('?nh h (4 plane bit th?p = 0)');

subplot(2, 2, 3);
imshow(g);
title('?nh g (f - h)');

subplot(2, 2, 4);
imshow(i);
title('?nh i (Cân b?ng m?c xám c?a g)');