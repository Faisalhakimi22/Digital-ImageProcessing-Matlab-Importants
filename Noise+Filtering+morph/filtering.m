% Read the original image
gray = imread('leenaNoice (2).png');


% Add Gaussian noise and Salt & Pepper noise
gas = imnoise(gray, 'gaussian');
snp = imnoise(gray, 'salt & pepper', 0.02);


% Apply Wiener filter and Median filter
fgas = wiener2(gas, [5 5]);  % Wiener filter for Gaussian noise
fsnp = medfilt2(snp);        % Median filter for Salt & Pepper noise
fpn = imfilter(gray, fspecial('gaussian', [5 5], 2)); % Gaussian filter for Poisson noise


% Enhance Wiener filtered image with Gaussian filter
fgas_gaussian = imfilter(fgas, fspecial('gaussian', [5 5], 2));

% Enhance Median filtered image with Gaussian filter
fsnp_gaussian = imfilter(fsnp, fspecial('gaussian', [5 5], 8));

% Median filter for Salt & Pepper noise on the median output
newfsnp = medfilt2(fsnp); 

% Enhance Double applied Median filtered image with Gaussian filter
newfsnp_gaussian = imfilter(newfsnp, fspecial('gaussian', [5 5], 8));

% Applying histogram equalization on Enhanced image
equalized_image = histeq(newfsnp_gaussian);

% Applying adaptive histogram equalization on Enhanced image
clahe = adapthisteq(newfsnp_gaussian);

% Display images in subplots
figure;

% Original Image
subplot(3,4,1);
imshow(gray);
title('Original Image');

% Wiener Filtered Image
subplot(3,4,2);
imshow(fgas);
title('Wiener Filtered');

% Gaussian Filtered Image
subplot(3,4,3);
imshow(fpn);
title('Gaussian Filtered');

% Wiener + Gaussian Filtered Image
subplot(3,4,4);
imshow(fgas_gaussian);
title('Wiener + Gaussian Filtered');

% Median Filtered Image
subplot(3,4,5);
imshow(fsnp);
title('Median Filtered');

% Median + Gaussian Filtered Image
subplot(3,4,6);
imshow(fsnp_gaussian);
title('Median + Gaussian Filtered');

% Median Filter Applied Again on Median Filtered Image
subplot(3,4,7);
imshow(newfsnp);
title('Median Filtered Again');

% Double Median + Gaussian Filtered Image
subplot(3,4,8);
imshow(newfsnp_gaussian);
title('Double Median + Gaussian Filtered');

% Histogram Equalized Image
subplot(3,4,9);
imshow(equalized_image);
title('Histogram Equalized');


% Adaptive Histogram Equalization Image
subplot(3,4,10);
imshow(clahe);
title('Adaptive Hist Equalized');



