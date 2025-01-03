% 1. ??c ?nh f
i = imread('Fig0333(a)(test_pattern_blurring_orig).tif');  % ??c ?nh i

% N?u ?nh l� ?nh m�u, chuy?n th�nh ?nh x�m
if size(i, 3) == 3
    i = rgb2gray(i);  % Chuy?n ?nh m�u th�nh ?nh x�m
end

% 2. X�y d?ng m?t n? l?c w (m?t n? 3x3 v?i m?i ph?n t? = 1/9)
w = ones(3, 3) / 3;  % M?t n? l?c v?i t?ng c�c ph?n t? b?ng 9

% 3. �p d?ng l?c tuy?n t�nh (d�ng Correlation ho?c Convolution)
g = imfilter(i, w, 'corr', 'replicate', 'same');  % L?c v?i Correlation, bi�n 'replicate', k�ch th??c 'same'

% 4. Hi?n th? ?nh g (k?t qu? l?c)
figure;
subplot(1, 2, 1), imshow(i), title('?nh g?c');
subplot(1, 2, 2), imshow(g), title('?nh sau khi l?c');



% %c�ch 2 
% % 1. ??c ?nh f
% i = imread('Fig0333(a)(test_pattern_blurring_orig).tif');  % ??c ?nh i
% 
% % N?u ?nh l� ?nh m�u, chuy?n th�nh ?nh x�m
% if size(i, 3) == 3
%     i = rgb2gray(i);  % Chuy?n ?nh m�u th�nh ?nh x�m
% end
% 
% % 2. X�y d?ng m?t n? l?c w (m?t n? 3x3 v?i m?i ph?n t? = 1/9)
% w = ones(3, 3) / 9;  % M?t n? l?c v?i t?ng c�c ph?n t? b?ng 9
% 
% % 3. Ki?m tra t?t c? c�c tr??ng h?p v?i c�c gi� tr? kh�c nhau c?a filtering_mode, boundary_options, size_options
% 
% filtering_modes = {'corr', 'conv'};  % C�c gi� tr? filtering_mode
% boundary_options = {'replicate', 'symmetric', 'circular'};  % C�c gi� tr? boundary_options
% size_options = {'full', 'same'};  % C�c gi� tr? size_options
% 
% % L?p qua c�c tr??ng h?p
% for fm = 1:length(filtering_modes)
%     for bo = 1:length(boundary_options)
%         for so = 1:length(size_options)
%             % �p d?ng l?c v?i c�c tham s? hi?n t?i
%             g = imfilter(i, w, filtering_modes{fm}, boundary_options{bo}, size_options{so});
%             
%             % Hi?n th? k?t qu?
%             figure;
%             subplot(1, 2, 1), imshow(i), title('?nh g?c');
%             subplot(1, 2, 2), imshow(g), title(['L?c: ' filtering_modes{fm} ', Bi�n: ' boundary_options{bo} ', K�ch th??c: ' size_options{so}]);
%         end
%     end
% end

