% ??c ?nh g?c "cameraman.tif"
I = imread('cameraman.tif');

% Ghi ?nh d??i ??nh d?ng JPEG v� PNG
imwrite(I, 'Ijpg.jpg', 'jpg'); % L?u ?nh JPEG
imwrite(I, 'Ipng.png', 'png'); % L?u ?nh PNG

% ??c l?i hai ?nh ?� l?u
Ijpg = imread('Ijpg.jpg'); % ??c ?nh JPEG
Ipng = imread('Ipng.png'); % ??c ?nh PNG

% So s�nh hai ?nh v?i ?nh g?c
diff_jpg = I - Ijpg; % Ch�nh l?ch v?i ?nh JPEG
diff_png = I - Ipng; % Ch�nh l?ch v?i ?nh PNG

% Hi?n th? k?t qu?
figure;
subplot(2, 3, 1); imshow(I); title('Anh goc (cameraman.tif)');
subplot(2, 3, 2); imshow(Ijpg); title('Anh JPEG (Ijpg.jpg)');
subplot(2, 3, 3); imshow(Ipng); title('Anh PNG (Ipng.png)');
subplot(2, 3, 4); imshow(I); title('Anh goc (cameraman.tif)');
subplot(2, 3, 5); imshow(diff_jpg, []); title('Chenh lech voi JPEG');
subplot(2, 3, 6); imshow(diff_png, []); title('Chenh lech voi PNG');
