% ??c ?nh
img = imread('Fig0316(4)(bottom_left).tif');  % Thay 'image.jpg' b?ng ???ng d?n ?nh c?a b?n

% N?u ?nh là ?nh màu, chuy?n sang ?nh xám
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Cân b?ng histogram s? d?ng hàm histeq
new_img = histeq(img);

% Hi?n th? ?nh g?c và ?nh sau khi cân b?ng histogram
subplot(1, 2, 1);
imshow(img);
title('?nh g?c');

subplot(1, 2, 2);
imshow(new_img);
title('?nh sau khi cân b?ng histogram');

% V? histogram tr??c và sau khi cân b?ng
figure;
subplot(1, 2, 1);
imhist(img);
title('Histogram g?c');

subplot(1, 2, 2);
imhist(new_img);
title('Histogram sau khi cân b?ng');
