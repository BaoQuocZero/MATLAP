% a. ??c ?nh
i = imread('Fig0316(4)(bottom_left).tif');  % ??c ?nh v�o bi?n i
figure;
imshow(i);  % Hi?n th? ?nh g?c
title('?nh g?c');

% b. T�nh to�n histogram c?a ?nh th? c�ng
n = zeros(1, 256);  % M?ng ?? ch?a s? l?n xu?t hi?n c?a m?i m?c x�m t? 0 ??n 255
[M, N] = size(i);  % L?y k�ch th??c ?nh (M h�ng, N c?t)

for row = 1:M
    for col = 1:N
        level = i(row, col);  % L?y gi� tr? pixel t?i v? tr� (row, col)
        n(level + 1) = n(level + 1) + 1;  % T?ng t?n su?t cho m?c x�m n�y
    end
end

% c. T�nh CDF th? c�ng
cdf = zeros(1, 256);  % Kh?i t?o m?ng CDF
cdf(1) = n(1);  % CDF ban ??u b?ng t?n su?t c?a m?c x�m ??u ti�n

% T�nh t?ng t�ch l?y th? c�ng
for j = 2:256
    cdf(j) = cdf(j - 1) + n(j);  % C?ng d?n t?n su?t
end

% d. Chu?n h�a CDF v� t�nh c�c gi� tr? pixel m?i
L = 256;  % S? m?c x�m
cdf_min = min(cdf(cdf > 0));  % CDF nh? nh?t c� gi� tr? kh�c 0
cdf_normalized = (cdf - cdf_min) / (M * N - cdf_min);  % Chu?n h�a CDF

% e. T�nh to�n c�c gi� tr? pixel m?i t? CDF ?� chu?n h�a
new_i = uint8(zeros(M, N));  % Kh?i t?o ?nh m?i
for row = 1:M
    for col = 1:N
        level = i(row, col);  % L?y gi� tr? pixel c?
        new_i(row, col) = uint8(cdf_normalized(level + 1) * (L - 1));  % �p d?ng CDF ?? chu?n h�a gi� tr? pixel
    end
end

% f. Hi?n th? ?nh ?� c�n b?ng histogram
figure;
imshow(new_i);  % Hi?n th? ?nh sau khi c�n b?ng m?c x�m
title('?nh sau khi c�n b?ng m?c x�m');

% g. V? histogram c?a ?nh sau khi c�n b?ng m?c x�m
figure;
n_new = zeros(1, 256);  % M?ng ?? ch?a histogram c?a ?nh ?� c�n b?ng
for row = 1:M
    for col = 1:N
        level = new_i(row, col);  % L?y gi� tr? pixel sau khi bi?n ??i
        n_new(level + 1) = n_new(level + 1) + 1;  % T?ng t?n su?t cho m?c x�m n�y
    end
end
bar(0:255, n_new);  % V? histogram c?a ?nh ?� c�n b?ng
title('Histogram c?a ?nh sau khi c�n b?ng m?c x�m');
xlabel('M?c x�m');
ylabel('T?n su?t');
