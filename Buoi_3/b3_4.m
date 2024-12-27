function [averageVal, computationTime] = b3_4(img)
    % B?t ??u ?o th?i gian
    t = tic;
    
    % Kh?i t?o bi?n t?ng giá tr? các pixel
    totalSum = 0;
    
    % L?y kích th??c c?a ?nh img
    [numRows, numCols] = size(img);
    
    % Quét toàn b? ?nh và tính t?ng giá tr? các pixel
    for r = 1:numRows
        for c = 1:numCols
            totalSum = totalSum + img(r, c);
        end
    end
    
    % Tính giá tr? trung bình c?ng
    totalPixels = numRows * numCols;
    averageVal = totalSum / totalPixels;
    
    % D?ng ?o th?i gian và l?u k?t qu?
    computationTime = toc(t);
end
