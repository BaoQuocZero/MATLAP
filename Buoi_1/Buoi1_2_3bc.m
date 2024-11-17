% ??c ?nh g?c
I = imread('Fig0316(4)(bottom_left).tif');

% C�n b?ng l??c ?? x�m c?a ?nh
I_eq = histeq(I);

% Hi?n th? ?nh g?c v� ?nh ?� c�n b?ng
figure;
subplot(1, 2, 1);
imshow(I);
title('?nh g?c');

subplot(1, 2, 2);
imshow(I_eq);
title('?nh sau khi c�n b?ng m?c x�m');

% Hi?n th? histogram c?a ?nh g?c v� ?nh ?� c�n b?ng
figure;
subplot(1, 2, 1);
imhist(I);
title('Histogram c?a ?nh g?c');

subplot(1, 2, 2);
imhist(I_eq);
title('Histogram c?a ?nh sau khi c�n b?ng');
