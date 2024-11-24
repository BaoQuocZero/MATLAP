% a. ??c ?nh
i = imread('Fig0316(4)(bottom_left).tif');  % ??c ?nh vào bi?n i
figure;
imshow(i);  % Hi?n th? ?nh g?c
title('?nh g?c');

% b. Tính toán histogram c?a ?nh th? công
n = zeros(1, 256);  % M?ng ?? ch?a s? l?n xu?t hi?n c?a m?i m?c xám t? 0 ??n 255
[M, N] = size(i);  % L?y kích th??c ?nh (M hàng, N c?t)

for row = 1:M
    for col = 1:N
        level = i(row, col);  % L?y giá tr? pixel t?i v? trí (row, col)
        n(level + 1) = n(level + 1) + 1;  % T?ng t?n su?t cho m?c xám này
    end
end

% c. Tính CDF th? công
cdf = zeros(1, 256);  % Kh?i t?o m?ng CDF
cdf(1) = n(1);  % CDF ban ??u b?ng t?n su?t c?a m?c xám ??u tiên

% Tính t?ng tích l?y th? công
for j = 2:256
    cdf(j) = cdf(j - 1) + n(j);  % C?ng d?n t?n su?t
end

% d. Chu?n hóa CDF và tính các giá tr? pixel m?i
L = 256;  % S? m?c xám
cdf_min = min(cdf(cdf > 0));  % CDF nh? nh?t có giá tr? khác 0
cdf_normalized = (cdf - cdf_min) / (M * N - cdf_min);  % Chu?n hóa CDF

% e. Tính toán các giá tr? pixel m?i t? CDF ?ã chu?n hóa
new_i = uint8(zeros(M, N));  % Kh?i t?o ?nh m?i
for row = 1:M
    for col = 1:N
        level = i(row, col);  % L?y giá tr? pixel c?
        new_i(row, col) = uint8(cdf_normalized(level + 1) * (L - 1));  % Áp d?ng CDF ?? chu?n hóa giá tr? pixel
    end
end

% f. Hi?n th? ?nh ?ã cân b?ng histogram
figure;
imshow(new_i);  % Hi?n th? ?nh sau khi cân b?ng m?c xám
title('?nh sau khi cân b?ng m?c xám');

% g. V? histogram c?a ?nh sau khi cân b?ng m?c xám
figure;
n_new = zeros(1, 256);  % M?ng ?? ch?a histogram c?a ?nh ?ã cân b?ng
for row = 1:M
    for col = 1:N
        level = new_i(row, col);  % L?y giá tr? pixel sau khi bi?n ??i
        n_new(level + 1) = n_new(level + 1) + 1;  % T?ng t?n su?t cho m?c xám này
    end
end
bar(0:255, n_new);  % V? histogram c?a ?nh ?ã cân b?ng
title('Histogram c?a ?nh sau khi cân b?ng m?c xám');
xlabel('M?c xám');
ylabel('T?n su?t');
