
a=imread('/MATLAB Drive/Testing Images/Fig0107(b)(kidney-original).tif');

figure
subplot(1,2,1)
imshow(a)
title('original image')
subplot(1,2,2)
imhist(a)
title('original image histogram')



figure
subplot(1,2,1)
localeqred = adapthisteq(eq,'ClipLimit',0.1);
imshow(localeqred)
title('LocalHistogramEqualization')

subplot(1,2,2)
imhist(localeqred)
title('LocalEqualizaed histogram')

figure
mesh(localeqred)
figure
subplot(1,2,1)
eq = histeq(a);
imshow(eq)
title('histogram equalization')

subplot(1,2,2)
imhist(localeqred)
title('LocalEqualizaed histogram')



