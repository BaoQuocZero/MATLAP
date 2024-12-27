% ??c ?nh
I = imread('Fig0316(4)(bottom_left).tif');

% Hi?n th? ?nh g?c
figure;
imshow(I);
title('?nh g?c');

% Tính toán histogram (l??c ?? xám)
[counts, grayLevels] = imhist(I);

% Hi?n th? histogram
figure;
bar(grayLevels, counts);
xlabel('M?c xám');
ylabel('S? l??ng pixel');
title('L??c ?? xám c?a ?nh g?c');

% Cân b?ng l??c ?? xám c?a ?nh
I_eq = histeq(I);

% Hi?n th? ?nh g?c và ?nh ?ã cân b?ng
figure;
subplot(1, 2, 1);
imshow(I);
title('?nh g?c');

subplot(1, 2, 2);
imshow(I_eq);
title('?nh sau khi cân b?ng m?c xám');

% Hi?n th? histogram c?a ?nh g?c và ?nh ?ã cân b?ng
figure;
subplot(1, 2, 1);
imhist(I);
title('Histogram c?a ?nh g?c');

subplot(1, 2, 2);
imhist(I_eq);
title('Histogram c?a ?nh sau khi cân b?ng');