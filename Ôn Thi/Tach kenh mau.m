% ??c ?nh m�u
I = imread('trees.tif');

R = I(:,:,1); % K�nh ??
G = I(:,:,2); % K�nh xanh l�
B = I(:,:,3); % K�nh xanh d??ng

figure;
subplot(1,3,1); imshow(R); title('K�nh ??');
subplot(1,3,2); imshow(G); title('K�nh Xanh L�');
subplot(1,3,3); imshow(B); title('K�nh Xanh D??ng');
