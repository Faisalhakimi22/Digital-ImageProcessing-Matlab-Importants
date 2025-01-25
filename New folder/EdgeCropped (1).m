% Read the image
p= imread('kidney.tif');

% Display the image
figure;
imshow(p);
title('Original Image');

% Use imcrop to select the region to crop
I = imcrop;

% Display the cropped image
figure;
imshow(croppedImage);
title('Cropped Image');

% Optionally smooth the image with a Gaussian filter
I_smooth = imgaussfilt(I, 1.5); % Experiment with the sigma value for better results

% Convert the smoothed image to double precision for calculations
I_smooth = double(I_smooth);

% Sobel filter for X and Y directions
sobel_x = fspecial('sobel'); 
sobel_y = sobel_x'; 

% Prewitt filter for X and Y directions
prewitt_x = fspecial('prewitt'); 
prewitt_y = prewitt_x'; 

% Apply Sobel filters using imfilter
I_sobel_x = imfilter(I_smooth, sobel_x);
I_sobel_y = imfilter(I_smooth, sobel_y);

% Combine the Sobel gradients and convert to double to avoid uint8 issue
I_sobel = sqrt(I_sobel_x.^2 + I_sobel_y.^2);

% Normalize the Sobel result for better visualization
I_sobel = I_sobel / max(I_sobel(:));  % Normalize to [0, 1]

% Apply Prewitt filters using imfilter
I_prewitt_x = imfilter(I_smooth, prewitt_x);
I_prewitt_y = imfilter(I_smooth, prewitt_y);

% Combine the Prewitt gradients and convert to double to avoid uint8 issue
I_prewitt = sqrt(I_prewitt_x.^2 + I_prewitt_y.^2);

% Normalize the Prewitt result for better visualization
I_prewitt = I_prewitt / max(I_prewitt(:));  % Normalize to [0, 1]

% Apply histogram equalization on the Sobel result
I_sobel_eq = histeq(I_sobel);

% Dynamic thresholding based on mean
dynamic_threshold = mean(I_sobel(:)) + 0.5 * std(I_sobel(:));  % Adjust this value
I_sobel_thresholded = I_sobel > dynamic_threshold;

% Sharpen the smoothed image
I_sharpened = imsharpen(I_smooth);  % Sharpen the smoothed image

% Canny edge detection (optional, for comparison)
I_canny = edge(I_smooth, 'Canny');

% Morphological operations to enhance edges
se = strel('disk', 1);  % Structuring element
I_sobel_dilated = imdilate(I_sobel_thresholded, se);
I_prewitt_dilated = imdilate(I_prewitt, se);

% Display the original, Sobel, Prewitt, and histogram equalized Sobel results
figure;
subplot(2, 4, 1);
imshow(I);
title('Original Image');

subplot(2, 4, 2);
imshow(I_sobel, []);
title('Sobel Edge Detection');

subplot(2, 4, 3);
imshow(I_prewitt, []);
title('Prewitt Edge Detection');

subplot(2, 4, 4);
imshow(I_sobel_eq, []);
title('Equalized Sobel Edge Detection');

subplot(2, 4, 5);
imshow(I_sobel_dilated, []);
title('Dilated Sobel Edges');

subplot(2, 4, 6);
imshow(I_prewitt_dilated, []);
title('Dilated Prewitt Edges');

% Define a structuring element
% Adjust the structuring element size
se = strel('disk', 2); % Experiment with size

% Apply erosion to the histogram equalized Sobel image
I_sobel_eq_eroded = imerode(I_sobel_eq, se);

% Optionally apply dilation to recover some structure
I_sobel_eq_cleaned = imdilate(I_sobel_eq_eroded, se);

figure;
imshow(I_sobel_eq_eroded);
title('Eroded Equalized Sobel Edge Detection');


% Optionally, display Canny result
figure;
imshow(I_canny);
title('Canny Edge Detection');




