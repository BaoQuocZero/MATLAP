% a. N?p ?nh và gây nhi?u 'mu?i-tiêu'
i = imread('coins.png'); % N?p ?nh
i_noise_sp = imnoise(i, 'salt & pepper', 0.03); % Gây nhi?u mu?i-tiêu v?i 3%
figure;

subplot(2, 2, 1);
imshow(i);
title('?nh g?c');

subplot(2, 2, 2);
imshow(i_noise_sp);
title('?nh nhi?u mu?i-tiêu (3%)');

% b. L?c trung v? ?nh nhi?u mu?i-tiêu
i_filtered_sp = medfilt2(i_noise_sp); % L?c trung v?
subplot(2, 2, 3);
imshow(i_filtered_sp);
title('?nh sau l?c trung v? (nhi?u mu?i-tiêu)');

% c. Gây nhi?u 'Gaussian' và l?c ?nh
i_noise_gaussian = imnoise(i, 'gaussian', 0, 0.02); % Gây nhi?u Gaussian v?i 2%
i_filtered_gaussian = medfilt2(i_noise_gaussian); % L?c trung v? ?nh Gaussian
subplot(2, 2, 4);
imshow(i_filtered_gaussian);
title('?nh sau l?c trung v? (nhi?u Gaussian)');