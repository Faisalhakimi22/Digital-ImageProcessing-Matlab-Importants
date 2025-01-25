
I = imread('Fig0117(b)(MRI-spine1-Vandy).tif');
I_smooth =imgaussfilt(I,1.5);
smooth = double(I_smooth);

%grey= rgb2gray(I);

figure
imshow(I)
title('Original image')


%sobel : where the gradient of image is maximum 
figure
edges = edge(I,'sobel');
imshow(edges)
title('sobel')

%canny :local maxima of a gradient ; claculate derivative of a gussian
%filter
figure
edges1 = edge(I,'canny');
imshow(edges1);
title('canny')

%Prewitt detecting basic edge orientations, though less sensitive than Canny.
figure
edges2= edge(I_smooth,'prewitt')
imshow(edges2);
title('prewitt')


%robert : Detects edges quickly by looking at gradients diagonally,
figure
edges3 = edge(I,'roberts');
imshow(edges)
title('Robert')



figure
edges = edge(I,'log');
imshow(edges);




% fspecial and imfilter , fspecial : for creating predefined 2d filter 
%imfilter to apply the filter on image it takes filter and image commands 
%H = fspecial('gaussian', [hsize], sigma);
%H = fspecial('sobel');
%H = fspecial('laplacian', alpha);
%H = fspecial('average', [hsize]);

figure
i_sobel = fspecial('sobel');
filter = imfilter(I,i_sobel);
%i_sobel=sqrt(filter.^2);
I_sobel = filter / max(filter(:));  % Normalize to [0, 1]
imshow(I_sobel)



% Convert to grayscale if needed
if size(I, 3) == 3
    grayImg = rgb2gray(I);
else
    grayImg = I; % Already grayscale
end

% Apply edge detection using Canny method
edges = edge(grayImg, 'Canny');

% Link edges using Hough Transform
[H, T, R] = hough(edges); 
peaks = houghpeaks(H, 5, 'threshold', ceil(0.3 * max(H(:))));
lines = houghlines(edges, T, R, peaks, 'FillGap', 5, 'MinLength', 7);

% Prepare line segments for plotting
xy = vertcat(lines.point1, lines.point2);  % Concatenate start and end points
lineSegments = [xy(:, 1), xy(:, 2)];        % Create a 2D array of line segments

% Display the original image with detected lines without using loops
imshow(grayImg); hold on;
plot(lineSegments(:, 1), lineSegments(:, 2), 'LineWidth', 2, 'Color', 'cyan'); % Plot all lines
title('Detected Lines using Hough Transform');



figure
edges = edge(I,'log');
imshow(edges);