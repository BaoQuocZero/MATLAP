function detect_edges_robert_no_padding_manual()
    % ??c ?nh m?c xám
    img = imread('Lena512.bmp');
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    img = double(img);

    % M?t n? Robert
    Gx = [1 0; 0 -1];
    Gy = [0 1; -1 0];

    % G?i hàm x? lý v?i tích ch?p th? công
    apply_edge_detection_no_padding_manual(img, Gx, Gy);
end

function apply_edge_detection_no_padding_manual(img, Gx, Gy)
    [rows, cols] = size(img);
    
    % Kh?i t?o ?nh Ix và Iy
    Ix = zeros(rows, cols);
    Iy = zeros(rows, cols);

    % Th?c hi?n tích ch?p cho m?t n? Robert (kích th??c 2x2)
    for i = 1:rows-1
        for j = 1:cols-1
            % L?y vùng nh? 2x2 ?? nhân v?i m?t n?
            region = img(i:i+1, j:j+1);
            Ix(i, j) = sum(sum(region .* Gx)); % Tính ??o hàm theo x
            Iy(i, j) = sum(sum(region .* Gy)); % Tính ??o hàm theo y
        end
    end

    % Tính ?? l?n gradient
    magnitude = sqrt(Ix.^2 + Iy.^2);

    % Hi?n th? ?nh k?t qu?
    imshow(uint8(magnitude));
    title('?nh phát hi?n biên (Robert không có padding th? công)');
end
