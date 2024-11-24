% ??c ?nh vào bi?n r
r = imread('Fig0304(a)(breast_digital_Xray).tif');

%Câu 2.1ab=================================================================

% C?p m?c xám c?a ?nh (L = 256 cho ?nh 8-bit)
L = 256;

% Th?c hi?n bi?n ??i âm b?n: sa = L - 1 - r
sa = L - 1 - r;

% Tính histogram c?a ?nh g?c và ?nh âm b?n
[counts_r, grayLevels_r] = imhist(r); % Histogram ?nh g?c
[counts_sa, grayLevels_sa] = imhist(sa); % Histogram ?nh âm b?n

% Hi?n th? histogram c?a ?nh g?c và ?nh âm b?n
figure;
subplot(1, 2, 1);
bar(grayLevels_r, counts_r);
xlabel('M?c xám');
ylabel('S? l??ng pixel');
title('Histogram ?nh g?c');

subplot(1, 2, 2);
bar(grayLevels_sa, counts_sa);
xlabel('M?c xám');
ylabel('S? l??ng pixel');
title('Histogram ?nh âm b?n');

%Câu 2.1cd=================================================================

% Ch?n ng??ng t = 127
t = 127;

% T?o ?nh nh? phân t? ?nh xám
B = r >= t;  % M?i pixel >= ng??ng t s? thành 1 (tr?ng), còn l?i thành 0 (?en)

% Chuy?n ?nh nh? phân v? ki?u uint8 ?? hi?n th?
% Duy?t t?ng pixel ?? t?o ?nh nh? phân
for i = 1:size(r, 1)  % Duy?t qua t?ng hàng
    for j = 1:size(r, 2)  % Duy?t qua t?ng c?t
        if r(i, j) >= t
            B(i, j) = 255;  % Pixel >= ng??ng t chuy?n thành 255 (tr?ng)
        else
            B(i, j) = 0;    % Pixel < ng??ng t chuy?n thành 0 (?en)
        end
    end
end

% Hi?n th? ?nh g?c và ?nh nh? phân trên m?t c?a s?
figure;
subplot(2, 2, 1);
imshow(r);
title('?nh xám g?c');

subplot(2, 2, 2);
imshow(sa);
title('?nh âm b?n');

subplot(2, 2, 3);
imshow(B);
title('?nh nh? phân v?i ng??ng t = 127');