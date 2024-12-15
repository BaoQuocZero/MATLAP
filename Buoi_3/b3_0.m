% ??c ?nh ??u v�o
image = imread('Fig0335(a)(ckt_board_saltpep_prob_pt05).tif'); % Thay b?ng ???ng d?n ?nh c?a b?n
if size(image, 3) == 3
    image = rgb2gray(image); % Chuy?n ?nh m�u sang thang x�m n?u c?n
end

% Y�u c?u ng??i d�ng nh?p m?t n? b? l?c Lowpass
prompt = 'Nh?p k�ch th??c m?t n? b? l?c (v� d?: [3 3] t?c 3x3): ';
mask_size = input(prompt);

prompt = 'Nh?p gi� tr? c�c ph?n t? trong m?t n?, c�ch nhau b?ng kho?ng tr?ng (v� d?: [1 1 1; 1 1 1; 1 1 1]): ';
mask_values = input(prompt);

% Ki?m tra m?t n? h?p l?
if numel(mask_values) ~= prod(mask_size)
    error('S? l??ng gi� tr? kh�ng kh?p v?i k�ch th??c m?t n?. Vui l�ng ki?m tra l?i.');
end

% Chuy?n m?t n? th�nh ma tr?n v� chu?n h�a
kernel = reshape(mask_values, mask_size);
kernel = kernel / sum(kernel(:));

% �p d?ng b? l?c Lowpass
filtered_image = imfilter(image, kernel, 'same');

% Hi?n th? ?nh g?c v� ?nh ?� l?c
figure;

subplot(1, 2, 1);
imshow(image);
title('?nh g?c');

subplot(1, 2, 2);
imshow(filtered_image);
title('?nh sau khi l?c');