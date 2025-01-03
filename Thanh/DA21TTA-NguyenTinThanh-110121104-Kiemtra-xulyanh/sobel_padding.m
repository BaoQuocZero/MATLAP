function detect_edges_sobel_padding()
    % ??c ?nh m?c x�m
    img = imread('Lena512.bmp');
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    img = double(img);

    % M?t n? Sobel
    Gx = [-1 0 1; -2 0 2; -1 0 1];
    Gy = [-1 -2 -1; 0 0 0; 1 2 1];

    % G?i h�m x? l� v?i padding
    apply_edge_detection(img, Gx, Gy);
end

function apply_edge_detection(img, Gx, Gy)
    [rows, cols] = size(img);
    padSize = floor(size(Gx, 1) / 2);  % ??m bi�n

    % Th�m padding v�o ?nh
    paddedImg = padarray(img, [padSize, padSize], 'replicate');
    Ix = zeros(rows, cols);
    Iy = zeros(rows, cols);

    for i = 1:rows
        for j = 1:cols
            % L?y v�ng nh? t? ?nh (c� padding)
            region = paddedImg(i:i+size(Gx,1)-1, j:j+size(Gx,2)-1);
            % T�nh ??o h�m theo x v� y
            Ix(i, j) = sum(sum(region .* Gx));
            Iy(i, j) = sum(sum(region .* Gy));
        end
    end

    % T�nh ?? l?n bi�n
    magnitude = sqrt(Ix.^2 + Iy.^2);
    % Hi?n th? ?nh k?t qu?
    imshow(uint8(magnitude));
    title('?nh ph�t hi?n bi�n (Sobel v?i Padding)');
end
