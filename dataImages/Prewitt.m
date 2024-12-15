function [computationTime, imgPrewitt] = Prewitt(img)
% B?t ??u ?o th?i gian
    t = tic;
    % Ki?m tra xem ?nh c� ph?i ?nh m�u hay kh�ng v� chuy?n sang ?nh x�m n?u c?n
    if size(img, 3) == 3
        img = rgb2gray(img); % Chuy?n ?nh m�u sang ?nh x�m
    end

    % Chuy?n ?nh sang ki?u double ?? d? d�ng t�nh to�n
    img = double(img);

    % L?y k�ch th??c c?a ?nh
    [numRows, numCols] = size(img);

    % B? l?c Prewitt theo h??ng X v� Y
    prewitt_x = [-1 0 1; -1 0 1; -1 0 1];  % B? l?c Prewitt theo h??ng X
    prewitt_y = [-1 -1 -1; 0 0 0; 1 1 1];  % B? l?c Prewitt theo h??ng Y

    % Kh?i t?o ?nh ??u ra
    edge_prewitt = zeros(numRows, numCols);

    % B�n k�nh c?a b? l?c (1 pixel cho b? l?c 3x3)
    radius = 1;

    % Duy?t qua ?nh (tr? bi�n)
    for r = radius+1 : numRows-radius
        for c = radius+1 : numCols-radius
            % C?t c?a s? 3x3 quanh pixel (r, c)
            window = img(r-1:r+1, c-1:c+1);

            % �p d?ng b? l?c Prewitt theo h??ng X v� Y
            gradient_x = sum(sum(window .* prewitt_x));  % Gradient theo h??ng X
            gradient_y = sum(sum(window .* prewitt_y));  % Gradient theo h??ng Y

            % T�nh ?? l?n gradient (magnitude)
            edge_prewitt(r, c) = sqrt(gradient_x^2 + gradient_y^2);
        end
    end

    % Chuy?n ??i ?nh ??u ra v? ki?u uint8 n?u c?n
    edge_prewitt = uint8(edge_prewitt);

    % Hi?n th? k?t qu?
    imshow(edge_prewitt);
    title('Edge Detection using Prewitt Filter');
    
    % D?ng ?o th?i gian v� l?u k?t qu?
    imgPrewitt = edge_prewitt;
    computationTime = toc(t);
end
