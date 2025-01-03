function detect_edges_robert_no_padding_manual()
    % ??c ?nh m?c x�m
    img = imread('Lena512.bmp');
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    img = double(img);

    % M?t n? Robert
    Gx = [1 0; 0 -1];
    Gy = [0 1; -1 0];

    % G?i h�m x? l� v?i t�ch ch?p th? c�ng
    apply_edge_detection_no_padding_manual(img, Gx, Gy);
end

function apply_edge_detection_no_padding_manual(img, Gx, Gy)
    [rows, cols] = size(img);
    
    % Kh?i t?o ?nh Ix v� Iy
    Ix = zeros(rows, cols);
    Iy = zeros(rows, cols);

    % Th?c hi?n t�ch ch?p cho m?t n? Robert (k�ch th??c 2x2)
    for i = 1:rows-1
        for j = 1:cols-1
            % L?y v�ng nh? 2x2 ?? nh�n v?i m?t n?
            region = img(i:i+1, j:j+1);
            Ix(i, j) = sum(sum(region .* Gx)); % T�nh ??o h�m theo x
            Iy(i, j) = sum(sum(region .* Gy)); % T�nh ??o h�m theo y
        end
    end

    % T�nh ?? l?n gradient
    magnitude = sqrt(Ix.^2 + Iy.^2);

    % Hi?n th? ?nh k?t qu?
    imshow(uint8(magnitude));
    title('?nh ph�t hi?n bi�n (Robert kh�ng c� padding th? c�ng)');
end
