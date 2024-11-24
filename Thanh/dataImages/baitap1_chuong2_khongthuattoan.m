% a. ??c ?nh g?c
r = imread('Fig0304(a)(breast_digital_Xray).tif');  % ??c ?nh g?c (d�ng h�m imread)

% b. Ph�n t�ch s? ph�n b? m?c x�m c?a ?nh
% V? histogram c?a ?nh g?c
figure;
subplot(1,2,1);
imhist(r);  % D�ng imhist ?? t�nh v� v? histogram c?a ?nh g?c
title('Histogram c?a ?nh g?c');
xlabel('M?c x�m');
ylabel('T?n su?t');

% c. Bi?n ??i �m b?n ?nh: Sa = L - 1 - r
L = 256;  % L l� s? m?c x�m (?nh 8-bit)
sa = L - 1 - r;  % Bi?n ??i �m b?n ?nh

% V? histogram c?a ?nh �m b?n
subplot(1,2,2);
imhist(sa);  % D�ng imhist ?? t�nh v� v? histogram c?a ?nh �m b?n
title('Histogram c?a ?nh �m b?n');
xlabel('M?c x�m');
ylabel('T?n su?t');

% d. T?o ?nh nh? ph�n v?i ng??ng t = 127
t = 127;  % Ng??ng
binary_image = r >= t;  % T?o ?nh nh? ph�n, pixel l?n h?n ho?c b?ng ng??ng s? l� 1 (tr?ng), c�n l?i l� 0 (?en)

% Hi?n th? ?nh nh? ph�n
figure;
imshow(binary_image);  % Hi?n th? ?nh nh? ph�n
title('?nh nh? ph�n v?i ng??ng t = 127');
