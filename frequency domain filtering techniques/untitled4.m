% Step 1: Read an example image
image = imread('example_image.jpg'); % Replace with your image file
gray_image = rgb2gray(image); % Convert to grayscale if the image is RGB

% Step 2: Create a grid pattern
grid_size = size(gray_image); % Get the size of the image
spacing = 20; % Spacing between grid lines (pixels)

% Create the grid pattern
[xx, yy] = meshgrid(1:grid_size(2), 1:grid_size(1));
grid_pattern = mod(floor(xx / spacing) + floor(yy / spacing), 2); % Checkerboard-like pattern

% Step 3: Overlay the grid pattern on the image (Moiré Effect)
moiré_pattern1 = double(gray_image) + 50 * grid_pattern; % Add grid pattern to image

% Step 4: Rotate the grid pattern slightly
theta = 10; % Rotation angle in degrees
rotated_grid = imrotate(grid_pattern, theta, 'bilinear', 'crop'); % Rotate the grid

% Step 5: Overlay the rotated grid pattern on the image
moiré_pattern2 = double(gray_image) + 50 * rotated_grid; % Add rotated grid to image

% Step 6: Visualize the results
figure;

subplot(2, 2, 1);
imshow(gray_image);
title('Original Grayscale Image');

subplot(2, 2, 2);
imshow(moiré_pattern1, []);
title('Moiré Pattern (Original Grid Overlay)');

subplot(2, 2, 3);
imshow(moiré_pattern2, []);
title('Moiré Pattern (Rotated Grid Overlay)');

% Optional: Show the frequency spectrum of the images
figure;
subplot(1, 2, 1);
imshow(log(1 + abs(fftshift(fft2(gray_image)))), []);
title('Original Image Frequency Spectrum');

subplot(1, 2, 2);
imshow(log(1 + abs(fftshift(fft2(moiré_pattern2)))), []);
title('Moiré Pattern Frequency Spectrum');
