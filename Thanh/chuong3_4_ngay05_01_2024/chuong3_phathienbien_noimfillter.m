% ??c ?nh vào
f = imread('Fig1005(a)(wirebond_mask).tif');

% Chuy?n ?nh sang ?nh xám n?u ?nh là ?nh màu
if size(f, 3) == 3
    f = rgb2gray(f);
end

% Kích th??c ?nh
[rows, cols] = size(f);

% M?t n? phát hi?n biên ngang (vertical edge)
w1 = [-1 -1 -1; 2 2 2; -1 -1 -1];  % M?t n? phát hi?n biên ngang

% T?o ?nh k?t qu? (m?i) v?i cùng kích th??c ?nh g?c, kh?i t?o b?ng 0
g1 = zeros(rows, cols);

% Th?c hi?n phép toán ch?p th? công cho m?t n? w1
for i = 2:rows-1
    for j = 2:cols-1
        % L?y vùng ?nh 3x3
        region = f(i-1:i+1, j-1:j+1);
        % Th?c hi?n phép toán ch?p (convolution) gi?a vùng ?nh và m?t n?
        g1(i,j) = sum(sum(double(region) .* w1)); % Phép nhân ma tr?n và c?ng các ph?n t?
    end
end

% Chuy?n ?nh k?t qu? v? d?ng uint8
g1 = uint8(g1);

% Hi?n th? ?nh g?c và ?nh sau khi l?c
subplot(2,2,1);
imshow(f);
title('?nh g?c');

subplot(2,2,2);
imshow(g1);
title('Biên theo h??ng ngang (t? ch?p)');

% M?t n? phát hi?n biên theo h??ng d?c (horizontal edge)
w2 = [-1 2 -1; -1 2 -1; -1 2 -1];  % M?t n? phát hi?n biên d?c

% T?o ?nh k?t qu? cho m?t n? w2
g2 = zeros(rows, cols);

% Th?c hi?n phép toán ch?p th? công cho m?t n? w2
for i = 2:rows-1
    for j = 2:cols-1
        % L?y vùng ?nh 3x3
        region = f(i-1:i+1, j-1:j+1);
        % Th?c hi?n phép toán ch?p gi?a vùng ?nh và m?t n?
        g2(i,j) = sum(sum(double(region) .* w2)); % Phép nhân ma tr?n và c?ng các ph?n t?
    end
end

% Chuy?n ?nh k?t qu? v? d?ng uint8
g2 = uint8(g2);

% Hi?n th? ?nh sau khi l?c v?i m?t n? d?c
subplot(2,2,3);
imshow(g2);
title('Biên theo h??ng d?c (t? ch?p)');

% M?t n? phát hi?n biên theo góc +450
w3 = [0 0 -1; 0 2 0; 1 0 0];  % M?t n? phát hi?n biên góc +450

% T?o ?nh k?t qu? cho m?t n? w3
g3 = zeros(rows, cols);

% Th?c hi?n phép toán ch?p th? công cho m?t n? w3
for i = 2:rows-1
    for j = 2:cols-1
        % L?y vùng ?nh 3x3
        region = f(i-1:i+1, j-1:j+1);
        % Th?c hi?n phép toán ch?p gi?a vùng ?nh và m?t n?
        g3(i,j) = sum(sum(double(region) .* w3)); % Phép nhân ma tr?n và c?ng các ph?n t?
    end
end

% Chuy?n ?nh k?t qu? v? d?ng uint8
g3 = uint8(g3);

% Hi?n th? ?nh sau khi l?c v?i m?t n? +450
subplot(2,2,4);
imshow(g3);
title('Biên theo góc +450 (t? ch?p)');
