img = imread('dog.tif');
img = imresize(img, [128 128]); % Resize for faster processing
data = double(reshape(img, [], 3)); % Reshape image into an Nx3 matrix

% Apply K-means clustering
k = 3; % Number of clusters
[cluster_idx, cluster_center] = kmeans(data, k);
segmented_img = uint8(reshape(cluster_center(cluster_idx, :), size(img)));

figure;
subplot(1,2,1); imshow(img); title('Original Image');
subplot(1,2,2); imshow(segmented_img); title('Segmented Image');
