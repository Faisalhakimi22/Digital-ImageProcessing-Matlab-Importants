% Read the image
image = imread('15.bmp'); % Replace with your image filename

% Check if the image is already grayscale; if not, convert it
if size(image, 3) == 3
    gray_image = rgb2gray(image); % Convert to grayscale if it's a color image
else
    gray_image = image; % Image is already grayscale
end

% Compute the 2D Fourier Transform of the image
FT_image = fft2(double(gray_image)); % Compute Fourier Transform

% Compute the magnitude spectrum (absolute value)
magnitude_spectrum = abs(FT_image);

% Apply fftshift to center the low frequencies
centered_spectrum = fftshift(magnitude_spectrum);

% Use logarithmic scaling for better visualization
log_spectrum = log(1 + centered_spectrum);

% Plot the results
figure;

% Step 1: Original grayscale image
subplot(2, 2, 1);
imshow(gray_image, []);
colormap(gca, 'gray'); % Force grayscale colormap
colorbar('off'); % Turn off colorbar for grayscale image
title('Original Grayscale Image');

% Step 2: Magnitude spectrum (linear scale)
subplot(2, 2, 2);
imshow(centered_spectrum, []); % Display in linear scale
colormap(gca, 'gray'); % Ensure grayscale colormap
colorbar; % Add a colorbar for intensity reference
title('Magnitude Spectrum (Linear Scale)');

% Step 3: Magnitude spectrum (logarithmic scale)
subplot(2, 2, 3);
imshow(log_spectrum, []); % Display in logarithmic scale
colormap(gca, 'gray'); % Ensure grayscale colormap
colorbar; % Add a colorbar for intensity reference
title('Magnitude Spectrum (Logarithmic Scale)');

% Step 4: Colored visualization of log spectrum
subplot(2, 2, 4);
imshow(log_spectrum, []); % Log scale visualization
colormap(gca, 'jet'); % Use jet colormap for better visualization
colorbar; % Add a colorbar to show intensity scale
title('Colored Log Spectrum');
