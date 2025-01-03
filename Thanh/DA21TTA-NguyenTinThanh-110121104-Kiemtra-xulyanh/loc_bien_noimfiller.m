function detect_edges()
    % ??c ?nh m?c x�m
    img = imread('Lena512.bmp');
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    img = double(img);

    % Hi?n th? c�c l?a ch?n
    disp('Ch?n ph??ng ph�p ph�t hi?n bi�n:');
    disp('1. Sobel');
    disp('2. Prewitt');
    disp('3. Robert');
    method_choice = input('L?a ch?n: ');

    % X�c ??nh m?t n? theo l?a ch?n
    switch method_choice
        case 1
            Gx = [-1 0 1; -2 0 2; -1 0 1];
            Gy = [-1 -2 -1; 0 0 0; 1 2 1];
        case 2
            Gx = [-1 0 1; -1 0 1; -1 0 1];
            Gy = [1 1 1; 0 0 0; -1 -1 -1];
        case 3
            Gx = [1 0; 0 -1];
            Gy = [0 1; -1 0];
        otherwise
            disp('L?a ch?n kh�ng h?p l?.');
            return;
    end

    % L?y k�ch th??c ?nh
    [rows, cols] = size(img);
    % L?y k�ch th??c m?t n?
    [maskRows, maskCols] = size(Gx);
    padSize = floor(maskRows / 2); % ??m bi�n ?nh

    % T?o ?nh ???c ??m bi�n ?? t�nh t�ch ch?p
    paddedImg = padarray(img, [padSize, padSize], 'replicate');

    % Kh?i t?o ?nh Ix v� Iy
    Ix = zeros(rows, cols);
    Iy = zeros(rows, cols);

    % Th?c hi?n t�ch ch?p th? c�ng
    for i = 1:rows
        for j = 1:cols
            % L?y v�ng ?nh t??ng ?ng v?i m?t n?
            region = paddedImg(i:i+maskRows-1, j:j+maskCols-1);
            % Nh�n t�ch ch?p
            Ix(i, j) = sum(sum(region .* Gx));
            Iy(i, j) = sum(sum(region .* Gy));
        end
    end

    % T�nh ?? l?n gradient
    magnitude = sqrt(Ix.^2 + Iy.^2);

    % Hi?n th? ?nh k?t qu?
    imshow(uint8(magnitude));
    title('?nh ph�t hi?n bi�n');
end
