%red colored image with imread
a=imread('/MATLAB Drive/Testing Images/Fig0628(a)(jupiter-moon.-Io).tif');

%plotting the original image and its 3 channel's histogram for each
%channel(red,green,blue)
figure;

%plot original image
subplot(3,4,1);
imshow(a)
title('orignil image')

%seprate the color channels
red = a(:,:,1);%red channel
green=a(:,:,2);%green channel
blue=a(:,:,3);%blue channel


%red channel histogram
subplot(3,4,2);
imhist(red)
title('original image red hist');

%green channel histogram
subplot(3,4,3);
imhist(green)
title('original image green hist')

%blue channel histogram
subplot(3,4,4);
imhist(blue)
title('original image blue hist')




%Apply histogram equalization
eqred = histeq(red);
eqgreen= histeq(green);
eqblue= histeq(blue);


%reconstruct the equalized image
equalized= cat(3,eqred,eqgreen,eqblue);

%plot equalized image
subplot(3,4,5);
imshow(equalized)
title('equalized')

%plot equalized red channel histogram
subplot(3,4,6);
imhist(eqred);
title('red image histogram')

%plot equalized green channel histogram
subplot(3,4,7);
imhist(eqgreen)
title('green image histogram')

%plot equalized blue channel histogram
subplot(3,4,8);
imhist(eqblue)
title('blue image histogram')


%Apply histogram Local equalization
localeqred = adapthisteq(red,'ClipLimit',0.1);
localeqgreen = adapthisteq(green,'ClipLimit',0.1);
localeqblue = adapthisteq(blue,'ClipLimit',0.1);

%reconstruct the Local histogram equalized image
Newequalized= cat(3,localeqred,localeqgreen,localeqblue);

% plotting Local equalized image
subplot(3,4,9);
imshow(Newequalized)
title('Local equalized')

%plot Localequalized red channel histogram
subplot(3,4,10);
imhist(localeqred);
title('red image histogram')


%plot Localequalized green channel histogram
subplot(3,4,11);
imhist(localeqgreen)
title('green image histogram')


%plot Localequalized Blue channel histogram
subplot(3,4,12);
imhist(localeqblue)
title('blue image histogram')
