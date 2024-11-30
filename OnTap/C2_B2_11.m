% a. ??c ?nh
i = imread('Fig0335(a)(ckt_board_saltpep_prob_pt05).tif');  % ??c ?nh v�o bi?n i

% N?u ?nh l� ?nh m�u, chuy?n th�nh ?nh x�m
if size(i, 3) == 3
    i = rgb2gray(i);  % Chuy?n ?nh m�u th�nh ?nh x�m
end

% b. L?c tuy?n t�nh (s? d?ng b? l?c trung b�nh 3x3)
h = fspecial('average', [3 3]);  % T?o b? l?c trung b�nh 3x3
g_linear = conv2(double(i), h, 'same');  % �p d?ng ph�p convolution ?? l?c tuy?n t�nh

% Chuy?n k?t qu? v? ki?u uint8
g_linear = uint8(g_linear);

% c. L?c phi tuy?n (l?c trung v? 3x3)
g_median = medfilt2(i, [3 3]);  % �p d?ng l?c trung v? v?i l�n c?n 3x3

% d. Hi?n th? k?t qu?
figure;

% Hi?n th? ?nh g?c v� c�c ?nh sau khi l?c
subplot(1, 3, 1), imshow(i), title('?nh g?c');
subplot(1, 3, 2), imshow(g_linear), title('L?c tuy?n t�nh');
subplot(1, 3, 3), imshow(g_median), title('L?c phi tuy?n (Trung v?)');
