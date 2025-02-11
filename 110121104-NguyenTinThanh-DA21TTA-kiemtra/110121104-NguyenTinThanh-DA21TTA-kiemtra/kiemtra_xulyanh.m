% ??c ?nh m�u
image = imread('toycars1.png');

% Ki?m tra n?u l� ?nh m�u
if size(image, 3) ~= 3
    error('?nh ??u v�o kh�ng ph?i ?nh m�u.');
end

% T�ch c�c k�nh m�u (R, G, B)
R = image(:, :, 1);
G = image(:, :, 2);
B = image(:, :, 3);

% H�m c�n b?ng l??c ?? th? c�ng
function equalized_channel = manual_hist_equalization(channel)
    % T�nh histogram
    [counts, ~] = imhist(channel);
    % T�nh CDF
    cdf = cumsum(counts) / numel(channel);
    % T?o �nh x? c??ng ?? m?i
    new_values = uint8(255 * cdf);
    % Thay th? c�c gi� tr? pixel b?ng �nh x? m?i
    equalized_channel = new_values(channel + 1);
end

% C�n b?ng t?ng k�nh m�u
R_eq = manual_hist_equalization(R);
G_eq = manual_hist_equalization(G);
B_eq = manual_hist_equalization(B);

% Gh�p c�c k�nh l?i th�nh ?nh m�u ?� c�n b?ng
equalized_image = cat(3, R_eq, G_eq, B_eq);

% V? ?nh v� l??c ?? tr??c/sau c�n b?ng
figure;

% ?nh g?c
subplot(2, 3, 1);
imshow(image);
title('?nh g?c');

% L??c ?? m�u g?c
subplot(2, 3, 2);
imhist(R); hold on;
imhist(G);
imhist(B); hold off;
title('L??c ?? m�u g?c');

% ?nh sau c�n b?ng
subplot(2, 3, 4);
imshow(equalized_image);
title('?nh sau c�n b?ng');

% L??c ?? m�u sau c�n b?ng
subplot(2, 3, 5);
imhist(R_eq); hold on;
imhist(G_eq);
imhist(B_eq); hold off;
title('L??c ?? m�u sau c�n b?ng');

% L?u ?nh ?� c�n b?ng
imwrite(equalized_image, 'output_equalized_manual.jpg');
disp('?nh m�u ?� c�n b?ng l??c ?? ???c l?u th�nh c�ng.');
