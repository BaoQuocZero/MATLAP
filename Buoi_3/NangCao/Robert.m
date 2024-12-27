function [computationTime, imgRobert] = Robert(img)
    % B?t ??u ?o th?i gian
    t = tic;
    
    % Ki?m tra xem ?nh c� ph?i ?nh m�u hay kh�ng v� chuy?n sang ?nh x�m n?u c?n
    if size(img, 3) == 3
        img = rgb2gray(img); % Chuy?n ?nh m�u sang ?nh x�m
    end

    % Chuy?n ?nh sang ki?u double ?? d? d�ng t�nh to�n
    img = double(img);

    % K�ch th??c c?a ?nh
    [numRows, numCols] = size(img);

    % B? l?c Robert theo h??ng X v� Y
    robert_x = [1 0; 0 -1];  % B? l?c Robert theo h??ng X
    robert_y = [0 1; -1 0];  % B? l?c Robert theo h??ng Y

    % Kh?i t?o ?nh ??u ra
    edge_robert = zeros(numRows, numCols);

    % Duy?t qua ?nh (tr? bi�n)
    for r = 1:numRows-1
        for c = 1:numCols-1
            % C?t c?a s? 2x2 quanh pixel (r, c)
            window = img(r:r+1, c:c+1);

            % �p d?ng b? l?c Robert theo h??ng X v� Y
            gradient_x = sum(sum(window .* robert_x));  % Gradient theo h??ng X
            gradient_y = sum(sum(window .* robert_y));  % Gradient theo h??ng Y

            % T�nh ?? l?n gradient (magnitude)
            edge_robert(r, c) = sqrt(gradient_x^2 + gradient_y^2);
        end
    end

    % Chuy?n ??i ?nh ??u ra v? ki?u uint8 n?u c?n
    imgRobert = uint8(edge_robert);

    % Hi?n th? ?nh bi�n Robert
    figure;
    imshow(imgRobert);
    title('Edge Detection using Robert Filter');
    
    % D?ng ?o th?i gian v� l?u k?t qu?
    computationTime = toc(t);
end
