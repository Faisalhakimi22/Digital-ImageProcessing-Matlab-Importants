
import numpy as np
import cv2
import matplotlib.pyplot as plt

# Load an image in grayscale
image_path = '11.bmp'  # Replace with the path to your image
image = cv2.imread(image_path, cv2.IMREAD_GRAYSCALE)

if image is None:
    print("Error: Image not found. Please check the path.")
else:
    # Apply the 2D FFT
    dft = np.fft.fft2(image)  # Compute the 2D Fourier Transform
    dft_shift = np.fft.fftshift(dft)  # Shift zero frequency component to the center
    magnitude_spectrum = np.log(1 + np.abs(dft_shift))  # Calculate magnitude spectrum

    # Visualize the original image and its frequency spectrum
    plt.figure(figsize=(10, 5))

    # Original image
    plt.subplot(1, 2, 1)
    plt.imshow(image, cmap='gray')
    plt.title("Original Image")
    plt.axis('off')

    # Magnitude spectrum
    plt.subplot(1, 2, 2)
    plt.imshow(magnitude_spectrum, cmap='gray')
    plt.title("Magnitude Spectrum")
    plt.axis('off')

    plt.tight_layout()
    plt.show()

