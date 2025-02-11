function linear_filter_no_padding()
    % ??c ?nh m?c xám
    img = imread('Fig0335(a)(ckt_board_saltpep_prob_pt05).tif');
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    img = double(img);

    % Hi?n th? các l?a ch?n
    disp('Ch?n b? l?c tuy?n tính:');
    disp('1. 1/9 [1 1 1; 1 1 1; 1 1 1]');
    disp('2. 1/5 [0 1 0; 1 1 1; 0 1 0]');
    disp('3. 1/32 [1 3 1; 3 16 3; 1 3 1]');
    disp('4. 1/8 [1 1 1; 1 4 1; 1 1 1]');
    disp('5. T? ??nh ngh?a');
    choice = input('L?a ch?n: ');

    % Xác ??nh kernel d?a trên l?a ch?n
    switch choice
        case 1
            kernel = ones(3, 3) / 9;
        case 2
            kernel = [0 1 0; 1 1 1; 0 1 0] / 5;
        case 3
            kernel = [1 3 1; 3 16 3; 1 3 1] / 32;
        case 4
            kernel = [1 1 1; 1 4 1; 1 1 1] / 8;
        case 5
            n = input('Nh?p kích th??c m?t n? (n x n): ');
            kernel = zeros(n, n);
            for i = 1:n
                row = input(['Nh?p dòng th? ', num2str(i), ': ']);
                kernel(i, :) = row;
            end
            kernel = kernel / sum(kernel(:)); % Chu?n hóa kernel
        otherwise
            disp('L?a ch?n không h?p l?.');
            return;
    end

    % Kích th??c ?nh và kernel
    [rows, cols] = size(img);
    [kRows, kCols] = size(kernel);
    padSize = floor(kRows / 2); % ?? r?ng biên c?n ?? kernel ho?t ??ng

    % Kh?i t?o ?nh k?t qu?
    filtered_img = zeros(rows, cols);

    % Th?c hi?n tích ch?p (b? qua pixel biên)
    for i = padSize+1:rows-padSize
        for j = padSize+1:cols-padSize
            % L?y vùng con t??ng ?ng
            region = img(i-padSize:i+padSize, j-padSize:j+padSize);
            % Nhân và c?ng tích ch?p
            filtered_img(i, j) = sum(sum(region .* kernel));
        end
    end

    % Gán các giá tr? pixel biên b?ng giá tr? g?c (không áp d?ng kernel)
    filtered_img(1:padSize, :) = img(1:padSize, :);
    filtered_img(rows-padSize+1:end, :) = img(rows-padSize+1:end, :);
    filtered_img(:, 1:padSize) = img(:, 1:padSize);
    filtered_img(:, cols-padSize+1:end) = img(:, cols-padSize+1:end);

    % Hi?n th? ?nh k?t qu?
    imshow(uint8(filtered_img));
    title('?nh sau khi l?c (không ??m biên)');
end
