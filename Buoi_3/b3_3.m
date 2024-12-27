% Hàm b3_3
function [minValue, minColumn] = b3_3(img, r)
    % B?t ??u b?ng giá tr? l?n nh?t trong MATLAB
    minValue = Inf;
    minColumn = -1; % Kh?i t?o ch? s? c?t là -1 ?? bi?u th? ban ??u ch?a xác ??nh

    % L?y s? c?t c?a ?nh
    numCols = size(img, 2);

    % Vòng l?p qua các c?t trên hàng r
    for c = 1:numCols
        % Ki?m tra xem giá tr? t?i (r, c) nh? h?n minValue hay không
        if img(r, c) < minValue
            minValue = img(r, c); % C?p nh?t giá tr? nh? nh?t
            minColumn = c;        % C?p nh?t ch? s? c?t
        end
    end
end
