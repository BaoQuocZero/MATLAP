function detect_edges_no_padding()
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
    padSize = floor(maskRows / 2); % ?? r?ng bi�n c?n ?? kernel ho?t ??ng

    % Kh?i t?o ?nh Ix v� Iy
    Ix = zeros(rows, cols);
    Iy = zeros(rows, cols);

    % Th?c hi?n t�ch ch?p th? c�ng cho ph?n kh�ng ph?i bi�n
    for i = padSize+1:rows-padSize
        for j = padSize+1:cols-padSize
            % L?y v�ng ?nh t??ng ?ng v?i m?t n? (k�ch th??c ph� h?p v?i Gx v� Gy)
            if method_choice == 3 % X? l� ??c bi?t cho Robert
                region = img(i:i+1, j:j+1); % Ch? l?y 2x2 cho Robert
            else
                region = img(i-padSize:i+padSize, j-padSize:j+padSize);
            end

            % Nh�n ph�n t? v?i Gx v� Gy
            Ix(i, j) = sum(sum(region .* Gx));
            Iy(i, j) = sum(sum(region .* Gy));
        end
    end

    % X? l� bi�n (sao ch�p gi� tr? bi�n t? ?nh g?c ho?c �p d?ng m?t k? thu?t x? l� bi�n kh�c)
    Ix(1:padSize, :) = Ix(1:padSize, :); % Bi�n tr�n
    Ix(rows-padSize+1:end, :) = Ix(rows-padSize+1:end, :); % Bi�n d??i
    Ix(:, 1:padSize) = Ix(:, 1:padSize); % Bi�n tr�i
    Ix(:, cols-padSize+1:end) = Ix(:, cols-padSize+1:end); % Bi�n ph?i

    Iy(1:padSize, :) = Iy(1:padSize, :); % Bi�n tr�n
    Iy(rows-padSize+1:end, :) = Iy(rows-padSize+1:end, :); % Bi�n d??i
    Iy(:, 1:padSize) = Iy(:, 1:padSize); % Bi�n tr�i
    Iy(:, cols-padSize+1:end) = Iy(:, cols-padSize+1:end); % Bi�n ph?i

    % T�nh ?? l?n gradient
    magnitude = sqrt(Ix.^2 + Iy.^2);

    % Hi?n th? ?nh k?t qu?
    imshow(uint8(magnitude));
    title('?nh ph�t hi?n bi�n');
end
