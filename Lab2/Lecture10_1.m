I = imread('Test1.ppm');
I=rgb2gray(I);
BW1 = edge(I,'prewitt');
BW2 = edge(I,'canny');
BW3 = edge(I,'sobel');
figure
imshow(I)

figure
imshow(BW1)

figure
imshow(BW2)

figure
imshow(BW3)