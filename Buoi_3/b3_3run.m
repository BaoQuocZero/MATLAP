% T?o ma tr?n v� d?
img = [3 5 9; 2 8 4; 7 1 6];
% ho?c ?nh
image = imread('cameraman.tif');

% Ch?n h�ng mu?n ki?m tra (v� d?: h�ng 2)
r = 2;

% G?i h�m
[minValue, minColumn] = b3_3(image, r);

% Hi?n th? k?t qu?
fprintf('Gi� tr? nh? nh?t tr�n h�ng %d l� %d t?i c?t %d.\n', r, minValue, minColumn);