%B??c 1: ??c ?nh v� ki?m tra ?nh m�u
i = imread('Fig0316(4)(bottom_left).tif');

if size(i, 3) == 3
    i = rgb2gray(i);
end

%D�ng l?nh imread ??c ?nh t? file v� l?u v�o bi?n i.
%Ki?m tra xem ?nh c� ph?i l� ?nh m�u RGB kh�ng (3 k�nh m�u). N?u ?�ng, chuy?n ?nh v? ?nh x�m b?ng h�m rgb2gray.

[N, M] = size(i); %N s? d�ng, M s? c?t c?a ?nh i
L = 256;  % S? m?c x�m, t?i ?a t? 0-255 c� 256 m?c x�m

%B??c 2: T�nh l??c ?? x�m g?c (Histogram)
%hist_orig l� m?ng l?u s? l?n xu?t hi?n c?a t?ng m?c x�m trong ?nh.
hist_orig = zeros(1, L); %S? l?n xu?t hi?n c?a 1 m?c x�m c? th?
for x = 1:N
    for y = 1:M
        hist_orig(i(x, y) + 1) = hist_orig(i(x, y) + 1) + 1;
    end
end
%S? d?ng 2 v�ng l?p for ?? duy?t qua t?ng pixel trong ?nh v� c?p nh?t s? l?n xu?t hi?n c?a m?c x�m t??ng ?ng.
%L?u �, v� gi� tr? c?a pixel b?t ??u t? 0 ??n 255 n�n ph?i c?ng th�m 1 khi truy c?p v�o m?ng hist_orig.

%B??c 3: T�nh h�m ph�n ph?i t�ch l?y (CDF)
cdf = zeros(1, L); %Kh?i t?o m?ng CDF. T?ng m?c x�m t�ch l?y t? 0 ??n k
cdf(1) = hist_orig(1); % Gi� tr? ban ??u c?a CDF
for k = 2:L
    cdf(k) = cdf(k-1) + hist_orig(k); % C?p nh?t CDF cho m?i m?c x�m
end
cdf = cdf / (N * M);  % Chu?n h�a CDF, sau khi chu?n h�a ta c� t? l? xu?t hi?n c?a 1 m?c x�m c? th?
%cdf(k) l� t?ng t?n su?t c?a c�c m?c x�m t? m?c 0 ??n k.
%Sau khi t�nh xong CDF, ta chu?n h�a n� b?ng c�ch chia cho t?ng s? pixel trong ?nh (N * M), gi�p CDF tr? th�nh x�c su?t c?a c�c m?c x�m.

%B??c 4: �nh x? CDF v�o c�c m?c x�m m?i
s = round(cdf * (L - 1));  % �nh x? CDF v�o kho?ng 0�255, H�m round ???c s? d?ng ?? l�m tr�n k?t qu? v? s? nguy�n

%B??c 5: T?o ?nh m?i sau khi c�n b?ng
i_equalized = zeros(N, M, 'uint8');
for x = 1:N
    for y = 1:M
        i_equalized(x, y) = s(i(x, y) + 1);
    end
end
%Kh?i t?o ?nh m?i i_equalized ?? l?u k?t qu? sau khi c�n b?ng l??c ?? x�m.
%Duy?t qua t?ng pixel c?a ?nh v� �nh x? gi� tr? m?c x�m g?c sang m?c x�m m?i s? d?ng m?ng s.

%B??c 6: T�nh histogram sau c�n b?ng
hist_equalized = zeros(1, L);
for x = 1:N
    for y = 1:M
        hist_equalized(i_equalized(x, y) + 1) = hist_equalized(i_equalized(x, y) + 1) + 1;
    end
end
%T�nh l?i l??c ?? x�m cho ?nh sau khi c�n b?ng (i_equalized).

%B??c 7: Hi?n th? k?t qu?
figure;
subplot(2, 2, 1); imshow(i); title('Anh goc');
subplot(2, 2, 2); bar(0:L-1, hist_orig); title('Histogram goc');
subplot(2, 2, 3); imshow(i_equalized); title('Anh sau can bang');
subplot(2, 2, 4); bar(0:L-1, hist_equalized); title('Histogram sau can bang');
% Hi?n th? 4 h�nh trong m?t c?a s?:
% ?nh g?c.
% L??c ?? x�m g?c.
% ?nh sau khi c�n b?ng.
% L??c ?? x�m sau khi c�n b?ng.