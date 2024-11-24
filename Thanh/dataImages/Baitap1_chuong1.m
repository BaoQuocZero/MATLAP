% ??c ?nh t? t?p
image = imread('cell.tif'); 
figure;
% Hi?n th? h�nh ?nh
subplot(2,2,1)
imshow(image);
title('H�nh ?nh ban ??u');


% Truy xu?t v? tr� c?a ?nh
x = 100;
y = 20;
imagepixel = image(x,y,:);
%disp(imagepixel);


% Truy xu?t v? tr� c?a ?nh khi + 25
x = 100;
y = 20;
imagetestcong = imagepixel + 25;
imagetesttru = imagepixel - 25;
% disp(imagetestcong);
% disp(imagetesttru);
image(x,y) = imagetestcong;
subplot(2,2,2);
imshow(image);%sau khi c?ng th�m 25 cho c�i � n�y th� g?n nh? kh�ng th?y s? kh�c bi?t
title('H�nh ?nh sau khi c?ng');


image(x,y) = imagetesttru;
subplot(2,2,3);
imshow(image);%sau khi tr? ?i 25 cho c�i � n�y th� g?n nh? kh�ng th?yth?yth?yth?yth?yth?yth?y s? kh�c bi?t
title('H�nh ?nh sau khi tr?');

% c�u 1.2
[row,col] = size(image);
 i1 = zeros(row, col, 'uint8');
 i2 = zeros(row, col, 'uint8');
disp(row);
disp(col);
for i = 1:row
     for j = 1:col
        newimage = image(i,j) + 25;
        i1(i,j) = min(max(newimage,0),255);%gi� tr? kh�ng v??t qu� 255
        newimage1 = image(i,j) - 25;
        i2(i,j) = min(max(newimage1,0),255);% gi� tr? kh�ng v??t qu� 255
    end
end
subplot(2,2,4)
imshow(i1);
figure;
imshow(i2);
title('H�nh ?nh sau khi c?ng t?t c? 25');        











