pillsetc=imread('pillsetc.png');
tape=imread('tape.png');
coins=imread('coins.png');
eight=imread('eight.tif');


pillsetc_1 = im2bw(pillsetc, 0.1); %T�ch ng??ng t? ??ng
tape_1 = im2bw(tape, 0.1); %T�ch ng??ng t? ??ng
coins_1 = im2bw(coins, 0.1); %T�ch ng??ng t? ??ng
eight_1 = im2bw(eight, 0.1); %T�ch ng??ng t? ??ng

subplot(4,2,1), imshow(pillsetc);
subplot(4,2,2), imshow(pillsetc_1);
subplot(4,2,3), imshow(tape);
subplot(4,2,4), imshow(tape_1);
subplot(4,2,5), imshow(coins);
subplot(4,2,6), imshow(coins_1);
subplot(4,2,7), imshow(eight);
subplot(4,2,8), imshow(eight_1);