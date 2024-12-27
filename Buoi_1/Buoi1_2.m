% ??c ?nh
I = imread('Fig0304(a)(breast_digital_Xray).tif');
% Hi?n th? ?nh g?c
imshow(I);
title('?nh g?c');
% T�nh to�n histogram
[counts, grayLevels] = imhist(I);

% Hi?n th? histogram
figure;
bar(grayLevels, counts);
xlabel('Muc xam');
ylabel('So luong pixel');
title('Histogram cua anh');
% T�nh c�c ??c tr?ng th?ng k�
mean_gray = mean(I(:));  % Trung b�nh
std_gray = std(double(I(:)));  % ?? l?ch chu?n
min_gray = min(I(:));  % Gi� tr? m?c x�m nh? nh?t
max_gray = max(I(:));  % Gi� tr? m?c x�m l?n nh?t

% In k?t qu?
disp(['Trung b�nh m?c x�m: ', num2str(mean_gray)]);
disp(['?? l?ch chu?n m?c x�m: ', num2str(std_gray)]);
disp(['M?c x�m nh? nh?t: ', num2str(min_gray)]);
disp(['M?c x�m l?n nh?t: ', num2str(max_gray)]);

