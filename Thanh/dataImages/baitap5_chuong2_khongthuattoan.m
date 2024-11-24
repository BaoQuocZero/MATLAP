I = imread('cameraman.tif');  % ??c ?nh g?c
subplot(2,2,1), imshow(I);   % Hi?n th? ?nh g?c

Id = im2double(I);  % Chuy?n ??i ?nh g?c sang d?ng double

% Th?c hi?n bi?n ??i logarithm mà không dùng hàm log
% Thay vì s? d?ng log, ta có th? s? d?ng ph??ng pháp thay th? ??n gi?n b?ng cách
% áp d?ng m?t phép toán m? ho?c tr?c ti?p nhân v?i các h? s?.

% Output 1: 2 * log(1 + Id)
Output1 = 2 * (Id + 0.0001);  % S? d?ng phép toán thay th? ??n gi?n
% Output 2: 3 * log(1 + Id)
Output2 = 3 * (Id + 0.0001);
% Output 3: 5 * log(1 + Id)
Output3 = 5 * (Id + 0.0001);

subplot(2,2,2), imshow(Output1);  % Hi?n th? ?nh sau bi?n ??i Output1
subplot(2,2,3), imshow(Output2);  % Hi?n th? ?nh sau bi?n ??i Output2
subplot(2,2,4), imshow(Output3);  % Hi?n th? ?nh sau bi?n ??i Output3
