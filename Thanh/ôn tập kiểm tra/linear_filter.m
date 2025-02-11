% 1. L?c trung b�nh tuy?n t�nh
% function linear_filter()
%     % ??c ?nh m?c x�m
%     img = imread('Fig0335(a)(ckt_board_saltpep_prob_pt05).tif');
%     if size(img, 3) == 3
%         img = rgb2gray(img);
%     end
% img = double(img);
%     % Hi?n th? c�c l?a ch?n
%     disp('Ch?n b? l?c tuy?n t�nh:');
%     disp('1. 1/9 [1 1 1; 1 1 1; 1 1 1]');
%     disp('2. 1/5 [0 1 0; 1 1 1; 0 1 0]');
%     disp('3. 1/32 [1 3 1; 3 16 3; 1 3 1]');
%     disp('4. 1/8 [1 1 1; 1 4 1; 1 1 1]');
%     disp('5. T? ??nh ngh?a');
%     choice = input('L?a ch?n: ');
% 
%     switch choice
%         case 1
%             kernel = ones(3, 3) / 9;
%         case 2
%             kernel = [0 1 0; 1 1 1; 0 1 0] / 5;
%         case 3
%             kernel = [1 3 1; 3 16 3; 1 3 1] / 32;
%         case 4
%             kernel = [1 1 1; 1 4 1; 1 1 1] / 8;
%         case 5
%             n = input('Nh?p k�ch th??c m?t n? (n x n): ');
%             kernel = zeros(n, n);
%             for i = 1:n
%                 row = input(['Nh?p d�ng th? ', num2str(i), ': ']);
%                 kernel(i, :) = row;
%             end
%             kernel = kernel / sum(kernel(:));
%         otherwise
%             disp('L?a ch?n kh�ng h?p l?.');
%             return;
%     end
% 
%     filtered_img = imfilter(double(img), kernel, 'replicate');
%     imshow(uint8(filtered_img));
%     title('?nh sau khi l?c');
% end

% 2. Ph�t hi?n bi�n trong ?nh m?c x�m
% function detect_edges()
%     % ??c ?nh m?c x�m
%     img = imread('Fig0335(a)(ckt_board_saltpep_prob_pt05).tif');
%     if size(img, 3) == 3
%         img = rgb2gray(img);
%     end
% img = double(img);
%     % Hi?n th? c�c l?a ch?n
%     disp('Ch?n ph??ng ph�p ph�t hi?n bi�n:');
%     disp('1. Sobel');
%     disp('2. Prewitt');
%     disp('3. Robert');
%     method_choice = input('L?a ch?n: ');
% 
%     switch method_choice
%         case 1
%             Gx = fspecial('sobel');
%             Gy = Gx';
%         case 2
%             Gx = [-1 0 1; -1 0 1; -1 0 1];
%             Gy = [1 1 1; 0 0 0; -1 -1 -1];
%         case 3
%             Gx = [1 0; 0 -1];
%             Gy = [0 1; -1 0];
%         otherwise
%             disp('L?a ch?n kh�ng h?p l?.');
%             return;
%     end
% 
%     Ix = imfilter(double(img), Gx, 'replicate');
%     Iy = imfilter(double(img), Gy, 'replicate');
%     magnitude = sqrt(Ix.^2 + Iy.^2);
% 
%     imshow(uint8(magnitude));
%     title('?nh ph�t hi?n bi�n');
% end

% 3. T�m gi� tr? nh? nh?t tr�n h�ng r
function [minValue, minColumn] = B1_ex(img, r)
    if size(img, 3) == 3
        img = rgb2gray(img);
    end

    % Ki?m tra r h?p l?
    if r > size(img, 1) || r < 1
        error('H�ng v??t qu� s? l??ng h�ng trong ?nh.');
    end

    % Kh?i t?o gi� tr? nh? nh?t v� c?t
    row = img(r, :);
    minValue = row(1);
    minColumn = 1;

    % T�m gi� tr? nh? nh?t b?ng v�ng l?p for
    for c = 2:size(img, 2)
        if row(c) < minValue
            minValue = row(c);
            minColumn = c;
        end
    end
end


img = imread('Fig0335(a)(ckt_board_saltpep_prob_pt05).tif');
[minValue, minColumn] = B1_ex(img, 10);

% H??ng d?n s? d?ng (comment ph�a tr??c c�c h�m)
% 1. linear_filter();
% 2. detect_edges();
% 3. [minValue, minColumn] = B1_ex(img, r);
