function [averageVal, computationTime] = b3_4(img)
    % B?t ??u ?o th?i gian
    t = tic;
    
    % Kh?i t?o bi?n t?ng gi� tr? c�c pixel
    totalSum = 0;
    
    % L?y k�ch th??c c?a ?nh img
    [numRows, numCols] = size(img);
    
    % Qu�t to�n b? ?nh v� t�nh t?ng gi� tr? c�c pixel
    for r = 1:numRows
        for c = 1:numCols
            totalSum = totalSum + img(r, c);
        end
    end
    
    % T�nh gi� tr? trung b�nh c?ng
    totalPixels = numRows * numCols;
    averageVal = totalSum / totalPixels;
    
    % D?ng ?o th?i gian v� l?u k?t qu?
    computationTime = toc(t);
end
