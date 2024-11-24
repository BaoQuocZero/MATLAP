image1 = imread('pillsetc.png');
image2 = imread('tape.png');
image3 = imread('coins.png');
image4 = imread('eight.tif');


%chon nguong
T1=im2bw(image1, 0.1); 
T2=im2bw(image2, 0.1); 
T3=im2bw(image3, 0.1); 
T4=im2bw(image4, 0.1); 


%hien hinh 1
figure;
subplot(1,3,1), imshow(image1);
subplot(1,3,2), imshow(T1);

%hien hinh 2
figure;
subplot(1,3,1), imshow(image2);
subplot(1,3,2), imshow(T2);


%hien hinh 3
figure;
subplot(1,3,1), imshow(image3);
subplot(1,3,2), imshow(T3);
[counts,bins]=imhist(image3);
counts(60) 

%hien hinh 4
figure;
subplot(1,3,1), imshow(image4);
subplot(1,3,2), imshow(T4);


















