clc; 
clear; 
close all;

% ??c ?nh màu
I = imread('cola2.png');
I = double(I); % Chuy?n sang ki?u double ?? x? lý

% Tách kênh màu R, G, B
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

% Cân b?ng histogram cho t?ng kênh màu
R_eq = equalize_channel(R);
G_eq = equalize_channel(G);
B_eq = equalize_channel(B);

% Ghép l?i thành ?nh màu sau khi cân b?ng
I_eq = cat(3, uint8(R_eq), uint8(G_eq), uint8(B_eq));

% Hi?n th? ?nh g?c và ?nh ?ã cân b?ng
figure;
subplot(2,2,1);
imshow(uint8(I));
title('?nh màu g?c');

subplot(2,2,2);
imshow(I_eq);
title('?nh màu sau khi cân b?ng');

% Hi?n th? histogram tr??c và sau cân b?ng c?a kênh ?? (R)
subplot(2,2,3);
histogram(uint8(R(:)), 256, 'FaceColor', 'r');
title('Histogram R g?c');

subplot(2,2,4);
histogram(uint8(R_eq(:)), 256, 'FaceColor', 'r');
title('Histogram R sau cân b?ng');

% ??nh ngh?a hàm n?m cu?i file
function eq_channel = equalize_channel(channel)
    [rows, cols] = size(channel);
    hist_vals = zeros(1, 256);
    
    % Tính histogram
    for x = 1:rows
        for y = 1:cols
            pixel_value = channel(x, y) + 1;
            hist_vals(pixel_value) = hist_vals(pixel_value) + 1;
        end
    end

    % Tính CDF (Hàm phân ph?i tích l?y)
    cdf = cumsum(hist_vals) / sum(hist_vals);

    % Ánh x? m?c xám m?i
    eq_channel = zeros(size(channel));
    for x = 1:rows
        for y = 1:cols
            eq_channel(x, y) = round(cdf(channel(x, y) + 1) * 255);
        end
    end
end