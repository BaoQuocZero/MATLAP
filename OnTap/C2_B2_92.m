% ??c ?nh t? file
i = imread('Fig0333(a)(test_pattern_blurring_orig).tif');  

% N?u ?nh là ?nh màu, chuy?n thành ?nh xám (grayscale)
if size(i, 3) == 3
    i = rgb2gray(i);  % Chuy?n ?nh màu thành ?nh xám
end

% Xây d?ng b? l?c w (m?t n? 3x3, m?i ph?n t? có giá tr? b?ng 1/3)
w = ones(3, 3) / 3;  % M?t n? 3x3 v?i giá tr? 1/3

% Áp d?ng b? l?c vào ?nh (dùng hàm imfilter ?? l?c ?nh)
g = imfilter(i, w, 'corr', 'replicate', 'same');  % 'corr' t??ng ???ng v?i correlation, 'replicate' x? lý biên ?nh, 'same' gi? kích th??c ?nh

% Hi?n th? ?nh g?c và ?nh sau khi l?c
figure;
subplot(1, 2, 1); imshow(i); title('?nh g?c');
subplot(1, 2, 2); imshow(g); title('?nh sau khi l?c');
