function detect_edges_prewitt_no_padding()
    % ??c ?nh m?c x�m
    img = imread('Lena512.bmp');
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    img = double(img);

    % M?t n? Prewitt
    Gx = [-1 0 1; -1 0 1; -1 0 1];
    Gy = [1 1 1; 0 0 0; -1 -1 -1];

    % G?i h�m x? l� kh�ng padding
    apply_edge_detection_no_padding(img, Gx, Gy);
end

function apply_edge_detection_no_padding(img, Gx, Gy)
    [rows, cols] = size(img);
    padSize = floor(size(Gx, 1) / 2);
    Ix = zeros(rows, cols);
    Iy = zeros(rows, cols);

    for i = padSize+1:rows-padSize
        for j = padSize+1:cols-padSize
            region = img(i-padSize:i+padSize, j-padSize:j+padSize);
            Ix(i, j) = sum(sum(region .* Gx));
            Iy(i, j) = sum(sum(region .* Gy));
        end
    end

    magnitude = sqrt(Ix.^2 + Iy.^2);
    imshow(uint8(magnitude));
    title('?nh ph�t hi?n bi�n');
end
