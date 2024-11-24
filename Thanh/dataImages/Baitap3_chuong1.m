image = imread('cameraman.tif');


imwrite(image,'image.jpg');% chuy?n ?nh v? d?ng jbg image tr??c
imwrite(image,'image.png');% chuy?n ?nh v� d?ng png image tr??c
ijbg = imread('image.jpg'); % g?n ?nh jpg v?a t?o v�o bi?n m?i
ipng = imread('image.png');
figure;


x = imabsdiff(ipng,ijbg);%so s�nh 2 c�i h�nh
figure;
imagesc(x); % in ket qua tru ra
figure;
imshow(x);



subplot(1,2,1);
imshow(ijbg);
title('H�nh anh jbg');
subplot(1,2,2);
imshow(ipng);
title('H�nh anh png');