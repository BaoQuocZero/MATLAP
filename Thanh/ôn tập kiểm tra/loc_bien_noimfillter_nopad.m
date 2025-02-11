function detect_edges_no_padding()
    % ??c ?nh m?c xám
    img = imread('Lena512.bmp');
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    img = double(img);

    % Hi?n th? các l?a ch?n
    disp('Ch?n ph??ng pháp phát hi?n biên:');
    disp('1. Sobel');
    disp('2. Prewitt');
    disp('3. Robert');
    method_choice = input('L?a ch?n: ');

    % Xác ??nh m?t n? theo l?a ch?n
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
            disp('L?a ch?n không h?p l?.');
            return;
    end

    % L?y kích th??c ?nh
    [rows, cols] = size(img);
    % L?y kích th??c m?t n?
    [maskRows, maskCols] = size(Gx);
    padSize = floor(maskRows / 2); % ?? r?ng biên c?n ?? kernel ho?t ??ng

    % Kh?i t?o ?nh Ix và Iy
    Ix = zeros(rows, cols);
    Iy = zeros(rows, cols);

    % Th?c hi?n tích ch?p th? công cho ph?n không ph?i biên
    for i = padSize+1:rows-padSize
        for j = padSize+1:cols-padSize
            % L?y vùng ?nh t??ng ?ng v?i m?t n? (kích th??c phù h?p v?i Gx và Gy)
            if method_choice == 3 % X? lý ??c bi?t cho Robert
                region = img(i:i+1, j:j+1); % Ch? l?y 2x2 cho Robert
            else
                region = img(i-padSize:i+padSize, j-padSize:j+padSize);
            end

            % Nhân phân t? v?i Gx và Gy
            Ix(i, j) = sum(sum(region .* Gx));
            Iy(i, j) = sum(sum(region .* Gy));
        end
    end

    % X? lý biên (sao chép giá tr? biên t? ?nh g?c ho?c áp d?ng m?t k? thu?t x? lý biên khác)
    Ix(1:padSize, :) = Ix(1:padSize, :); % Biên trên
    Ix(rows-padSize+1:end, :) = Ix(rows-padSize+1:end, :); % Biên d??i
    Ix(:, 1:padSize) = Ix(:, 1:padSize); % Biên trái
    Ix(:, cols-padSize+1:end) = Ix(:, cols-padSize+1:end); % Biên ph?i

    Iy(1:padSize, :) = Iy(1:padSize, :); % Biên trên
    Iy(rows-padSize+1:end, :) = Iy(rows-padSize+1:end, :); % Biên d??i
    Iy(:, 1:padSize) = Iy(:, 1:padSize); % Biên trái
    Iy(:, cols-padSize+1:end) = Iy(:, cols-padSize+1:end); % Biên ph?i

    % Tính ?? l?n gradient
    magnitude = sqrt(Ix.^2 + Iy.^2);

    % Hi?n th? ?nh k?t qu?
    imshow(uint8(magnitude));
    title('?nh phát hi?n biên');
end
