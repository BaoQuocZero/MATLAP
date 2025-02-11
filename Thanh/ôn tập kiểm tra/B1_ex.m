function [minValue, minColumn] = B1_ex(img, r)
    if size(img, 3) == 3
        img = rgb2gray(img);
    end

    % Ki?m tra r h?p l?
    if r > size(img, 1) || r < 1
        error('Hàng v??t quá s? l??ng hàng trong ?nh.');
    end

    % Kh?i t?o giá tr? nh? nh?t và c?t
    row = img(r, :);
    minValue = row(1);
    minColumn = 1;

    % Tìm giá tr? nh? nh?t b?ng vòng l?p for
    for c = 2:size(img, 2)
        if row(c) < minValue
            minValue = row(c);
            minColumn = c;
        end
    end
end



