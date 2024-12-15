image = imread('cameraman.tif');  % ??c ?nh
if size(image, 3) == 3
    image = rgb2gray(image);  % Chuy?n sang ?nh xám n?u ?nh là màu
end

% ??m b?o ?nh là ?nh xám và chuy?n sang ki?u double
image = double(image);

% Kích th??c c?a ?nh
[numRows, numCols] = size(image);

% B? l?c Robert theo h??ng X và Y
robert_x = [1 0; 0 -1];  % B? l?c Robert theo h??ng X
robert_y = [0 1; -1 0];  % B? l?c Robert theo h??ng Y

% Kh?i t?o ?nh ??u ra
edge_robert = zeros(numRows, numCols);

% Duy?t qua ?nh (tr? biên)
for r = 1:numRows-1
    for c = 1:numCols-1
        % C?t c?a s? 2x2 quanh pixel (r, c)
        window = image(r:r+1, c:c+1);
        
        % Áp d?ng b? l?c Robert theo h??ng X và Y
        gradient_x = sum(sum(window .* robert_x));  % Gradient theo h??ng X
        gradient_y = sum(sum(window .* robert_y));  % Gradient theo h??ng Y
        
        % Tính ?? l?n gradient (magnitude)
        edge_robert(r, c) = sqrt(gradient_x^2 + gradient_y^2);
    end
end

% Chuy?n ??i ?nh ??u ra v? ki?u uint8 n?u c?n
edge_robert = uint8(edge_robert);

% Hi?n th? k?t qu?
imshow(edge_robert);
