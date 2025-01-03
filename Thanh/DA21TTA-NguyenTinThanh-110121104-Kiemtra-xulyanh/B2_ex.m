function [averageVal, computationTime] = B2_ex(img)
    % Ki?m tra ?nh c� ph?i l� ?nh x�m hay kh�ng
    if size(img, 3) == 3
        error('?nh ??u v�o ph?i l� ?nh ?a c?p x�m.');
    end

    % B?t ??u ?o th?i gian
    t = tic;

    % Kh?i t?o t?ng gi� tr? pixel
    totalSum = 0;

    % Duy?t qua t?ng pixel b?ng v�ng l?p for
    [rows, cols] = size(img); % L?y k�ch th??c ?nh
    for i = 1:rows
        for j = 1:cols
            totalSum = totalSum + double(img(i, j)); % C?ng d?n gi� tr? pixel
        end
    end

    % T�nh trung b�nh c?ng
    numPixels = rows * cols; % S? l??ng pixel
    averageVal = totalSum / numPixels;

    % D?ng ?o th?i gian
    computationTime = toc(t);
end
