function histogram_equalization_histeq(image_path)
    % ??c ?nh t? ???ng d?n
    img = imread(image_path);

    % N?u ?nh là ?nh màu, chuy?n sang ?nh xám
    if size(img, 3) == 3
        img = rgb2gray(img);
    end

    % B??c 1: Cân b?ng histogram s? d?ng hàm histeq
    new_img = histeq(img);

    % B??c 2: Hi?n th? ?nh g?c và ?nh sau khi cân b?ng histogram
    figure;
    subplot(1, 2, 1);
    imshow(img);
    title('?nh g?c');

    subplot(1, 2, 2);
    imshow(new_img);
    title('?nh sau khi cân b?ng histogram');

    % B??c 3: V? histogram tr??c và sau khi cân b?ng
    figure;
    subplot(1, 2, 1);
    imhist(img);
    title('Histogram g?c');

    subplot(1, 2, 2);
    imhist(new_img);
    title('Histogram sau khi cân b?ng');
end
