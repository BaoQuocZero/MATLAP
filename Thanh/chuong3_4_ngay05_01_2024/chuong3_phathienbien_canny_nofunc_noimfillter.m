% ??c ?nh vào
f = imread('Fig1005(a)(wirebond_mask).tif');

% Chuy?n ?nh sang ?nh xám n?u ?nh là ?nh màu
if size(f, 3) == 3
    f = rgb2gray(f);
end

% B??c 1: Làm m?n ?nh v?i b? l?c Gaussian
sigma = 1;  % ?? l?ch chu?n c?a b? l?c Gaussian
h = fspecial('gaussian', [5, 5], sigma);  % T?o b? l?c Gaussian 5x5
f_smooth = zeros(size(f));  % Kh?i t?o ?nh làm m?n

% Th?c hi?n ch?p th? công gi?a ?nh và b? l?c Gaussian
[rows, cols] = size(f);
[m, n] = size(h);  % Kích th??c c?a b? l?c Gaussian
pad_size = floor(m/2);  % L??ng padding c?n thi?t

% Thêm padding cho ?nh ?? d? dàng th?c hi?n ch?p ? biên ?nh
f_padded = padarray(f, [pad_size, pad_size]);

for i = 1:rows
    for j = 1:cols
        region = f_padded(i:i+m-1, j:j+n-1);  % L?y vùng con 5x5 xung quanh pixel (i, j)
        f_smooth(i, j) = sum(sum(double(region) .* h));  % Ch?p ?nh v?i b? l?c Gaussian
    end
end

% B??c 2: Tính toán gradient c?a ?nh b?ng b? l?c Sobel
sobel_x = fspecial('sobel');  % B? l?c Sobel theo ph??ng x
sobel_y = sobel_x';  % B? l?c Sobel theo ph??ng y (chuy?n v? c?a Sobel x)

gradient_x = zeros(size(f_smooth));  % Kh?i t?o ?nh gradient theo ph??ng x
gradient_y = zeros(size(f_smooth));  % Kh?i t?o ?nh gradient theo ph??ng y

% Th?c hi?n ch?p th? công gi?a ?nh làm m?n và b? l?c Sobel
for i = 1:rows
    for j = 1:cols
        region_x = f_padded(i:i+m-1, j:j+n-1);  % L?y vùng con 3x3 cho Sobel x
        region_y = f_padded(i:i+m-1, j:j+n-1);  % L?y vùng con 3x3 cho Sobel y
        
        gradient_x(i, j) = sum(sum(double(region_x) .* sobel_x));  % Ch?p ?nh v?i Sobel x
        gradient_y(i, j) = sum(sum(double(region_y) .* sobel_y));  % Ch?p ?nh v?i Sobel y
    end
end

% Tính ?? l?n gradient và h??ng c?a gradient
gradient_magnitude = sqrt(gradient_x.^2 + gradient_y.^2);
gradient_direction = atan2(gradient_y, gradient_x);

% B??c 3: Non-maximum suppression
nms = zeros(rows, cols);  % ?nh k?t qu? sau khi áp d?ng non-maximum suppression

for i = 2:rows-1
    for j = 2:cols-1
        % L?y h??ng gradient theo ??n v? 45 ?? (b?c: 0, 45, 90, 135)
        angle = gradient_direction(i, j) * 180 / pi;  % ??i t? radian sang ??
        angle = mod(angle, 180);  % Làm cho góc trong kho?ng [0, 180]
        
        % Ki?m tra h??ng và so sánh v?i các pixel li?n k?
        if (angle >= 0 && angle < 22.5) || (angle >= 157.5 && angle <= 180)
            % H??ng 0 ?? (ngang), so sánh v?i pixel trái và ph?i
            neighbor1 = gradient_magnitude(i, j+1);
            neighbor2 = gradient_magnitude(i, j-1);
        elseif (angle >= 22.5 && angle < 67.5)
            % H??ng 45 ??, so sánh v?i pixel chéo trên ph?i và chéo d??i trái
            neighbor1 = gradient_magnitude(i-1, j+1);
            neighbor2 = gradient_magnitude(i+1, j-1);
        elseif (angle >= 67.5 && angle < 112.5)
            % H??ng 90 ?? (d?c), so sánh v?i pixel trên và d??i
            neighbor1 = gradient_magnitude(i+1, j);
            neighbor2 = gradient_magnitude(i-1, j);
        elseif (angle >= 112.5 && angle < 157.5)
            % H??ng 135 ??, so sánh v?i pixel chéo trên trái và chéo d??i ph?i
            neighbor1 = gradient_magnitude(i-1, j-1);
            neighbor2 = gradient_magnitude(i+1, j+1);
        end
        
        % N?u ?? l?n gradient t?i pixel hi?n t?i l?n h?n các pixel k? bên, gi? l?i
        if (gradient_magnitude(i, j) >= neighbor1) && (gradient_magnitude(i, j) >= neighbor2)
            nms(i, j) = gradient_magnitude(i, j);
        else
            nms(i, j) = 0;
        end
    end
end

% B??c 4: Hysteresis Thresholding
% Ch?n ng??ng cao và th?p
high_threshold = 0.3 * max(nms(:));  % Ng??ng cao (30% giá tr? l?n nh?t)
low_threshold = 0.1 * max(nms(:));   % Ng??ng th?p (10% giá tr? l?n nh?t)

% Phát hi?n biên m?nh và y?u
final_edges = zeros(rows, cols);  % ?nh biên cu?i cùng

for i = 1:rows
    for j = 1:cols
        if nms(i, j) >= high_threshold
            final_edges(i, j) = 1;  % Biên m?nh
        elseif nms(i, j) >= low_threshold
            % N?u là biên y?u, ki?m tra pixel k? bên (n?i biên)
            if any(nms(i-1:i+1, j-1:j+1) >= high_threshold)
                final_edges(i, j) = 1;  % Biên y?u ???c n?i thành biên m?nh
            end
        end
    end
end

% Hi?n th? k?t qu?
subplot(1, 2, 1);
imshow(final_edges);
title('Biên phát hi?n v?i Canny (không dùng imfilter ho?c edge())');
