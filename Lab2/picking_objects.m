clear; clc; close all;

%% Initialize the PUMA robot
% Initialize the serial port communication and robot
% system('Puma_INIT');

system('Puma_READY');
pause(5)

system('Puma_NEST');
pause(3)

% set the initial speed
system('Puma_SPEED 20');
pause(1)

system('Puma_READY');
pause(5)

% set a new ready position   target_object = 3;

system('PumaMoveXYZOAT 250 250 -100 0 90 0')
pause(5)

%% Collect the image from camera
system('./collect_test_images.sh')
pause(5)

%% Load test images and get uv coordinates and orientation
% left image
filename = 'test_left.ppm';
[uv_left, ori_left] = get_uv_orientation(filename);

% right image
filename = 'test_right.ppm';
[uv_right, ori_right] = get_uv_orientation(filename);

% check whether the order of each object correspond to each other

% get the number of objects
% ********** TO-DO ********** 
% What if the number of objects returned from the left and right images are
% different?
% ***************************
num_object = size(uv_right,1);

%% Plot the processed image
figure
subplot(1,2,1)
imshow('test_left.ppm')
hold on
plot(uv_left(1,1), uv_left(1,2), 'r*')
text(uv_left(1,1), uv_left(1,2),'1','Color','white','FontSize',14)
plot(uv_left(2,1), uv_left(2,2), 'g*')
text(uv_left(2,1), uv_left(2,2),'2','Color','white','FontSize',14)
plot(uv_left(3,1), uv_left(3,2), 'b*')
text(uv_left(3,1), uv_left(3,2),'3','Color','white','FontSize',14)

legend(strcat(num2str(ori_left(1))),...
       strcat(num2str(ori_left(2))),...
       strcat(num2str(ori_left(3))))
   
hold off

subplot(1,2,2)
imshow('test_right.ppm')
hold on
plot(uv_right(1,1), uv_right(1,2), 'r*')
text(uv_right(1,1), uv_right(1,2),'1','Color','white','FontSize',14)
plot(uv_right(2,1), uv_right(2,2), 'g*')
text(uv_right(2,1), uv_right(2,2),'2','Color','white','FontSize',14)
plot(uv_right(3,1), uv_right(3,2), 'b*')
text(uv_right(3,1), uv_right(3,2),'3','Color','white','FontSize',14)

legend(strcat(num2str(ori_right(1))),...
       strcat(num2str(ori_right(2))),...
       strcat(num2str(ori_right(3))))
   
%% Load the calibration parameters of both left and right carmers
load('parameters_left.mat')
intri_left = horzcat(KK,[0; 0; 0]);
extri_left = [horzcat(Rc_1, Tc_1); 0 0 0 1];

load('parameters_right.mat')
intri_right = horzcat(KK,[0; 0; 0]);
extri_right = [horzcat(Rc_1, Tc_1); 0 0 0 1];

%% 3-D reconstruction
P_left = intri_left * extri_left;
P_right = intri_right * extri_right;

for i = 1:num_object
% Construct the matrix A and b
A = [P_right(1,1:3) - uv_right(i,1) * P_right(3,1:3);
     P_right(2,1:3) - uv_right(i,2) * P_right(3,1:3);
     P_left(1,1:3) - uv_left(i,1) * P_left(3,1:3);
     P_left(2,1:3) - uv_left(i,2) * P_left(3,1:3);];

b = [uv_right(i,1) * P_right(3,4) - P_right(1,4);
     uv_right(i,2) * P_right(3,4) - P_right(2,4);
     uv_left(i,1) * P_left(3,4) - P_left(1,4);
     uv_left(i,2) * P_left(3,4) - P_left(2,4);];
 
% Solve AM = b
M(:,i) = (A'*A)^-1 * A' * b;
end

% disp(M)

%% Apply the transformation from the world fram to the robot frame
target_object = 3;

% the translation between the robot frame and the world frame is from
% measurements
r_H_w = [1 0 0 -121;
         0 1 0 +169;
         0 0 1 -190;
         0 0 0    1;];

% Calculate the position of the object w.r.t the robot frame
% P: position
% O: Orientation
P = r_H_w * [M(:,target_object); 1];
X = P(1);
Y = P(2);
Z = -100;

O_angle = (ori_left(target_object) + ori_right(target_object))/2 + 90;
A_angle = 90;
T_angle = 0;

disp('Position')
disp(P)
disp('Orientation')
disp(O_angle)

%% Picking the project
system(sprintf('PumaMoveXYZOAT %f %f %f %f %f %f', X, Y, Z, O_angle, A_angle, T_angle))
pause(5)

system('openGripper &');
pause(5)

% Drop the arm to grab the object
Z = -200;
system(sprintf('PumaMoveXYZOAT %f %f %f %f %f %f', X, Y, Z, O_angle, A_angle, T_angle))
pause(5)

system('closeGripper');
pause(5)

Z = -100;
system(sprintf('PumaMoveXYZOAT %f %f %f %f %f %f', X, Y, Z, O_angle, A_angle, T_angle))
pause(5)