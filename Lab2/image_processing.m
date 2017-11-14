clear, clc

%% Load the original image and converted it into Grayscale
I = imread('Test1.ppm');
I=rgb2gray(I);

%% Erode and Dilate the image in order to get a filled rectangle
se = offsetstrel('ball',5,5);
erodedI = imerode(I,se);
% imshow(erodedI)

dilatedI = imdilate(erodedI,se);
% imshow(dilatedI)

%% Apply a threshold to binarize the image
level = graythresh(dilatedI);
BW = imcomplement(imbinarize(dilatedI,level));
% imshow(BW)

%% Apply edge detection
BW = edge(BW,'Canny');
imshow(BW)

%% Find the centroid of each object
stats = regionprops(BW,'Centroid','Orientation');

hold on
for k = 1:length(stats)
    xy = stats(k).Centroid;
    scatter(xy(1), xy(2), '+', 'green');
end

% 
% %% Apply Hough Transform to find the line for the image
% [H,T,R] = hough(BW);
% P  = houghpeaks(H,30,'Threshold',20);
% lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',20);
% 
% %% Since all lines are not perfectly alined, we need to average
% 
% hold on
% max_len = 0;
% for k = 1:length(lines)
%   xy = [lines(k).point1; lines(k).point2];
%   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
% 
%   % plot beginnings and ends of lines
%   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
%   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
% 
% %   % determine the endpoints of the longest line segment 
% %   len = norm(lines(k).point1 - lines(k).point2);
% %   if ( len > max_len)
% %     max_len = len;
% %     xy_long = xy;
% %   end
% end
% 
% % highlight the longest line segment
% % plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');
% 

