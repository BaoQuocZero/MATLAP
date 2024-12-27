% ??c ?nh
I = imread('Fig0304(a)(breast_digital_Xray).tif');
% Hi?n th? ?nh g?c
imshow(I);
title('?nh g?c');
% Tính toán histogram
[counts, grayLevels] = imhist(I);

% Hi?n th? histogram
figure;
bar(grayLevels, counts);
xlabel('Muc xam');
ylabel('So luong pixel');
title('Histogram cua anh');
% Tính các ??c tr?ng th?ng kê
mean_gray = mean(I(:));  % Trung bình
std_gray = std(double(I(:)));  % ?? l?ch chu?n
min_gray = min(I(:));  % Giá tr? m?c xám nh? nh?t
max_gray = max(I(:));  % Giá tr? m?c xám l?n nh?t

% In k?t qu?
disp(['Trung bình m?c xám: ', num2str(mean_gray)]);
disp(['?? l?ch chu?n m?c xám: ', num2str(std_gray)]);
disp(['M?c xám nh? nh?t: ', num2str(min_gray)]);
disp(['M?c xám l?n nh?t: ', num2str(max_gray)]);

