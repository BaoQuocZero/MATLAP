r = imread('Fig0304(a)(breast_digital_Xray).tif');
imshow(r);


figure;
imhist(r);% Hàm imhist v? histogram
title('Histogram M?c Xám C?a ?nh');
xlabel('Giá tr? m?c xám');
ylabel('S? l??ng pixel');


% L?y s? c?p m?c xám L (??i v?i ?nh 8-bit, L = 256)
L = 256;

Sa = L - 1 - r;

figure;
subplot(1,2,1);
imshow(r);
subplot(1,2,2);
imshow(Sa);
title('?nh âm b?n');


% so sánh 2 cái l??c ?? 
figure;
subplot(1,2,1);
imhist(r);% Hàm imhist v? histogram
title('Histogram M?c Xám C?a ?nh');
xlabel('Giá tr? m?c xám');
ylabel('S? l??ng pixel');

subplot(1,2,2);
imhist(Sa);% Hàm imhist v? histogram
title('Histogram M?c Xám C?a ?nh');
xlabel('Giá tr? m?c xám');
ylabel('S? l??ng pixel');



% Hi?n th? ?nh nh? phân
% ng??ng t=127, chuy?n ?nh nh? phân
t = 127;
anhnhiphan = r >= t;
anhnhiphan = uint8(anhnhiphan * 255); 
figure;
imshow(anhnhiphan);
title(['?nh nh? phân v?i ng??ng t = ', num2str(t)]);




