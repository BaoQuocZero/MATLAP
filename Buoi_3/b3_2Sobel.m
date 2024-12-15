% ??c ?nh
image = imread('cameraman.tif');  % Thay b?ng ???ng d?n ?nh c?a b?n

% Ki?m tra n?u ?nh l� m�u v� chuy?n sang ?nh x�m n?u c?n
if size(image, 3) == 3
    image = rgb2gray(image); % Chuy?n ?nh m�u sang ?nh x�m
end

% ??m b?o ?nh l� ?nh x�m v� chuy?n sang ki?u double
image = double(image);

% L?y k�ch th??c c?a ?nh
[numRows, numCols] = size(image);

% B? l?c Sobel theo h??ng X v� Y
sobel_x = [-1 0 1; -2 0 2; -1 0 1];  % B? l?c Sobel theo h??ng X
sobel_y = [-1 -2 -1; 0 0 0; 1 2 1];  % B? l?c Sobel theo h??ng Y

% Kh?i t?o ?nh ??u ra
edge_sobel = zeros(numRows, numCols);

% B�n k�nh c?a b? l?c (1 pixel cho b? l?c 3x3)
radius = 1;

% Duy?t qua ?nh (tr? bi�n)
for r = radius+1 : numRows-radius
    for c = radius+1 : numCols-radius
        % C?t c?a s? 3x3 quanh pixel (r, c)
        window = image(r-1:r+1, c-1:c+1);

        % �p d?ng b? l?c Sobel theo h??ng X v� Y
        gradient_x = sum(sum(window .* sobel_x));  % Gradient theo h??ng X
        gradient_y = sum(sum(window .* sobel_y));  % Gradient theo h??ng Y

        % T�nh ?? l?n gradient (magnitude)
        edge_sobel(r, c) = sqrt(gradient_x^2 + gradient_y^2);
    end
end

% Chuy?n ??i ?nh ??u ra v? ki?u uint8 n?u c?n
edge_sobel = uint8(edge_sobel);

% Hi?n th? k?t qu?
imshow(edge_sobel);
title('Edge Detection using Sobel Filter');