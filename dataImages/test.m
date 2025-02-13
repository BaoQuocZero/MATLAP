clc;
clear;
close all;

% ??c ?nh m�u
A = imread('cola1.png');

% G?i h�m Roberts
G = roberts_edge_color(A);

% Hi?n th? k?t qu?
figure;
subplot(1,2,1), imshow(A); title('?nh g?c');
subplot(1,2,2), imshow(G, []); title('Bi�n ?nh (Roberts)');

% ======= H�m Roberts cho ?nh M�u =======
function G = roberts_edge_color(A)
    % Chuy?n ?nh sang ki?u double ?? t�nh to�n ch�nh x�c
    A = double(A);

    % T�ch k�nh m�u R, G, B
    R = A(:,:,1);
    G = A(:,:,2);
    B = A(:,:,3);

    % �p d?ng Roberts cho t?ng k�nh m�u
    edge_R = roberts_edge(R);
    edge_G = roberts_edge(G);
    edge_B = roberts_edge(B);

    % T?ng h?p bi�n b?ng c�ch l?y gi� tr? l?n nh?t t?i m?i pixel
    G = max(cat(3, edge_R, edge_G, edge_B), [], 3);
end

% ======= H�m Roberts cho ?nh X�m =======
function G = roberts_edge(A)
    % Chuy?n ?nh sang ki?u double
    A = double(A);
    
    % ??nh ngh?a m?t n? Roberts
    roberts_x = [1 0; 0 -1]; % Ph�t hi?n bi�n theo ???ng ch�o ch�nh
    roberts_y = [0 1; -1 0]; % Ph�t hi?n bi�n theo ???ng ch�o ph?

    % K�ch th??c ?nh
    [rows, cols] = size(A);

    % Kh?i t?o ?nh bi�n
    Gx = zeros(rows, cols);
    Gy = zeros(rows, cols);
    G = zeros(rows, cols);

    % T�nh to�n t�ch ch?p th? c�ng (b? qua vi?n ngo�i)
    for i = 1:rows-1
        for j = 1:cols-1
            % C?a s? 2x2 quanh pixel (i, j)
            window = A(i:i+1, j:j+1);

            % �p d?ng m?t n? Roberts theo X v� Y
            Gx(i, j) = sum(sum(window .* roberts_x));
            Gy(i, j) = sum(sum(window .* roberts_y));

            % T?ng h?p bi�n
            G(i, j) = sqrt(Gx(i, j)^2 + Gy(i, j)^2);
        end
    end
end
