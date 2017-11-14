%% clear the images used for calibration
clearvars -except P

%% Load the test image and its ground truth
load('left_corners_test.mat');
% load('right_corners_test.mat');

XYZ = X_1;
uv  = x_1;

N = size(XYZ, 2);
XYZ_1 = vertcat(XYZ, ones(1,N));

%% Calculate the error of each points: Linear Method
uv_estimated_P = P * XYZ_1;

% Un-nomralize the pixel value for each point
for i = 1 : N
    uv_estimated_P(1,i) = uv_estimated_P(1,i) / uv_estimated_P(3,i);
    uv_estimated_P(2,i) = uv_estimated_P(2,i) / uv_estimated_P(3,i);
    uv_estimated_P(3,i) = uv_estimated_P(3,i) / uv_estimated_P(3,i);
end

% error_1 used to measure the error between the expected value and the
% projection using P matrix
error_P = uv_estimated_P(1:2,:) - uv;

%% Calculate the error of each points: Calibration Toolbox
% Get the intrinsic and extrinsic parameters of the camera
load('left_parameters.mat')
% load('right_parameters.mat')

XYZ_2 = XYZ_1;
XYZ_2(1,:) = XYZ(1,:);
XYZ_2(2,:) = XYZ(2,:);
XYZ_2(3,:) = XYZ(3,:) - 13;

% Construct the matrixs for intrinsic and extrinsic parameters
intri = horzcat(KK,[0; 0; 0]);
extri = [horzcat(Rc_5, Tc_5); 0 0 0 1];

%
uv_estimated_inex = intri * extri * XYZ_2;

for i = 1 : N
    uv_estimated_inex(1,i) = uv_estimated_inex(1,i) / uv_estimated_inex(3,i);
    uv_estimated_inex(2,i) = uv_estimated_inex(2,i) / uv_estimated_inex(3,i);
    uv_estimated_inex(3,i) = uv_estimated_inex(3,i) / uv_estimated_inex(3,i);
end

error_inex = uv_estimated_inex(1:2,:) - uv;

%% Plot the reprojection error across all cases
figure
plot(error_P(1,:), error_P(2,:),'b+')
hold on
plot(error_inex(1,:), error_inex(2,:),'ro')
% xlim([-5 5])
% ylim([-5 5])
title('Left Reprojection Error (in pixel)')
xlabel('x')
ylabel('y')
legend('linear','Zhang')