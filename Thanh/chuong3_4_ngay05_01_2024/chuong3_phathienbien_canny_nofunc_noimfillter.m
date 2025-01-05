% ??c ?nh v�o
f = imread('Fig1005(a)(wirebond_mask).tif');

% Chuy?n ?nh sang ?nh x�m n?u ?nh l� ?nh m�u
if size(f, 3) == 3
    f = rgb2gray(f);
end

% B??c 1: L�m m?n ?nh v?i b? l?c Gaussian
sigma = 1;  % ?? l?ch chu?n c?a b? l?c Gaussian
h = fspecial('gaussian', [5, 5], sigma);  % T?o b? l?c Gaussian 5x5
f_smooth = zeros(size(f));  % Kh?i t?o ?nh l�m m?n

% Th?c hi?n ch?p th? c�ng gi?a ?nh v� b? l?c Gaussian
[rows, cols] = size(f);
[m, n] = size(h);  % K�ch th??c c?a b? l?c Gaussian
pad_size = floor(m/2);  % L??ng padding c?n thi?t

% Th�m padding cho ?nh ?? d? d�ng th?c hi?n ch?p ? bi�n ?nh
f_padded = padarray(f, [pad_size, pad_size]);

for i = 1:rows
    for j = 1:cols
        region = f_padded(i:i+m-1, j:j+n-1);  % L?y v�ng con 5x5 xung quanh pixel (i, j)
        f_smooth(i, j) = sum(sum(double(region) .* h));  % Ch?p ?nh v?i b? l?c Gaussian
    end
end

% B??c 2: T�nh to�n gradient c?a ?nh b?ng b? l?c Sobel
sobel_x = fspecial('sobel');  % B? l?c Sobel theo ph??ng x
sobel_y = sobel_x';  % B? l?c Sobel theo ph??ng y (chuy?n v? c?a Sobel x)

gradient_x = zeros(size(f_smooth));  % Kh?i t?o ?nh gradient theo ph??ng x
gradient_y = zeros(size(f_smooth));  % Kh?i t?o ?nh gradient theo ph??ng y

% Th?c hi?n ch?p th? c�ng gi?a ?nh l�m m?n v� b? l?c Sobel
for i = 1:rows
    for j = 1:cols
        region_x = f_padded(i:i+m-1, j:j+n-1);  % L?y v�ng con 3x3 cho Sobel x
        region_y = f_padded(i:i+m-1, j:j+n-1);  % L?y v�ng con 3x3 cho Sobel y
        
        gradient_x(i, j) = sum(sum(double(region_x) .* sobel_x));  % Ch?p ?nh v?i Sobel x
        gradient_y(i, j) = sum(sum(double(region_y) .* sobel_y));  % Ch?p ?nh v?i Sobel y
    end
end

% T�nh ?? l?n gradient v� h??ng c?a gradient
gradient_magnitude = sqrt(gradient_x.^2 + gradient_y.^2);
gradient_direction = atan2(gradient_y, gradient_x);

% B??c 3: Non-maximum suppression
nms = zeros(rows, cols);  % ?nh k?t qu? sau khi �p d?ng non-maximum suppression

for i = 2:rows-1
    for j = 2:cols-1
        % L?y h??ng gradient theo ??n v? 45 ?? (b?c: 0, 45, 90, 135)
        angle = gradient_direction(i, j) * 180 / pi;  % ??i t? radian sang ??
        angle = mod(angle, 180);  % L�m cho g�c trong kho?ng [0, 180]
        
        % Ki?m tra h??ng v� so s�nh v?i c�c pixel li?n k?
        if (angle >= 0 && angle < 22.5) || (angle >= 157.5 && angle <= 180)
            % H??ng 0 ?? (ngang), so s�nh v?i pixel tr�i v� ph?i
            neighbor1 = gradient_magnitude(i, j+1);
            neighbor2 = gradient_magnitude(i, j-1);
        elseif (angle >= 22.5 && angle < 67.5)
            % H??ng 45 ??, so s�nh v?i pixel ch�o tr�n ph?i v� ch�o d??i tr�i
            neighbor1 = gradient_magnitude(i-1, j+1);
            neighbor2 = gradient_magnitude(i+1, j-1);
        elseif (angle >= 67.5 && angle < 112.5)
            % H??ng 90 ?? (d?c), so s�nh v?i pixel tr�n v� d??i
            neighbor1 = gradient_magnitude(i+1, j);
            neighbor2 = gradient_magnitude(i-1, j);
        elseif (angle >= 112.5 && angle < 157.5)
            % H??ng 135 ??, so s�nh v?i pixel ch�o tr�n tr�i v� ch�o d??i ph?i
            neighbor1 = gradient_magnitude(i-1, j-1);
            neighbor2 = gradient_magnitude(i+1, j+1);
        end
        
        % N?u ?? l?n gradient t?i pixel hi?n t?i l?n h?n c�c pixel k? b�n, gi? l?i
        if (gradient_magnitude(i, j) >= neighbor1) && (gradient_magnitude(i, j) >= neighbor2)
            nms(i, j) = gradient_magnitude(i, j);
        else
            nms(i, j) = 0;
        end
    end
end

% B??c 4: Hysteresis Thresholding
% Ch?n ng??ng cao v� th?p
high_threshold = 0.3 * max(nms(:));  % Ng??ng cao (30% gi� tr? l?n nh?t)
low_threshold = 0.1 * max(nms(:));   % Ng??ng th?p (10% gi� tr? l?n nh?t)

% Ph�t hi?n bi�n m?nh v� y?u
final_edges = zeros(rows, cols);  % ?nh bi�n cu?i c�ng

for i = 1:rows
    for j = 1:cols
        if nms(i, j) >= high_threshold
            final_edges(i, j) = 1;  % Bi�n m?nh
        elseif nms(i, j) >= low_threshold
            % N?u l� bi�n y?u, ki?m tra pixel k? b�n (n?i bi�n)
            if any(nms(i-1:i+1, j-1:j+1) >= high_threshold)
                final_edges(i, j) = 1;  % Bi�n y?u ???c n?i th�nh bi�n m?nh
            end
        end
    end
end

% Hi?n th? k?t qu?
subplot(1, 2, 1);
imshow(final_edges);
title('Bi�n ph�t hi?n v?i Canny (kh�ng d�ng imfilter ho?c edge())');
