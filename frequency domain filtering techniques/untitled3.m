% Read the image
image = imread('15.bmp'); % Replace with your image filename

% Convert to grayscale if it's a color image
if size(image, 3) == 3
    gray_image = rgb2gray(image); 
else
    gray_image = image; 
end

% Step 1: Apply 2D DFT to the image
FT_image = fft2(double(gray_image)); 

% Step 2: Shift zero-frequency components to the center
centered_FT = fftshift(FT_image); 

% Step 3: Create a frequency domain filter (e.g., low-pass filter)
% Define filter size
[M, N] = size(gray_image);
[u, v] = meshgrid(-floor(N/2):floor((N-1)/2), -floor(M/2):floor((M-1)/2));
D = sqrt(u.^2 + v.^2); % Distance from the center

% Low-pass filter: cutoff frequency
D0 = 50; % Adjust this cutoff frequency as needed
H_low = double(D <= D0); % Ideal low-pass filter

% High-pass filter: cutoff frequency
H_high = double(D > D0); % Ideal high-pass filter

% Apply the chosen filter to the frequency domain
filtered_FT_low = centered_FT .* H_low; % Low-pass filtering
filtered_FT_high = centered_FT .* H_high; % High-pass filtering

% Step 4: Shift back and perform the inverse 2D DFT
filtered_image_low = real(ifft2(ifftshift(filtered_FT_low))); % Low-pass filtered image
filtered_image_high = real(ifft2(ifftshift(filtered_FT_high))); % High-pass filtered image

% Plot the results
figure;

% Original grayscale image
subplot(2, 3, 1);
imshow(gray_image, []);
title('Original Grayscale Image');

% Magnitude spectrum of the original image
subplot(2, 3, 2);
imshow(log(1 + abs(centered_FT)), []);
title('Magnitude Spectrum (Original)');

% Low-pass filter
subplot(2, 3, 3);
imshow(H_low, []);
title('Low-Pass Filter');

% Low-pass filtered image
subplot(2, 3, 4);
imshow(filtered_image_low, []);
title('Low-Pass Filtered Image');

% High-pass filter
subplot(2, 3, 5);
imshow(H_high, []);
title('High-Pass Filter');

% High-pass filtered image
subplot(2, 3, 6);
imshow(filtered_image_high, []);
title('High-Pass Filtered Image');
