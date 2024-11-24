% ??c ?nh t? t?p
image = imread('cell.tif'); 
figure;
% Hi?n th? hình ?nh
subplot(2,2,1)
imshow(image);
title('Hình ?nh ban ??u');


% Truy xu?t v? trí c?a ?nh
x = 100;
y = 20;
imagepixel = image(x,y,:);
%disp(imagepixel);


% Truy xu?t v? trí c?a ?nh khi + 25
x = 100;
y = 20;
imagetestcong = imagepixel + 25;
imagetesttru = imagepixel - 25;
% disp(imagetestcong);
% disp(imagetesttru);
image(x,y) = imagetestcong;
subplot(2,2,2);
imshow(image);%sau khi c?ng thêm 25 cho cái ô này thì g?n nh? không th?y s? khác bi?t
title('Hình ?nh sau khi c?ng');


image(x,y) = imagetesttru;
subplot(2,2,3);
imshow(image);%sau khi tr? ?i 25 cho cái ô này thì g?n nh? không th?yth?yth?yth?yth?yth?yth?y s? khác bi?t
title('Hình ?nh sau khi tr?');

% câu 1.2
[row,col] = size(image);
 i1 = zeros(row, col, 'uint8');
 i2 = zeros(row, col, 'uint8');
disp(row);
disp(col);
for i = 1:row
     for j = 1:col
        newimage = image(i,j) + 25;
        i1(i,j) = min(max(newimage,0),255);%giá tr? không v??t quá 255
        newimage1 = image(i,j) - 25;
        i2(i,j) = min(max(newimage1,0),255);% giá tr? không v??t quá 255
    end
end
subplot(2,2,4)
imshow(i1);
figure;
imshow(i2);
title('Hình ?nh sau khi c?ng t?t c? 25');        











