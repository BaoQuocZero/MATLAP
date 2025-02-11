% ??c ?nh màu
image = imread('toycars1.png');

% Ki?m tra n?u là ?nh màu
if size(image, 3) ~= 3
    error('?nh ??u vào không ph?i ?nh màu.');
end

% Tách các kênh màu (R, G, B)
R = image(:, :, 1);
G = image(:, :, 2);
B = image(:, :, 3);

% Hàm cân b?ng l??c ?? th? công
function equalized_channel = manual_hist_equalization(channel)
    % Tính histogram
    [counts, ~] = imhist(channel);
    % Tính CDF
    cdf = cumsum(counts) / numel(channel);
    % T?o ánh x? c??ng ?? m?i
    new_values = uint8(255 * cdf);
    % Thay th? các giá tr? pixel b?ng ánh x? m?i
    equalized_channel = new_values(channel + 1);
end

% Cân b?ng t?ng kênh màu
R_eq = manual_hist_equalization(R);
G_eq = manual_hist_equalization(G);
B_eq = manual_hist_equalization(B);

% Ghép các kênh l?i thành ?nh màu ?ã cân b?ng
equalized_image = cat(3, R_eq, G_eq, B_eq);

% V? ?nh và l??c ?? tr??c/sau cân b?ng
figure;

% ?nh g?c
subplot(2, 3, 1);
imshow(image);
title('?nh g?c');

% L??c ?? màu g?c
subplot(2, 3, 2);
imhist(R); hold on;
imhist(G);
imhist(B); hold off;
title('L??c ?? màu g?c');

% ?nh sau cân b?ng
subplot(2, 3, 4);
imshow(equalized_image);
title('?nh sau cân b?ng');

% L??c ?? màu sau cân b?ng
subplot(2, 3, 5);
imhist(R_eq); hold on;
imhist(G_eq);
imhist(B_eq); hold off;
title('L??c ?? màu sau cân b?ng');

% L?u ?nh ?ã cân b?ng
imwrite(equalized_image, 'output_equalized_manual.jpg');
disp('?nh màu ?ã cân b?ng l??c ?? ???c l?u thành công.');
