% ??c ?nh
I = imread('Fig0316(4)(bottom_left).tif');

% Hi?n th? ?nh g?c
figure;
imshow(I);
title('?nh g?c');

% T�nh to�n histogram (l??c ?? x�m)
[counts, grayLevels] = imhist(I);

% Hi?n th? histogram
figure;
bar(grayLevels, counts);
xlabel('M?c x�m');
ylabel('S? l??ng pixel');
title('L??c ?? x�m c?a ?nh');
