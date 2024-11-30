% ??c ?nh x�m
i = imread('Fig0316(4)(bottom_left).tif');

% Ki?m tra n?u ?nh l� RGB, chuy?n sang ?nh x�m
if size(i, 3) == 3
    i = rgb2gray(i);
end

% K�ch th??c ?nh
[N, M] = size(i); %N s? d�ng, M s? c?t
L = 256;  % S? m?c x�m

% B??c 1: T�nh histogram g?c
hist_orig = zeros(1, L); %S? l?n xu?t hi?n c?a 1 m?c x�m c? th?
for x = 1:N
    for y = 1:M
        hist_orig(i(x, y) + 1) = hist_orig(i(x, y) + 1) + 1;
    end
end

% B??c 2: T�nh h�m t�ch l?y x�c su?t (CDF)
cdf = zeros(1, L); %T?ng m?c x�m t�ch l?y t? 0 ??n k
cdf(1) = hist_orig(1);
for k = 2:L
    cdf(k) = cdf(k-1) + hist_orig(k);
end
cdf = cdf / (N * M);  % Chu?n h�a CDF, sau khi chu?n h�a ta c� t? l? xu?t hi?n c?a 1 m?c x�m c? th?

% B??c 3: �nh x? m?c x�m m?i
s = round(cdf * (L - 1));  % �nh x? CDF v�o kho?ng 0�255, H�m round ???c s? d?ng ?? l�m tr�n k?t qu? v? s? nguy�n

% B??c 4: T?o ?nh sau c�n b?ng
i_equalized = zeros(N, M, 'uint8');
for x = 1:N
    for y = 1:M
        i_equalized(x, y) = s(i(x, y) + 1);
    end
end

% T�nh histogram sau c�n b?ng
hist_equalized = zeros(1, L);
for x = 1:N
    for y = 1:M
        hist_equalized(i_equalized(x, y) + 1) = hist_equalized(i_equalized(x, y) + 1) + 1;
    end
end

% Hi?n th? k?t qu?
figure;
subplot(2, 2, 1); imshow(i); title('?nh g?c');
subplot(2, 2, 2); bar(0:L-1, hist_orig); title('Histogram g?c');
subplot(2, 2, 3); imshow(i_equalized); title('?nh sau c�n b?ng');
subplot(2, 2, 4); bar(0:L-1, hist_equalized); title('Histogram sau c�n b?ng');

% Hi?n th? k?t qu? kh�ng d�ng bar
figure;
subplot(2, 2, 1); imshow(i); title('?nh g?c d�ng imhist');
subplot(2, 2, 2); imhist(i); title('Histogram ?nh g?c');
subplot(2, 2, 3); imshow(i_equalized); title('?nh sau c�n b?ng');
subplot(2, 2, 4); imhist(i_equalized); title('Histogram sau c�n b?ng');