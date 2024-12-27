% T?o ma tr?n ví d?
img = [3 5 9; 2 8 4; 7 1 6];
% ho?c ?nh
image = imread('cameraman.tif');

% Ch?n hàng mu?n ki?m tra (ví d?: hàng 2)
r = 2;

% G?i hàm
[minValue, minColumn] = b3_3(image, r);

% Hi?n th? k?t qu?
fprintf('Giá tr? nh? nh?t trên hàng %d là %d t?i c?t %d.\n', r, minValue, minColumn);