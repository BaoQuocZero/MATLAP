clc;
clear;

% ??c ?nh
img = imread('cameraman.tif');  % Thay b?ng ???ng d?n ?nh c?a b?n

% Menu l?a ch?n
disp('Ch?n m?t trong các tùy ch?n sau:');
disp('1: S? d?ng b? l?c Sobel');
disp('2: S? d?ng b? l?c Prewitt');
disp('3: S? d?ng b? l?c Robert');
disp('4: Hi?n th? t?t c? k?t qu?');

choice = input('Nh?p l?a ch?n c?a b?n: ');

% Th?c hi?n các l?a ch?n
switch choice
    case 1
        [computationTime, imgSobel] = Sobel(img);
        disp(['Th?i gian tính toán v?i Sobel: ', num2str(computationTime), ' giây']);
        figure;
        imshow(imgSobel);
        title('Edge Detection using Sobel');
        
    case 2
        [computationTime, imgPrewitt] = Prewitt(img);
        disp(['Th?i gian tính toán v?i Prewitt: ', num2str(computationTime), ' giây']);
        figure;
        imshow(imgPrewitt);
        title('Edge Detection using Prewitt');
        
    case 3
        [computationTime, imgRobert] = Robert(img);
        disp(['Th?i gian tính toán v?i Robert: ', num2str(computationTime), ' giây']);
        figure;
        imshow(imgRobert);
        title('Edge Detection using Robert');
        
    case 4
        % Hi?n th? t?t c? k?t qu?
        [computationTimeSobel, imgSobel] = Sobel(img);
        disp(['Th?i gian tính toán v?i Sobel: ', num2str(computationTimeSobel), ' giây']);
        
        [computationTimePrewitt, imgPrewitt] = Prewitt(img);
        disp(['Th?i gian tính toán v?i Prewitt: ', num2str(computationTimePrewitt), ' giây']);
        
        [computationTimeRobert, imgRobert] = Robert(img);
        disp(['Th?i gian tính toán v?i Robert: ', num2str(computationTimeRobert), ' giây']);
        
        % Hi?n th? t?t c? ?nh biên
        figure;
        subplot(1, 3, 1);
        imshow(imgSobel);
        title('Edge Detection using Sobel');
        
        subplot(1, 3, 2);
        imshow(imgPrewitt);
        title('Edge Detection using Prewitt');
        
        subplot(1, 3, 3);
        imshow(imgRobert);
        title('Edge Detection using Robert');
        
    otherwise
        disp('L?a ch?n không h?p l?!');
end
