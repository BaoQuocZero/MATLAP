
% 2. Ph�t hi?n bi�n trong ?nh m?c x�m
function detect_edges()
    % ??c ?nh m?c x�m
    img = imread('Lena512.bmp');
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
img = double(img);
    % Hi?n th? c�c l?a ch?n
    disp('Ch?n ph??ng ph�p ph�t hi?n bi�n:');
    disp('1. Sobel');
    disp('2. Prewitt');
    disp('3. Robert');
    method_choice = input('L?a ch?n: ');

    switch method_choice
        case 1
            Gx = fspecial('sobel');
            Gy = Gx';
        case 2
            Gx = [-1 0 1; -1 0 1; -1 0 1];
            Gy = [1 1 1; 0 0 0; -1 -1 -1];
        case 3
            Gx = [1 0; 0 -1];
            Gy = [0 1; -1 0];
        otherwise
            disp('L?a ch?n kh�ng h?p l?.');
            return;
    end

    Ix = imfilter(double(img), Gx, 'replicate');
    Iy = imfilter(double(img), Gy, 'replicate');
    magnitude = sqrt(Ix.^2 + Iy.^2);

    imshow(uint8(magnitude));
    title('?nh ph�t hi?n bi�n');
end