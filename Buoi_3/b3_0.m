% ??c ?nh ??u vào
image = imread('Fig0335(a)(ckt_board_saltpep_prob_pt05).tif'); % Thay b?ng ???ng d?n ?nh c?a b?n
if size(image, 3) == 3
    image = rgb2gray(image); % Chuy?n ?nh màu sang thang xám n?u c?n
end

% Yêu c?u ng??i dùng nh?p m?t n? b? l?c Lowpass
prompt = 'Nh?p kích th??c m?t n? b? l?c (ví d?: [3 3] t?c 3x3): ';
mask_size = input(prompt);

prompt = 'Nh?p giá tr? các ph?n t? trong m?t n?, cách nhau b?ng kho?ng tr?ng (ví d?: [1 1 1; 1 1 1; 1 1 1]): ';
mask_values = input(prompt);

% Ki?m tra m?t n? h?p l?
if numel(mask_values) ~= prod(mask_size)
    error('S? l??ng giá tr? không kh?p v?i kích th??c m?t n?. Vui lòng ki?m tra l?i.');
end

% Chuy?n m?t n? thành ma tr?n và chu?n hóa
kernel = reshape(mask_values, mask_size);
kernel = kernel / sum(kernel(:));

% Áp d?ng b? l?c Lowpass
filtered_image = imfilter(image, kernel, 'same');

% Hi?n th? ?nh g?c và ?nh ?ã l?c
figure;

subplot(1, 2, 1);
imshow(image);
title('?nh g?c');

subplot(1, 2, 2);
imshow(filtered_image);
title('?nh sau khi l?c');