% ??c ?nh t? file
i = imread('Fig0333(a)(test_pattern_blurring_orig).tif');  

% N?u ?nh l� ?nh m�u, chuy?n th�nh ?nh x�m (grayscale)
if size(i, 3) == 3
    i = rgb2gray(i);  % Chuy?n ?nh m�u th�nh ?nh x�m
end

% X�y d?ng b? l?c w (m?t n? 3x3, m?i ph?n t? c� gi� tr? b?ng 1/3)
w = ones(3, 3) / 3;  % M?t n? 3x3 v?i gi� tr? 1/3

% �p d?ng b? l?c v�o ?nh (d�ng h�m imfilter ?? l?c ?nh)
g = imfilter(i, w, 'corr', 'replicate', 'same');  % 'corr' t??ng ???ng v?i correlation, 'replicate' x? l� bi�n ?nh, 'same' gi? k�ch th??c ?nh

% Hi?n th? ?nh g?c v� ?nh sau khi l?c
figure;
subplot(1, 2, 1); imshow(i); title('?nh g?c');
subplot(1, 2, 2); imshow(g); title('?nh sau khi l?c');
