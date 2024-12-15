% H�m b3_3
function [minValue, minColumn] = b3_3(img, r)
    % B?t ??u b?ng gi� tr? l?n nh?t trong MATLAB
    minValue = Inf;
    minColumn = -1; % Kh?i t?o ch? s? c?t l� -1 ?? bi?u th? ban ??u ch?a x�c ??nh

    % L?y s? c?t c?a ?nh
    numCols = size(img, 2);

    % V�ng l?p qua c�c c?t tr�n h�ng r
    for c = 1:numCols
        % Ki?m tra xem gi� tr? t?i (r, c) nh? h?n minValue hay kh�ng
        if img(r, c) < minValue
            minValue = img(r, c); % C?p nh?t gi� tr? nh? nh?t
            minColumn = c;        % C?p nh?t ch? s? c?t
        end
    end
end
