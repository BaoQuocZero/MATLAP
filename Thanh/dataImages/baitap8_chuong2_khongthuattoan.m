% a. ??c ?nh f
f = imread('Fig0122(a)(fractal-iris).tif');  % ??c ?nh f

% N?u ?nh là ?nh màu, chuy?n thành ?nh xám
if size(f, 3) == 3
    f = rgb2gray(f);
end

% T?o ?nh h b?ng cách ??t 4 bit th?p c?a ?nh f b?ng 0
h = floor(f / 16) * 16;  % Chia f cho 16, sau ?ó nhân l?i v?i 16 ?? lo?i b? 4 bit th?p

% b. T?o ?nh g t? vi?c tr? hai ?nh f và h
g = f - h;  % Tr? ?nh f và h ?? t?o ?nh g

% c. Cân b?ng m?c xám c?a ?nh g
% 1. Tính histogram c?a ?nh g
n = zeros(1, 256);  % M?ng ch?a t?n su?t các m?c xám c?a ?nh g
[M, N] = size(g);  % L?y kích th??c c?a ?nh g

% Tính histogram c?a ?nh g
for row = 1:M
    for col = 1:N
        level = g(row, col);  % L?y giá tr? pixel c?a ?nh g
        n(level + 1) = n(level + 1) + 1;  % T?ng t?n su?t c?a m?c xám này
    end
end

% 2. Tính CDF (Cumulative Distribution Function) th? công
cdf = zeros(1, 256);  % M?ng ?? ch?a CDF
cdf(1) = n(1);  % CDF ban ??u

for i = 2:256
    cdf(i) = cdf(i - 1) + n(i);  % Tính t?ng tích l?y th? công
end

% 3. Chu?n hóa CDF ?? có giá tr? pixel m?i
% T?o CDF chu?n hóa
cdf_normalized = round((cdf - min(cdf)) / (M * N - min(cdf)) * 255);  % Chu?n hóa và chuy?n sang giá tr? 0-255

% 4. Áp d?ng CDF ?? chu?n hóa ?nh g
i = cdf_normalized(g + 1);  % Áp d?ng CDF ?? chu?n hóa ?nh g

% Hi?n th? k?t qu?
figure;

% Hi?n th? ?nh f, h, g và i
subplot(2, 2, 1), imshow(f), title('?nh f');
subplot(2, 2, 2), imshow(h), title('?nh h');
subplot(2, 2, 3), imshow(g), title('?nh g');
subplot(2, 2, 4), imshow(i), title('?nh i (cân b?ng m?c xám)');
