% a. ??c ?nh g?c
r = imread('Fig0304(a)(breast_digital_Xray).tif');  % ??c ?nh g?c (dùng hàm imread)

% b. Phân tích s? phân b? m?c xám c?a ?nh
% V? histogram c?a ?nh g?c
figure;
subplot(1,2,1);
imhist(r);  % Dùng imhist ?? tính và v? histogram c?a ?nh g?c
title('Histogram c?a ?nh g?c');
xlabel('M?c xám');
ylabel('T?n su?t');

% c. Bi?n ??i âm b?n ?nh: Sa = L - 1 - r
L = 256;  % L là s? m?c xám (?nh 8-bit)
sa = L - 1 - r;  % Bi?n ??i âm b?n ?nh

% V? histogram c?a ?nh âm b?n
subplot(1,2,2);
imhist(sa);  % Dùng imhist ?? tính và v? histogram c?a ?nh âm b?n
title('Histogram c?a ?nh âm b?n');
xlabel('M?c xám');
ylabel('T?n su?t');

% d. T?o ?nh nh? phân v?i ng??ng t = 127
t = 127;  % Ng??ng
binary_image = r >= t;  % T?o ?nh nh? phân, pixel l?n h?n ho?c b?ng ng??ng s? là 1 (tr?ng), còn l?i là 0 (?en)

% Hi?n th? ?nh nh? phân
figure;
imshow(binary_image);  % Hi?n th? ?nh nh? phân
title('?nh nh? phân v?i ng??ng t = 127');
