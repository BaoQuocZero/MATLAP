function [minValue, minColumn] = B1_ex(img, r)
    if size(img, 3) == 3
        img = rgb2gray(img);
    end

    % Ki?m tra r h?p l?
    if r > size(img, 1) || r < 1
        error('H�ng v??t qu� s? l??ng h�ng trong ?nh.');
    end

    % Kh?i t?o gi� tr? nh? nh?t v� c?t
    row = img(r, :);
    minValue = row(1);
    minColumn = 1;

    % T�m gi� tr? nh? nh?t b?ng v�ng l?p for
    for c = 2:size(img, 2)
        if row(c) < minValue
            minValue = row(c);
            minColumn = c;
        end
    end
end



