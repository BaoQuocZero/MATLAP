% ??c ?nh vào
f = imread('Fig1005(a)(wirebond_mask).tif');

% Chuy?n ?nh sang ?nh xám n?u ?nh là ?nh màu
if size(f, 3) == 3
    f = rgb2gray(f);
end

% Kích th??c ?nh
[rows, cols] = size(f);

% B??c 1: L?c biên v?i m?t n? logarit
% T?o m?t n? logarit 3x3
log_mask = [-1 -1 -1; -1 8 -1; -1 -1 -1];  % M?t n? logarit

% T?o ?nh k?t qu? (m?i) v?i cùng kích th??c ?nh g?c, kh?i t?o b?ng 0
g_log = zeros(rows, cols);

% Th?c hi?n phép toán ch?p th? công cho m?t n? logarit
for i = 2:rows-1
    for j = 2:cols-1
        % L?y vùng ?nh 3x3
        region = f(i-1:i+1, j-1:j+1);
        % Th?c hi?n phép toán ch?p (convolution) gi?a vùng ?nh và m?t n?
        g_log(i,j) = sum(sum(double(region) .* log_mask)); % Phép nhân ma tr?n và c?ng các ph?n t?
    end
end

% Chuy?n ?nh k?t qu? v? d?ng uint8
g_log = uint8(g_log);

% Hi?n th? ?nh sau khi l?c v?i m?t n? logarit
subplot(1, 2, 1);
imshow(g_log);
title('Biên v?i m?t n? logarit');

% B??c 2: L?c biên v?i ph??ng pháp Canny
% S? d?ng hàm canny ?? phát hi?n biên
g_canny = edge(f, 'Canny');

% Hi?n th? ?nh sau khi phát hi?n biên b?ng Canny
subplot(1, 2, 2);
imshow(g_canny);
title('Biên v?i Canny');
