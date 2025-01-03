% 1. ??c ?nh f
i = imread('Fig0333(a)(test_pattern_blurring_orig).tif');  % ??c ?nh i

% N?u ?nh là ?nh màu, chuy?n thành ?nh xám
if size(i, 3) == 3
    i = rgb2gray(i);  % Chuy?n ?nh màu thành ?nh xám
end

% 2. Xây d?ng m?t n? l?c w (m?t n? 3x3 v?i m?i ph?n t? = 1/9)
w = ones(3, 3) / 3;  % M?t n? l?c v?i t?ng các ph?n t? b?ng 9

% 3. Áp d?ng l?c tuy?n tính (dùng Correlation ho?c Convolution)
g = imfilter(i, w, 'corr', 'replicate', 'same');  % L?c v?i Correlation, biên 'replicate', kích th??c 'same'

% 4. Hi?n th? ?nh g (k?t qu? l?c)
figure;
subplot(1, 2, 1), imshow(i), title('?nh g?c');
subplot(1, 2, 2), imshow(g), title('?nh sau khi l?c');



% %cách 2 
% % 1. ??c ?nh f
% i = imread('Fig0333(a)(test_pattern_blurring_orig).tif');  % ??c ?nh i
% 
% % N?u ?nh là ?nh màu, chuy?n thành ?nh xám
% if size(i, 3) == 3
%     i = rgb2gray(i);  % Chuy?n ?nh màu thành ?nh xám
% end
% 
% % 2. Xây d?ng m?t n? l?c w (m?t n? 3x3 v?i m?i ph?n t? = 1/9)
% w = ones(3, 3) / 9;  % M?t n? l?c v?i t?ng các ph?n t? b?ng 9
% 
% % 3. Ki?m tra t?t c? các tr??ng h?p v?i các giá tr? khác nhau c?a filtering_mode, boundary_options, size_options
% 
% filtering_modes = {'corr', 'conv'};  % Các giá tr? filtering_mode
% boundary_options = {'replicate', 'symmetric', 'circular'};  % Các giá tr? boundary_options
% size_options = {'full', 'same'};  % Các giá tr? size_options
% 
% % L?p qua các tr??ng h?p
% for fm = 1:length(filtering_modes)
%     for bo = 1:length(boundary_options)
%         for so = 1:length(size_options)
%             % Áp d?ng l?c v?i các tham s? hi?n t?i
%             g = imfilter(i, w, filtering_modes{fm}, boundary_options{bo}, size_options{so});
%             
%             % Hi?n th? k?t qu?
%             figure;
%             subplot(1, 2, 1), imshow(i), title('?nh g?c');
%             subplot(1, 2, 2), imshow(g), title(['L?c: ' filtering_modes{fm} ', Biên: ' boundary_options{bo} ', Kích th??c: ' size_options{so}]);
%         end
%     end
% end

