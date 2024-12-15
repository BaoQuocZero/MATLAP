% ??c ?nh ??u vào
image = imread('cameraman.tif'); % Thay b?ng ???ng d?n ?nh c?a b?n
if size(image, 3) == 3
    image = rgb2gray(image); % Chuy?n ?nh màu sang thang xám n?u c?n
end

% Áp d?ng các b? l?c Sobel, Prewitt, Robert ?? xác ??nh ???ng biên
% B? l?c Sobel
sobel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_y = [-1 -2 -1; 0 0 0; 1 2 1];
edge_sobel_x = imfilter(double(image), sobel_x, 'same');
edge_sobel_y = imfilter(double(image), sobel_y, 'same');
edge_sobel = sqrt(edge_sobel_x.^2 + edge_sobel_y.^2);

% B? l?c Prewitt
prewitt_x = [-1 0 1; -1 0 1; -1 0 1];
prewitt_y = [-1 -1 -1; 0 0 0; 1 1 1];
edge_prewitt_x = imfilter(double(image), prewitt_x, 'same');
edge_prewitt_y = imfilter(double(image), prewitt_y, 'same');
edge_prewitt = sqrt(edge_prewitt_x.^2 + edge_prewitt_y.^2);

% B? l?c Robert
roberts_x = [1 0; 0 -1];
roberts_y = [0 1; -1 0];
edge_roberts_x = imfilter(double(image), roberts_x, 'same');
edge_roberts_y = imfilter(double(image), roberts_y, 'same');
edge_roberts = sqrt(edge_roberts_x.^2 + edge_roberts_y.^2);

% Hi?n th? k?t qu?
figure;

subplot(2, 2, 1);
imshow(image);
title('?nh g?c');

subplot(2, 2, 2);
imshow(uint8(edge_sobel));
title('???ng biên - Sobel');

subplot(2, 2, 3);
imshow(uint8(edge_prewitt));
title('???ng biên - Prewitt');

subplot(2, 2, 4);
imshow(uint8(edge_roberts));
title('???ng biên - Robert');
