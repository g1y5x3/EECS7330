%% clear the images used for calibration
clearvars -except P

%% Load the test image and its ground truth
load('left_corners_test.mat');
% load('right_corners_test.mat');

XYZ = X_1;
uv  = x_1;

% Calculate the error of each points
N = size(XYZ, 2);
XYZ = vertcat(XYZ, ones(1,N));
uv_estimated_P = P * XYZ;

% Un-nomralize the pixel value for each point
for i = 1 : N
    uv_estimated_P(1,i) = uv_estimated_P(1,i) / uv_estimated_P(3,i);
    uv_estimated_P(2,i) = uv_estimated_P(2,i) / uv_estimated_P(3,i);
    uv_estimated_P(3,i) = uv_estimated_P(3,i) / uv_estimated_P(3,i);
end

% error_1 used to measure the error between the expected value and the
% projection using P matrix
error_P = uv_estimated_P(1:2,:) - uv;

%% Get the intrinsic and extrinsic parameters of the camera
load('Calib_Results_Intrinsic_left.mat')
load('Calib_Results_Extrinsic_left.mat')
 
intri = horzcat(KK,[0; 0; 0]);
extri = [horzcat(Rc_1, Tc_1); 0 0 0 1];

% Transformation from the test pattern to the first pattern used for
% calibration
p1Hpt = [1 0 0 0;...
         0 1 0 0;...
         0 0 1 -86;...
         0 0 0 1];

uv_estimated_intext = intri * extri * p1Hpt* XYZ;

for i = 1 : N
    uv_estimated_intext(1,i) = uv_estimated_intext(1,i) / uv_estimated_intext(3,i);
    uv_estimated_intext(2,i) = uv_estimated_intext(2,i) / uv_estimated_intext(3,i);
    uv_estimated_intext(3,i) = uv_estimated_intext(3,i) / uv_estimated_intext(3,i);
end

error_intext = uv_estimated_intext(1:2,:) - uv;

%% Plot the reprojection error across all cases
figure
plot(error_P(1,:), error_P(2,:),'b+')
hold on
plot(error_intext(1,:), error_intext(2,:),'r+')
title('Reprojection Error')