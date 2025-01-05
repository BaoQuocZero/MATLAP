% ??c ?nh vào
f = imread('Fig1005(a)(wirebond_mask).tif');

% Chuy?n ?nh sang ?nh xám n?u ?nh là ?nh màu
if size(f, 3) == 3
    f = rgb2gray(f);
end

% M?t n? 3x3 cho phát hi?n biên theo ph??ng ngang (vertical edges)
w1 = [-1 -1 -1; 2 2 2; -1 -1 -1];  % M?t n? phát hi?n biên ngang

% Th?c hi?n l?c ?nh v?i m?t n? w1
g1 = imfilter(f, w1);

% Hi?n th? ?nh g?c và ?nh sau khi l?c
subplot(2,2,1);
imshow(f);
title('?nh g?c');

subplot(2,2,2);
imshow(g1);
title('Biên theo h??ng ngang');

% M?t n? phát hi?n biên theo h??ng d?c (horizontal edges)
w2 = [-1 2 -1; -1 2 -1; -1 2 -1];  % M?t n? phát hi?n biên d?c

% Th?c hi?n l?c ?nh v?i m?t n? w2
g2 = imfilter(f, w2);

% Hi?n th? ?nh sau khi l?c v?i m?t n? d?c
subplot(2,2,3);
imshow(g2);
title('Biên theo h??ng d?c');

% M?t n? phát hi?n biên theo góc +450
w3 = [0 0 -1; 0 2 0; 1 0 0];  % M?t n? phát hi?n biên góc +450

% Th?c hi?n l?c ?nh v?i m?t n? w3
g3 = imfilter(f, w3);

% Hi?n th? ?nh sau khi l?c v?i m?t n? +450
subplot(2,2,4);
imshow(g3);
title('Biên theo góc +450');
