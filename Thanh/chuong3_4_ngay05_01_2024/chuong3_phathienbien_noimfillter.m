% ??c ?nh v�o
f = imread('Fig1005(a)(wirebond_mask).tif');

% Chuy?n ?nh sang ?nh x�m n?u ?nh l� ?nh m�u
if size(f, 3) == 3
    f = rgb2gray(f);
end

% K�ch th??c ?nh
[rows, cols] = size(f);

% M?t n? ph�t hi?n bi�n ngang (vertical edge)
w1 = [-1 -1 -1; 2 2 2; -1 -1 -1];  % M?t n? ph�t hi?n bi�n ngang

% T?o ?nh k?t qu? (m?i) v?i c�ng k�ch th??c ?nh g?c, kh?i t?o b?ng 0
g1 = zeros(rows, cols);

% Th?c hi?n ph�p to�n ch?p th? c�ng cho m?t n? w1
for i = 2:rows-1
    for j = 2:cols-1
        % L?y v�ng ?nh 3x3
        region = f(i-1:i+1, j-1:j+1);
        % Th?c hi?n ph�p to�n ch?p (convolution) gi?a v�ng ?nh v� m?t n?
        g1(i,j) = sum(sum(double(region) .* w1)); % Ph�p nh�n ma tr?n v� c?ng c�c ph?n t?
    end
end

% Chuy?n ?nh k?t qu? v? d?ng uint8
g1 = uint8(g1);

% Hi?n th? ?nh g?c v� ?nh sau khi l?c
subplot(2,2,1);
imshow(f);
title('?nh g?c');

subplot(2,2,2);
imshow(g1);
title('Bi�n theo h??ng ngang (t? ch?p)');

% M?t n? ph�t hi?n bi�n theo h??ng d?c (horizontal edge)
w2 = [-1 2 -1; -1 2 -1; -1 2 -1];  % M?t n? ph�t hi?n bi�n d?c

% T?o ?nh k?t qu? cho m?t n? w2
g2 = zeros(rows, cols);

% Th?c hi?n ph�p to�n ch?p th? c�ng cho m?t n? w2
for i = 2:rows-1
    for j = 2:cols-1
        % L?y v�ng ?nh 3x3
        region = f(i-1:i+1, j-1:j+1);
        % Th?c hi?n ph�p to�n ch?p gi?a v�ng ?nh v� m?t n?
        g2(i,j) = sum(sum(double(region) .* w2)); % Ph�p nh�n ma tr?n v� c?ng c�c ph?n t?
    end
end

% Chuy?n ?nh k?t qu? v? d?ng uint8
g2 = uint8(g2);

% Hi?n th? ?nh sau khi l?c v?i m?t n? d?c
subplot(2,2,3);
imshow(g2);
title('Bi�n theo h??ng d?c (t? ch?p)');

% M?t n? ph�t hi?n bi�n theo g�c +450
w3 = [0 0 -1; 0 2 0; 1 0 0];  % M?t n? ph�t hi?n bi�n g�c +450

% T?o ?nh k?t qu? cho m?t n? w3
g3 = zeros(rows, cols);

% Th?c hi?n ph�p to�n ch?p th? c�ng cho m?t n? w3
for i = 2:rows-1
    for j = 2:cols-1
        % L?y v�ng ?nh 3x3
        region = f(i-1:i+1, j-1:j+1);
        % Th?c hi?n ph�p to�n ch?p gi?a v�ng ?nh v� m?t n?
        g3(i,j) = sum(sum(double(region) .* w3)); % Ph�p nh�n ma tr?n v� c?ng c�c ph?n t?
    end
end

% Chuy?n ?nh k?t qu? v? d?ng uint8
g3 = uint8(g3);

% Hi?n th? ?nh sau khi l?c v?i m?t n? +450
subplot(2,2,4);
imshow(g3);
title('Bi�n theo g�c +450 (t? ch?p)');
