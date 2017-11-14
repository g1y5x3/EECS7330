clear, clc

%% Load test images and get uv coordinates and orientation
% left image
filename = 'test_left.ppm';
[uv_left, ori_left] = get_uv_orientation(filename);

% right image
filename = 'test_right.ppm';
[uv_right, ori_right] = get_uv_orientation(filename);

% check whether the order of each object correspond to each other

% get the number of objects
% ***TO-DO*** 
% What if the number of objects returned from the left and right images are
% different?
% ***********
num_object = length(uv_right);

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

disp(M)

%% Apply the transformation from the world fram to the robot frame
% the translation between the robot frame and the world frame is from
% measurements
r_H_w = [1 0 0 -120;
         0 1 0 +120;
         0 0 1 -190;
         0 0 0    1;];

% Calculate the position of the object w.r.t the robot frame
% P: position
% O: Orientation
i = 1;
P = r_H_w * [M(:,i); 1];
O = (ori_left(i) + ori_right(i))/2 + 90;
disp(P)
disp(O)


X = P(1);
Y = P(2);
Z = -100;
O = (ori_left(i) + ori_right(i))/2 + 90;
A = 90;
T = 0;

