% a. ??c ?nh f
f = imread('Fig0122(a)(fractal-iris).tif');  % ??c ?nh f

% N?u ?nh l� ?nh m�u, chuy?n th�nh ?nh x�m
if size(f, 3) == 3
    f = rgb2gray(f);
end

% T?o ?nh h b?ng c�ch ??t 4 bit th?p c?a ?nh f b?ng 0
h = floor(f / 16) * 16;  % Chia f cho 16, sau ?� nh�n l?i v?i 16 ?? lo?i b? 4 bit th?p

% b. T?o ?nh g t? vi?c tr? hai ?nh f v� h
g = f - h;  % Tr? ?nh f v� h ?? t?o ?nh g

% c. C�n b?ng m?c x�m c?a ?nh g
% 1. T�nh histogram c?a ?nh g
n = zeros(1, 256);  % M?ng ch?a t?n su?t c�c m?c x�m c?a ?nh g
[M, N] = size(g);  % L?y k�ch th??c c?a ?nh g

% T�nh histogram c?a ?nh g
for row = 1:M
    for col = 1:N
        level = g(row, col);  % L?y gi� tr? pixel c?a ?nh g
        n(level + 1) = n(level + 1) + 1;  % T?ng t?n su?t c?a m?c x�m n�y
    end
end

% 2. T�nh CDF (Cumulative Distribution Function) th? c�ng
cdf = zeros(1, 256);  % M?ng ?? ch?a CDF
cdf(1) = n(1);  % CDF ban ??u

for i = 2:256
    cdf(i) = cdf(i - 1) + n(i);  % T�nh t?ng t�ch l?y th? c�ng
end

% 3. Chu?n h�a CDF ?? c� gi� tr? pixel m?i
% T?o CDF chu?n h�a
cdf_normalized = round((cdf - min(cdf)) / (M * N - min(cdf)) * 255);  % Chu?n h�a v� chuy?n sang gi� tr? 0-255

% 4. �p d?ng CDF ?? chu?n h�a ?nh g
i = cdf_normalized(g + 1);  % �p d?ng CDF ?? chu?n h�a ?nh g

% Hi?n th? k?t qu?
figure;

% Hi?n th? ?nh f, h, g v� i
subplot(2, 2, 1), imshow(f), title('?nh f');
subplot(2, 2, 2), imshow(h), title('?nh h');
subplot(2, 2, 3), imshow(g), title('?nh g');
subplot(2, 2, 4), imshow(i), title('?nh i (c�n b?ng m?c x�m)');
