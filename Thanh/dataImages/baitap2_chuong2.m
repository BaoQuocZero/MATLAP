i = imread('Fig0122(a)(fractal-iris).tif');
imshow(i);


%T?o ?nh i3,i6,i78 t? bit plane th? 3 c?a ?nh I
i3 = bitget(i,3);% toi da co 8 bit
i6 = bitget(i,6);% toi da co 8 bit
i78 = zeros(size(i));% toi da co 8 bit
i78 = bitset(i78,7,bitget(i,7));% toi da co 8 bit
i78 = bitset(i78,8,bitget(i,8));% toi da co 8 bit
figure;
subplot(2,2,1);
imshow(i);
subplot(2,2,2);
imshow(i3);
subplot(2,2,3);
imshow(i6);
subplot(2,2,4);
imshow(i78);