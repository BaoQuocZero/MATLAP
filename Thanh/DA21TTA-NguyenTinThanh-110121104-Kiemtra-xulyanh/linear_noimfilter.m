function linear_filter()
    % ??c ?nh m?c x�m
    img = imread('Fig0335(a)(ckt_board_saltpep_prob_pt05).tif');
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    img = double(img);

    % Hi?n th? c�c l?a ch?n
    disp('Ch?n b? l?c tuy?n t�nh:');
    disp('1. 1/9 [1 1 1; 1 1 1; 1 1 1]');
    disp('2. 1/5 [0 1 0; 1 1 1; 0 1 0]');
    disp('3. 1/32 [1 3 1; 3 16 3; 1 3 1]');
    disp('4. 1/8 [1 1 1; 1 4 1; 1 1 1]');
    disp('5. T? ??nh ngh?a');
    choice = input('L?a ch?n: ');

    % X�c ??nh kernel d?a tr�n l?a ch?n
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
            n = input('Nh?p k�ch th??c m?t n? (n x n): ');
            kernel = zeros(n, n);
            for i = 1:n
                row = input(['Nh?p d�ng th? ', num2str(i), ': ']);
                kernel(i, :) = row;
            end
            kernel = kernel / sum(kernel(:)); % Chu?n h�a kernel
        otherwise
            disp('L?a ch?n kh�ng h?p l?.');
            return;
    end

    % K�ch th??c ?nh v� kernel
    [rows, cols] = size(img);
    [kRows, kCols] = size(kernel);
    padSize = floor(kRows / 2);

    % ??m bi�n ?nh
    paddedImg = padarray(img, [padSize, padSize], 'replicate');

    % Kh?i t?o ?nh k?t qu?
    filtered_img = zeros(rows, cols);

    % Th?c hi?n t�ch ch?p th? c�ng
    for i = 1:rows
        for j = 1:cols
            % L?y v�ng con t??ng ?ng
            region = paddedImg(i:i+kRows-1, j:j+kCols-1);
            % Nh�n v� c?ng t�ch ch?p
            filtered_img(i, j) = sum(sum(region .* kernel));
        end
    end

    % Hi?n th? ?nh k?t qu?
    imshow(uint8(filtered_img));
    title('?nh sau khi l?c');
end
