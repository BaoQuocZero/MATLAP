% ??c ?nh x�m
img = imread('cameraman.tif');

% G?i h�m B2_ex
[averageVal, computationTime] = B2_ex(img);

% Hi?n th? k?t qu?
disp(['Gi� tr? trung b�nh c?ng c?a ?nh: ', num2str(averageVal)]);
disp(['Th?i gian t�nh to�n: ', num2str(computationTime), ' gi�y']);
