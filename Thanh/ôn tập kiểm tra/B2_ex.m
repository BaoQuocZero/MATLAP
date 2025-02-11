function [averageVal, computationTime] = B2_ex(img)
    % Ki?m tra ?nh có ph?i là ?nh xám hay không
    if size(img, 3) == 3
        error('?nh ??u vào ph?i là ?nh ?a c?p xám.');
    end

    % B?t ??u ?o th?i gian
    t = tic;

    % Kh?i t?o t?ng giá tr? pixel
    totalSum = 0;

    % Duy?t qua t?ng pixel b?ng vòng l?p for
    [rows, cols] = size(img); % L?y kích th??c ?nh
    for i = 1:rows
        for j = 1:cols
            totalSum = totalSum + double(img(i, j)); % C?ng d?n giá tr? pixel
        end
    end

    % Tính trung bình c?ng
    numPixels = rows * cols; % S? l??ng pixel
    averageVal = totalSum / numPixels;

    % D?ng ?o th?i gian
    computationTime = toc(t);
end
