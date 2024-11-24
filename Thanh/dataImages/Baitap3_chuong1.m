image = imread('cameraman.tif');


imwrite(image,'image.jpg');% chuy?n ?nh v? d?ng jbg image tr??c
imwrite(image,'image.png');% chuy?n ?nh vè d?ng png image tr??c
ijbg = imread('image.jpg'); % g?n ?nh jpg v?a t?o vào bi?n m?i
ipng = imread('image.png');
figure;


x = imabsdiff(ipng,ijbg);%so sánh 2 cái hình
figure;
imagesc(x); % in ket qua tru ra
figure;
imshow(x);



subplot(1,2,1);
imshow(ijbg);
title('Hình anh jbg');
subplot(1,2,2);
imshow(ipng);
title('Hình anh png');