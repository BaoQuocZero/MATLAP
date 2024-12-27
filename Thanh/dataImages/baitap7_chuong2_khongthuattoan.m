% B??c 1: ??c ?nh v� chuy?n v? ?nh x�m n?u c?n
I1 = imread('pillsetc.png');
I2 = imread('tape.png');
I3 = imread('coins.png');
I4 = imread('eight.tif');

% N?u ?nh l� ?nh m�u, chuy?n th�nh ?nh x�m
if size(I1, 3) == 3
    I1 = rgb2gray(I1);
end
if size(I2, 3) == 3
    I2 = rgb2gray(I2);
end
if size(I3, 3) == 3
    I3 = rgb2gray(I3);
end
if size(I4, 3) == 3
    I4 = rgb2gray(I4);
end

% B??c 2: T�nh to�n histogram c?a ?nh
n1 = hist(I1(:), 0:255); % T�nh histogram cho ?nh I1
n2 = hist(I2(:), 0:255); % T�nh histogram cho ?nh I2
n3 = hist(I3(:), 0:255); % T�nh histogram cho ?nh I3
n4 = hist(I4(:), 0:255); % T�nh histogram cho ?nh I4

% B??c 3: Ch?n ng??ng th? c�ng ho?c t? ??ng
% ? ?�y, ch�ng ta c� th? ch?n ng??ng theo ph??ng ph�p trung b�nh c?a gi� tr? x�m
threshold1 = mean(I1(:)); % T�nh ng??ng l� gi� tr? trung b�nh c?a ?nh I1
threshold2 = mean(I2(:)); % T�nh ng??ng cho ?nh I2
threshold3 = mean(I3(:)); % T�nh ng??ng cho ?nh I3
threshold4 = mean(I4(:)); % T�nh ng??ng cho ?nh I4

% B??c 4: T?o ?nh nh? ph�n t? ng??ng ?� ch?n
BW1 = I1 > threshold1; % �p d?ng ng??ng cho ?nh I1
BW2 = I2 > threshold2; % �p d?ng ng??ng cho ?nh I2
BW3 = I3 > threshold3; % �p d?ng ng??ng cho ?nh I3
BW4 = I4 > threshold4; % �p d?ng ng??ng cho ?nh I4

% B??c 5: Hi?n th? k?t qu?
figure;

% Hi?n th? ?nh g?c v� ?nh nh? ph�n
subplot(2, 3, 1), imshow(I1), title('?nh pillsetc.png');
subplot(2, 3, 2), imshow(BW1), title('?nh nh? ph�n pillsetc.png');

subplot(2, 3, 3), imshow(I2), title('?nh tape.png');
subplot(2, 3, 4), imshow(BW2), title('?nh nh? ph�n tape.png');

subplot(2, 3, 5), imshow(I3), title('?nh coins.png');
subplot(2, 3, 6), imshow(BW3), title('?nh nh? ph�n coins.png');

% Th�m ?nh cho eight.tif n?u c?n thi?t
figure;
subplot(1, 2, 1), imshow(I4), title('?nh eight.tif');
subplot(1, 2, 2), imshow(BW4), title('?nh nh? ph�n eight.tif');
