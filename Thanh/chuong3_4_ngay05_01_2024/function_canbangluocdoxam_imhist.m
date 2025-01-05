function histogram_equalization_histeq(image_path)
    % ??c ?nh t? ???ng d?n
    img = imread(image_path);

    % N?u ?nh l� ?nh m�u, chuy?n sang ?nh x�m
    if size(img, 3) == 3
        img = rgb2gray(img);
    end

    % B??c 1: C�n b?ng histogram s? d?ng h�m histeq
    new_img = histeq(img);

    % B??c 2: Hi?n th? ?nh g?c v� ?nh sau khi c�n b?ng histogram
    figure;
    subplot(1, 2, 1);
    imshow(img);
    title('?nh g?c');

    subplot(1, 2, 2);
    imshow(new_img);
    title('?nh sau khi c�n b?ng histogram');

    % B??c 3: V? histogram tr??c v� sau khi c�n b?ng
    figure;
    subplot(1, 2, 1);
    imhist(img);
    title('Histogram g?c');

    subplot(1, 2, 2);
    imhist(new_img);
    title('Histogram sau khi c�n b?ng');
end
