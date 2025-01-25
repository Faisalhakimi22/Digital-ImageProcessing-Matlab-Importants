

% Load the image
imagePath = '11.bmp'; % Replace with your image path
image = imread(imagePath);

% Convert the image to grayscale if it is RGB
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Compute the 2D Fourier Transform
dft = fft2(double(image)); % Apply 2D FFT
dft_shifted = fftshift(dft); % Shift zero-frequency to the center
magnitude_spectrum = log(1 + abs(dft_shifted)); % Compute magnitude spectrum

% Display the original image and its magnitude spectrum
figure;

% Display the original image
subplot(1, 2, 1);
imshow(image, []);
title('Original Image');

% Display the magnitude spectrum
subplot(1, 2, 2);
imshow(magnitude_spectrum, []);
title('Magnitude Spectrum');
colormap(gca, 'jet'); % Apply a color map for better visualization
colorbar;
