import cv2
import numpy as np

# Load the PGM image in grayscale mode
input_filename = "pic1.pgm"  # Replace with your PGM file
output_filename = "output_sobel.pgm"

# Read the image in grayscale
image = cv2.imread(input_filename, cv2.IMREAD_GRAYSCALE)

# Apply Sobel filter in x and y directions
sobel_x = cv2.Sobel(image, cv2.CV_64F, 1, 0, ksize=3)  # Sobel in x direction
sobel_y = cv2.Sobel(image, cv2.CV_64F, 0, 1, ksize=3)  # Sobel in y direction

# Compute the gradient magnitude
sobel_magnitude = cv2.magnitude(sobel_x, sobel_y)

# Normalize and convert to 8-bit format
sobel_magnitude = np.clip(sobel_magnitude, 0, 255).astype(np.uint8)

# Save the result as a new PGM image
cv2.imwrite(output_filename, sobel_magnitude)

print(f"Sobel-filtered image saved as {output_filename}")
