i = imread('Fig0316(4)(bottom_left).tif');
imshow(i);

figure;
imhist(i);
title('L??c ?? xám c?a ?nh i');
canbanganh = histeq(i, 256); 
% Hi?n th? ?nh g?c và ?nh ?ã cân b?ng
figure;
subplot(1, 2, 1); 
imshow(i); 
title('?nh g?c');
subplot(1, 2, 2); 
imshow(canbanganh);
title('?nh sau khi cân b?ng l??c ?? xám');

% V? l??c ?? xám c?a ?nh g?c và ?nh ?ã cân b?ng
figure;
subplot(1, 2, 1); 
imhist(i); 
title('L??c ?? xám c?a ?nh g?c');
subplot(1, 2, 2);
imhist(canbanganh); 
title('L??c ?? xám c?a ?nh sau khi cân b?ng');


