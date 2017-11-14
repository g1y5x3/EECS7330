%% clear the images used for calibration
clearvars -except P

%% Load the test data and camera parameters
load('left_corners_test.mat');
load('left_parameters.mat')
load('left_distortion.mat')

% load('right_corners_test.mat');
% load('right_parameters.mat')
% load('right_distortion.mat')

%% Construct the World Coordinates and its corresponding pixels
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

%% Calculate the distorted pixels
uv_inex_d = zeros(2,80);
for i = 1 : N
    [uv_inex_d(1,i), uv_inex_d(2,i)] = convert_undistor_distor_ToolBox(uv_estimated_P(1,i),uv_estimated_P(2,i),kc,KK);
end

% measure the error
error_P_d = uv_inex_d(1:2,:) - uv;

%% Restruct the World Coordinates and its pixels w.r.t Zhang's method
XYZ_2 = XYZ_1;
XYZ_2(1,:) = XYZ(1,:);
XYZ_2(2,:) = XYZ(2,:);
XYZ_2(3,:) = XYZ(3,:) - 13;

% Construct the matrixs for intrinsic and extrinsic parameters
intri = horzcat(KK,[0; 0; 0]);
extri = [horzcat(Rc_5, Tc_5); 0 0 0 1];

%
uv_inex = intri * extri * XYZ_2;

for i = 1 : N
    uv_inex(1,i) = uv_inex(1,i) / uv_inex(3,i);
    uv_inex(2,i) = uv_inex(2,i) / uv_inex(3,i);
    uv_inex(3,i) = uv_inex(3,i) / uv_inex(3,i);
end

%% Calculate the distorted pixels
uv_inex_d = zeros(2,80);
for i = 1 : N
    [uv_inex_d(1,i), uv_inex_d(2,i)] = convert_undistor_distor_ToolBox(uv_inex(1,i),uv_inex(2,i),kc,KK);
end

% measure the error
error_inex_d = uv_inex_d(1:2,:) - uv;

%% Plot the reprojection error across all cases
figure
plot(error_P_d(1,:), error_P_d(2,:),'b+')
hold on
plot(error_inex_d(1,:), error_inex_d(2,:),'ro')
% xlim([-5 5])
% ylim([-5 5])
title('Left Reprojection Error (in pixel)')
xlabel('x')
ylabel('y')
legend('linear','Zhang')
