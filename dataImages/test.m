clc;
clear;
close all;

% ??c ?nh màu
A = imread('cola1.png');

% G?i hàm Roberts
G = roberts_edge_color(A);

% Hi?n th? k?t qu?
figure;
subplot(1,2,1), imshow(A); title('?nh g?c');
subplot(1,2,2), imshow(G, []); title('Biên ?nh (Roberts)');

% ======= Hàm Roberts cho ?nh Màu =======
function G = roberts_edge_color(A)
    % Chuy?n ?nh sang ki?u double ?? tính toán chính xác
    A = double(A);

    % Tách kênh màu R, G, B
    R = A(:,:,1);
    G = A(:,:,2);
    B = A(:,:,3);

    % Áp d?ng Roberts cho t?ng kênh màu
    edge_R = roberts_edge(R);
    edge_G = roberts_edge(G);
    edge_B = roberts_edge(B);

    % T?ng h?p biên b?ng cách l?y giá tr? l?n nh?t t?i m?i pixel
    G = max(cat(3, edge_R, edge_G, edge_B), [], 3);
end

% ======= Hàm Roberts cho ?nh Xám =======
function G = roberts_edge(A)
    % Chuy?n ?nh sang ki?u double
    A = double(A);
    
    % ??nh ngh?a m?t n? Roberts
    roberts_x = [1 0; 0 -1]; % Phát hi?n biên theo ???ng chéo chính
    roberts_y = [0 1; -1 0]; % Phát hi?n biên theo ???ng chéo ph?

    % Kích th??c ?nh
    [rows, cols] = size(A);

    % Kh?i t?o ?nh biên
    Gx = zeros(rows, cols);
    Gy = zeros(rows, cols);
    G = zeros(rows, cols);

    % Tính toán tích ch?p th? công (b? qua vi?n ngoài)
    for i = 1:rows-1
        for j = 1:cols-1
            % C?a s? 2x2 quanh pixel (i, j)
            window = A(i:i+1, j:j+1);

            % Áp d?ng m?t n? Roberts theo X và Y
            Gx(i, j) = sum(sum(window .* roberts_x));
            Gy(i, j) = sum(sum(window .* roberts_y));

            % T?ng h?p biên
            G(i, j) = sqrt(Gx(i, j)^2 + Gy(i, j)^2);
        end
    end
end
