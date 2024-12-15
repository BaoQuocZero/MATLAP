% ??c ?nh
image = imread('cameraman.tif');  % Thay b?ng ???ng d?n ?nh c?a b?n

% Ki?m tra n?u ?nh là màu và chuy?n sang ?nh xám n?u c?n
if size(image, 3) == 3
    image = rgb2gray(image); % Chuy?n ?nh màu sang ?nh xám
end

% ??m b?o ?nh là ?nh xám và chuy?n sang ki?u double
image = double(image);

% L?y kích th??c c?a ?nh
[numRows, numCols] = size(image);

% B? l?c Prewitt theo h??ng X và Y
prewitt_x = [-1 0 1; -1 0 1; -1 0 1];  % B? l?c Prewitt theo h??ng X
prewitt_y = [-1 -1 -1; 0 0 0; 1 1 1];  % B? l?c Prewitt theo h??ng Y

% Kh?i t?o ?nh ??u ra
edge_prewitt = zeros(numRows, numCols);

% Bán kính c?a b? l?c (1 pixel cho b? l?c 3x3)
radius = 1;

% Duy?t qua ?nh (tr? biên)
for r = radius+1 : numRows-radius
    for c = radius+1 : numCols-radius
        % C?t c?a s? 3x3 quanh pixel (r, c)
        window = image(r-1:r+1, c-1:c+1);

        % Áp d?ng b? l?c Prewitt theo h??ng X và Y
        gradient_x = sum(sum(window .* prewitt_x));  % Gradient theo h??ng X
        gradient_y = sum(sum(window .* prewitt_y));  % Gradient theo h??ng Y

        % Tính ?? l?n gradient (magnitude)
        edge_prewitt(r, c) = sqrt(gradient_x^2 + gradient_y^2);
    end
end

% Chuy?n ??i ?nh ??u ra v? ki?u uint8 n?u c?n
edge_prewitt = uint8(edge_prewitt);

% Hi?n th? k?t qu?
imshow(edge_prewitt);
title('Edge Detection using Prewitt Filter');
