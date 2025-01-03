function detect_edges_sobel_padding()
    % ??c ?nh m?c xám
    img = imread('Lena512.bmp');
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    img = double(img);

    % M?t n? Sobel
    Gx = [-1 0 1; -2 0 2; -1 0 1];
    Gy = [-1 -2 -1; 0 0 0; 1 2 1];

    % G?i hàm x? lý v?i padding
    apply_edge_detection(img, Gx, Gy);
end

function apply_edge_detection(img, Gx, Gy)
    [rows, cols] = size(img);
    padSize = floor(size(Gx, 1) / 2);  % ??m biên

    % Thêm padding vào ?nh
    paddedImg = padarray(img, [padSize, padSize], 'replicate');
    Ix = zeros(rows, cols);
    Iy = zeros(rows, cols);

    for i = 1:rows
        for j = 1:cols
            % L?y vùng nh? t? ?nh (có padding)
            region = paddedImg(i:i+size(Gx,1)-1, j:j+size(Gx,2)-1);
            % Tính ??o hàm theo x và y
            Ix(i, j) = sum(sum(region .* Gx));
            Iy(i, j) = sum(sum(region .* Gy));
        end
    end

    % Tính ?? l?n biên
    magnitude = sqrt(Ix.^2 + Iy.^2);
    % Hi?n th? ?nh k?t qu?
    imshow(uint8(magnitude));
    title('?nh phát hi?n biên (Sobel v?i Padding)');
end
