

a=imread('/MATLAB Drive/Testing Images/Fig0638(a)(lenna_RGB).tif');

figure;
% Plot original image
subplot(3,2,1);
imshow(a);
title('Original Image');

% Split channels
red = a(:,:,1);   % Red channel
green = a(:,:,2); % Green channel
blue = a(:,:,3);  % Blue channel

% Plot histograms of original channels
[yRed, x] = imhist(red);
[yGreen, x] = imhist(green);
[yBlue, x] = imhist(blue);

subplot(3,2,2);
plot(x, yRed, 'r', x, yGreen, 'g', x, yBlue, 'b');
title('Histogram of Original Image');
xlabel('Intensity Value');
ylabel('Number of Pixels');
legend('Red Channel', 'Green Channel', 'Blue Channel');

% Histogram Equalization
eqRed = histeq(red);
eqGreen = histeq(green);
eqBlue = histeq(blue);

% Display Equalized Image
subplot(3,2,3);
equalized = cat(3, eqRed, eqGreen, eqBlue);
imshow(equalized);
title('Equalized Image');

% Plot histograms of equalized channels
[eqyRed, x] = imhist(eqRed);
[eqyGreen, x] = imhist(eqGreen);
[eqyBlue, x] = imhist(eqBlue);

subplot(3,2,4);
plot(x, eqyRed, 'r', x, eqyGreen, 'g', x, eqyBlue, 'b');
title('Histogram of Equalized Image');
xlabel('Intensity Value');
ylabel('Number of Pixels');
legend('Equalized Red', 'Equalized Green', 'Equalized Blue');

% Adaptive Histogram Equalization
LocaleqRed = adapthisteq(red, 'ClipLimit', 0.1);
LocaleqGreen = adapthisteq(green, 'ClipLimit', 0.1);
LocaleqBlue = adapthisteq(blue, 'ClipLimit', 0.1);

% Display Adaptive Equalized Image
subplot(3,2,5);
adaptiveEqualized = cat(3, LocaleqRed, LocaleqGreen, LocaleqBlue);
imshow(adaptiveEqualized);
title('Adaptive Equalized Image');

% Plot histograms of adaptive equalized channels
[LocaleqyRed, x] = imhist(LocaleqRed);
[LocaleqyGreen, x] = imhist(LocaleqGreen);
[LocaleqyBlue, x] = imhist(LocaleqBlue);

subplot(3,2,6);
plot(x, LocaleqyRed, 'r', x, LocaleqyGreen, 'g', x, LocaleqyBlue, 'b');
title('Histogram of Adaptive Equalized Image');
xlabel('Intensity Value');
ylabel('Number of Pixels');
legend('Adaptive Equalized Red', 'Adaptive Equalized Green', 'Adaptive Equalized Blue');
