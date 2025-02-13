clc; 
clear; 
close all;

% ??c ?nh m�u
I = imread('cola2.png');
I = double(I); % Chuy?n sang ki?u double ?? x? l�

% T�ch k�nh m�u R, G, B
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

% C�n b?ng histogram cho t?ng k�nh m�u
R_eq = equalize_channel(R);
G_eq = equalize_channel(G);
B_eq = equalize_channel(B);

% Gh�p l?i th�nh ?nh m�u sau khi c�n b?ng
I_eq = cat(3, uint8(R_eq), uint8(G_eq), uint8(B_eq));

% Hi?n th? ?nh g?c v� ?nh ?� c�n b?ng
figure;
subplot(2,2,1);
imshow(uint8(I));
title('?nh m�u g?c');

subplot(2,2,2);
imshow(I_eq);
title('?nh m�u sau khi c�n b?ng');

% Hi?n th? histogram tr??c v� sau c�n b?ng c?a k�nh ?? (R)
subplot(2,2,3);
histogram(uint8(R(:)), 256, 'FaceColor', 'r');
title('Histogram R g?c');

subplot(2,2,4);
histogram(uint8(R_eq(:)), 256, 'FaceColor', 'r');
title('Histogram R sau c�n b?ng');

% ??nh ngh?a h�m n?m cu?i file
function eq_channel = equalize_channel(channel)
    [rows, cols] = size(channel);
    hist_vals = zeros(1, 256);
    
    % T�nh histogram
    for x = 1:rows
        for y = 1:cols
            pixel_value = channel(x, y) + 1;
            hist_vals(pixel_value) = hist_vals(pixel_value) + 1;
        end
    end

    % T�nh CDF (H�m ph�n ph?i t�ch l?y)
    cdf = cumsum(hist_vals) / sum(hist_vals);

    % �nh x? m?c x�m m?i
    eq_channel = zeros(size(channel));
    for x = 1:rows
        for y = 1:cols
            eq_channel(x, y) = round(cdf(channel(x, y) + 1) * 255);
        end
    end
end