% ??c ?nh xám
img = imread('cameraman.tif');

% G?i hàm B2_ex
[averageVal, computationTime] = B2_ex(img);

% Hi?n th? k?t qu?
disp(['Giá tr? trung bình c?ng c?a ?nh: ', num2str(averageVal)]);
disp(['Th?i gian tính toán: ', num2str(computationTime), ' giây']);
