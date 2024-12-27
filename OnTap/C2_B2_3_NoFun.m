% ??c ?nh xám
i = imread('Fig0316(4)(bottom_left).tif');

% Ki?m tra n?u ?nh là RGB, chuy?n sang ?nh xám
if size(i, 3) == 3
    i = rgb2gray(i);
end

% Kích th??c ?nh
[N, M] = size(i); %N s? dòng, M s? c?t
L = 256;  % S? m?c xám

% B??c 1: Tính histogram g?c
hist_orig = zeros(1, L); %S? l?n xu?t hi?n c?a 1 m?c xám c? th?
for x = 1:N
    for y = 1:M
        hist_orig(i(x, y) + 1) = hist_orig(i(x, y) + 1) + 1;
    end
end

% B??c 2: Tính hàm tích l?y xác su?t (CDF)
cdf = zeros(1, L); %T?ng m?c xám tích l?y t? 0 ??n k
cdf(1) = hist_orig(1);
for k = 2:L
    cdf(k) = cdf(k-1) + hist_orig(k);
end
cdf = cdf / (N * M);  % Chu?n hóa CDF, sau khi chu?n hóa ta có t? l? xu?t hi?n c?a 1 m?c xám c? th?

% B??c 3: Ánh x? m?c xám m?i
s = round(cdf * (L - 1));  % Ánh x? CDF vào kho?ng 0–255, Hàm round ???c s? d?ng ?? làm tròn k?t qu? v? s? nguyên

% B??c 4: T?o ?nh sau cân b?ng
i_equalized = zeros(N, M, 'uint8');
for x = 1:N
    for y = 1:M
        i_equalized(x, y) = s(i(x, y) + 1);
    end
end

% Tính histogram sau cân b?ng
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
subplot(2, 2, 3); imshow(i_equalized); title('?nh sau cân b?ng');
subplot(2, 2, 4); bar(0:L-1, hist_equalized); title('Histogram sau cân b?ng');

% Hi?n th? k?t qu? không dùng bar
figure;
subplot(2, 2, 1); imshow(i); title('?nh g?c dùng imhist');
subplot(2, 2, 2); imhist(i); title('Histogram ?nh g?c');
subplot(2, 2, 3); imshow(i_equalized); title('?nh sau cân b?ng');
subplot(2, 2, 4); imhist(i_equalized); title('Histogram sau cân b?ng');