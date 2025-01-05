function histogram_equalization_process(image_path)
    % ??c ?nh
    img = imread(image_path);  % ??c ?nh t? ???ng d?n

    % N?u ?nh là ?nh màu, chuy?n sang ?nh xám
    if size(img, 3) == 3
        img = rgb2gray(img);
    end

    % Kích th??c ?nh
    [rows, cols] = size(img);

    % B??c 1: Tính histogram g?c
    histogram = zeros(1, 256);  % M?ng l?u tr? t?n su?t xu?t hi?n c?a các giá tr? xám (0-255)
    for i = 1:rows
        for j = 1:cols
            pixelValue = img(i, j);  % L?y giá tr? pixel t?i (i, j)
            histogram(pixelValue + 1) = histogram(pixelValue + 1) + 1;  % C?p nh?t t?n su?t
        end
    end

    % B??c 2: Tính CDF (Cumulative Distribution Function)
    cdf = cumsum(histogram) / (rows * cols);  % CDF chu?n hóa (tích l?y t?n su?t chia cho t?ng s? pixel)

    % B??c 3: Áp d?ng công th?c chuy?n ??i giá tr? xám b?ng CDF
    new_img = uint8(255 * cdf(double(img) + 1));  % Chuy?n ??i ?nh theo CDF

    % B??c 4: Hi?n th? ?nh g?c và ?nh sau khi cân b?ng histogram
    figure;
    subplot(1, 2, 1);
    imshow(img);
    title('?nh g?c');

    subplot(1, 2, 2);
    imshow(new_img);
    title('?nh sau khi cân b?ng histogram');

    % B??c 5: Tính histogram c?a ?nh m?i và v? bi?u ??
    new_histogram = zeros(1, 256);  % Tính l?i histogram cho ?nh ?ã cân b?ng
    for i = 1:rows
        for j = 1:cols
            pixelValue = new_img(i, j);
            new_histogram(pixelValue + 1) = new_histogram(pixelValue + 1) + 1;
        end
    end

    % V? bi?u ?? histogram tr??c và sau khi cân b?ng
    figure;
    subplot(1, 2, 1);
    bar(0:255, histogram);
    title('Histogram g?c');

    subplot(1, 2, 2);
    bar(0:255, new_histogram);
    title('Histogram sau khi cân b?ng');
end
