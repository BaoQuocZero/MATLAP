% ??c ?nh v�o
f = imread('Fig1005(a)(wirebond_mask).tif');

% Chuy?n ?nh sang ?nh x�m n?u ?nh l� ?nh m�u
if size(f, 3) == 3
    f = rgb2gray(f);
end

% K�ch th??c ?nh
[rows, cols] = size(f);

% B??c 1: L?c bi�n v?i m?t n? logarit
% T?o m?t n? logarit 3x3
log_mask = [-1 -1 -1; -1 8 -1; -1 -1 -1];  % M?t n? logarit

% T?o ?nh k?t qu? (m?i) v?i c�ng k�ch th??c ?nh g?c, kh?i t?o b?ng 0
g_log = zeros(rows, cols);

% Th?c hi?n ph�p to�n ch?p th? c�ng cho m?t n? logarit
for i = 2:rows-1
    for j = 2:cols-1
        % L?y v�ng ?nh 3x3
        region = f(i-1:i+1, j-1:j+1);
        % Th?c hi?n ph�p to�n ch?p (convolution) gi?a v�ng ?nh v� m?t n?
        g_log(i,j) = sum(sum(double(region) .* log_mask)); % Ph�p nh�n ma tr?n v� c?ng c�c ph?n t?
    end
end

% Chuy?n ?nh k?t qu? v? d?ng uint8
g_log = uint8(g_log);

% Hi?n th? ?nh sau khi l?c v?i m?t n? logarit
subplot(1, 2, 1);
imshow(g_log);
title('Bi�n v?i m?t n? logarit');

% B??c 2: L?c bi�n v?i ph??ng ph�p Canny
% S? d?ng h�m canny ?? ph�t hi?n bi�n
g_canny = edge(f, 'Canny');

% Hi?n th? ?nh sau khi ph�t hi?n bi�n b?ng Canny
subplot(1, 2, 2);
imshow(g_canny);
title('Bi�n v?i Canny');
