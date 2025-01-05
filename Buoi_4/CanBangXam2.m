%B??c 1: ??c ?nh và ki?m tra ?nh màu
i = imread('Fig0316(4)(bottom_left).tif');

if size(i, 3) == 3
    i = rgb2gray(i);
end

%Dòng l?nh imread ??c ?nh t? file và l?u vào bi?n i.
%Ki?m tra xem ?nh có ph?i là ?nh màu RGB không (3 kênh màu). N?u ?úng, chuy?n ?nh v? ?nh xám b?ng hàm rgb2gray.

[N, M] = size(i); %N s? dòng, M s? c?t c?a ?nh i
L = 256;  % S? m?c xám, t?i ?a t? 0-255 có 256 m?c xám

%B??c 2: Tính l??c ?? xám g?c (Histogram)
%hist_orig là m?ng l?u s? l?n xu?t hi?n c?a t?ng m?c xám trong ?nh.
hist_orig = zeros(1, L); %S? l?n xu?t hi?n c?a 1 m?c xám c? th?
for x = 1:N
    for y = 1:M
        hist_orig(i(x, y) + 1) = hist_orig(i(x, y) + 1) + 1;
    end
end
%S? d?ng 2 vòng l?p for ?? duy?t qua t?ng pixel trong ?nh và c?p nh?t s? l?n xu?t hi?n c?a m?c xám t??ng ?ng.
%L?u ý, vì giá tr? c?a pixel b?t ??u t? 0 ??n 255 nên ph?i c?ng thêm 1 khi truy c?p vào m?ng hist_orig.

%B??c 3: Tính hàm phân ph?i tích l?y (CDF)
cdf = zeros(1, L); %Kh?i t?o m?ng CDF. T?ng m?c xám tích l?y t? 0 ??n k
cdf(1) = hist_orig(1); % Giá tr? ban ??u c?a CDF
for k = 2:L
    cdf(k) = cdf(k-1) + hist_orig(k); % C?p nh?t CDF cho m?i m?c xám
end
cdf = cdf / (N * M);  % Chu?n hóa CDF, sau khi chu?n hóa ta có t? l? xu?t hi?n c?a 1 m?c xám c? th?
%cdf(k) là t?ng t?n su?t c?a các m?c xám t? m?c 0 ??n k.
%Sau khi tính xong CDF, ta chu?n hóa nó b?ng cách chia cho t?ng s? pixel trong ?nh (N * M), giúp CDF tr? thành xác su?t c?a các m?c xám.

%B??c 4: Ánh x? CDF vào các m?c xám m?i
s = round(cdf * (L - 1));  % Ánh x? CDF vào kho?ng 0–255, Hàm round ???c s? d?ng ?? làm tròn k?t qu? v? s? nguyên

%B??c 5: T?o ?nh m?i sau khi cân b?ng
i_equalized = zeros(N, M, 'uint8');
for x = 1:N
    for y = 1:M
        i_equalized(x, y) = s(i(x, y) + 1);
    end
end
%Kh?i t?o ?nh m?i i_equalized ?? l?u k?t qu? sau khi cân b?ng l??c ?? xám.
%Duy?t qua t?ng pixel c?a ?nh và ánh x? giá tr? m?c xám g?c sang m?c xám m?i s? d?ng m?ng s.

%B??c 6: Tính histogram sau cân b?ng
hist_equalized = zeros(1, L);
for x = 1:N
    for y = 1:M
        hist_equalized(i_equalized(x, y) + 1) = hist_equalized(i_equalized(x, y) + 1) + 1;
    end
end
%Tính l?i l??c ?? xám cho ?nh sau khi cân b?ng (i_equalized).

%B??c 7: Hi?n th? k?t qu?
figure;
subplot(2, 2, 1); imshow(i); title('Anh goc');
subplot(2, 2, 2); bar(0:L-1, hist_orig); title('Histogram goc');
subplot(2, 2, 3); imshow(i_equalized); title('Anh sau can bang');
subplot(2, 2, 4); bar(0:L-1, hist_equalized); title('Histogram sau can bang');
% Hi?n th? 4 hình trong m?t c?a s?:
% ?nh g?c.
% L??c ?? xám g?c.
% ?nh sau khi cân b?ng.
% L??c ?? xám sau khi cân b?ng.