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
title('L??c ?? xám c?a ?nh');
