r = imread('Fig0304(a)(breast_digital_Xray).tif');
imshow(r);


figure;
imhist(r);% H�m imhist v? histogram
title('Histogram M?c X�m C?a ?nh');
xlabel('Gi� tr? m?c x�m');
ylabel('S? l??ng pixel');


% L?y s? c?p m?c x�m L (??i v?i ?nh 8-bit, L = 256)
L = 256;

Sa = L - 1 - r;

figure;
subplot(1,2,1);
imshow(r);
subplot(1,2,2);
imshow(Sa);
title('?nh �m b?n');


% so s�nh 2 c�i l??c ?? 
figure;
subplot(1,2,1);
imhist(r);% H�m imhist v? histogram
title('Histogram M?c X�m C?a ?nh');
xlabel('Gi� tr? m?c x�m');
ylabel('S? l??ng pixel');

subplot(1,2,2);
imhist(Sa);% H�m imhist v? histogram
title('Histogram M?c X�m C?a ?nh');
xlabel('Gi� tr? m?c x�m');
ylabel('S? l??ng pixel');



% Hi?n th? ?nh nh? ph�n
% ng??ng t=127, chuy?n ?nh nh? ph�n
t = 127;
anhnhiphan = r >= t;
anhnhiphan = uint8(anhnhiphan * 255); 
figure;
imshow(anhnhiphan);
title(['?nh nh? ph�n v?i ng??ng t = ', num2str(t)]);




