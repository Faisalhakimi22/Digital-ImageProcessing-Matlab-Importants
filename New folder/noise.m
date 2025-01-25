% Load the image
img = imread('/MATLAB Drive/Testing Images/Fig0638(a)(lenna_RGB).tif'); % Replace with your image file
img_gray = rgb2gray(img); % Convert to grayscale for simplicity

% Display the original image
figure, 
imshow(img_gray),
title('Original Image');

% 1. Add Gaussian Noise
gaussian_img = imnoise(img_gray, 'gaussian', 0, 0.01); % Mean=0, Variance=0.01
figure, 
imshow(gaussian_img),
title('Gaussian Noise');

% 2. Add Salt-and-Pepper Noise
salt_pepper_img = imnoise(img_gray, 'salt & pepper', 0.1); % Noise density = 0.05
figure,
imshow(salt_pepper_img), 
title('Salt-and-Pepper Noise');

% 3. Add Speckle Noise
speckle_img = imnoise(img_gray, 'speckle', 0.1); % Variance = 0.04
figure, imshow(speckle_img), title('Speckle Noise');

% 4. Add Poisson Noise
% Poisson noise is discrete, so it does not take parameters like Gaussian or speckle
poisson_img = imnoise(img_gray, 'poisson');
figure,
imshow(poisson_img), 
title('Poisson Noise');

% 5. Add Uniform Noise (Custom Implementation)
uniform_noise = uint8(255 * rand(size(img_gray))); % Generate uniform noise
uniform_img = imadd(img_gray, uniform_noise); % Add uniform noise to image
figure, 
imshow(uniform_img), 
title('Uniform Noise');
