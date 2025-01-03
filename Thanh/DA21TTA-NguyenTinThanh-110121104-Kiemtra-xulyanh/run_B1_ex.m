img = imread('cameraman.tif');

[minValue, minColumn] = B1_ex(img, 2);

disp(['Giá tr? nh? nh?t: ', num2str(minValue)]);
disp(['C?t t??ng ?ng: ', num2str(minColumn)]);
