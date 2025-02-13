% ??c ?nh màu
I = imread('trees.tif');

R = I(:,:,1); % Kênh ??
G = I(:,:,2); % Kênh xanh lá
B = I(:,:,3); % Kênh xanh d??ng

figure;
subplot(1,3,1); imshow(R); title('Kênh ??');
subplot(1,3,2); imshow(G); title('Kênh Xanh Lá');
subplot(1,3,3); imshow(B); title('Kênh Xanh D??ng');
