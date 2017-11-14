% clear,clc

%% Input
X = 200.042;
Y = 99.994;
Z = 9.998;

angle_O = 39.997;
angle_A = 40.005;
angle_T = 39.995;

%% Inverse Kinematics
x = X;
y = Y;
z = Z;
o = angle_O*pi/180;
a = angle_A*pi/180;
t = angle_T*pi/180;

% Construct the transformation matrix
% Rotation
R = [-sin(o)*sin(a)*cos(t)+cos(o)*sin(t)   sin(o)*sin(a)*sin(t)+cos(o)*cos(t)   sin(o)*cos(a);
      cos(o)*sin(a)*cos(t)+sin(o)*sin(t)  -cos(o)*sin(a)*sin(t)+sin(o)*cos(t)  -cos(o)*cos(a);
     -cos(a)*cos(t)                        cos(a)*sin(t)                       -sin(a);]; 

T = [x;y;z;1;];

H_123456 = horzcat([R;0 0 0;],T);

%%
% Initialize the D-H table
% Number of joints
N = 6;

% % theta parameter (degrees)
% THETA = [theta1*pi/180;    % 0-1
%          theta2*pi/180;    % 1-2
%          theta3*pi/180;    % 2-3    
%          theta4*pi/180;    % 3-4
%          theta5*pi/180;    % 4-5
%          theta6*pi/180;];  % 5-6

% % d parameter (mm)
% D = [ 0      ;      % 0-1
%       73.025 ;      % 1-2
%       52.3875;      % 2-3
%       203.2  ;      % 3-4
%       0      ;      % 4-5
%       55.9308;];    % 5-6

% d parameter (mm)
D = [ 0      ;      % 0-1
      125.4125 ;      % 1-2
      0;      % 2-3
      203.2  ;      % 3-4
      0      ;      % 4-5
      55.9308;];    % 5-6

% a parameter (mm)
A = [0    ;
     203.2;
     0    ;
     0    ;
     0    ;
     0    ;];

% alpha parameter (mm)
ALPHA = [-90*pi/180;
          0        ;
          90*pi/180;
         -90*pi/180;
          90*pi/180;
          0        ;];
      
%% Solution for theta1
pose_6 = T(1:3);
vector_z_5 = R(:,3);
% subtract the position of frame 5 by the distance of d
pose_4 = pose_6 - D(6) * vector_z_5;

sin_theta1 = pose_4(2)*sqrt(pose_4(1)^2 + pose_4(2)^2 - D(2)^2) - D(2)*pose_4(1);
cos_theta1 = pose_4(1)*sqrt(pose_4(1)^2 + pose_4(2)^2 - D(2)^2) + D(2)*pose_4(2);
theta1 = atan2d(sin_theta1, cos_theta1);

%% Solution for theta3
R_theta3 = pose_4(1)^2 + pose_4(2)^2 + pose_4(3)^2 - A(2)^2 - A(3)^2 - D(2)^2 - D(4)^2;
r_theta3 = 2 * A(2) * sqrt(A(3)^2 + D(4)^2);

sin_theta3 = 2 * A(2)*D(4) * R_theta3 - 2 * A(2)*A(3) * sqrt(r_theta3^2 - R_theta3^2);
cos_theta3 = 2 * A(2)*D(4) * sqrt(r_theta3^2 - R_theta3^2) + 2 * A(2)*A(3) * R_theta3;

theta3 = atan2d(sin_theta3, cos_theta3);

%% Solution for theta2
sin_theta2 = -pose_4(3) * (A(2) + A(3)*cosd(theta3) + D(4)*sind(theta3)) + (A(3)*sind(theta3) - D(4)*cosd(theta3)) * sqrt(pose_4(1)^2 + pose_4(2)^2 - D(2)^2);
cos_theta2 = -(A(2) + A(3)*cosd(theta3) + D(4)*sind(theta3)) * sqrt(pose_4(1)^2 + pose_4(2)^2 - D(2)^2) + (D(4)*cosd(theta3) - A(3)*sind(theta3)) * pose_4(3);

% theta2 = atan2d(-sin_theta2, -cos_theta2);
theta2 = atand(sin_theta2/cos_theta2);

%% Solve for theta4, theta5, and theta6
THETA = [theta1*pi/180;    % 0-1
         theta2*pi/180;    % 1-2
         theta3*pi/180;];  % 2-3

H_123 = [1 0 0 0;
     0 1 0 0;
     0 0 1 0;
     0 0 0 1;];
 
for n = 1 : 3
    
    theta = THETA(n);
    d     = D(n);
    a     = A(n);
    alpha = ALPHA(n);

    % Transformation matrix
    T = [cos(theta) -sin(theta)*cos(alpha)  sin(theta)*sin(alpha) a*cos(theta);
         sin(theta)  cos(theta)*cos(alpha) -cos(theta)*sin(alpha) a*sin(theta);
         0           sin(alpha)             cos(alpha)            d           ;
         0           0                      0                     1           ;];

    % Apply transformation
    H_123 = H_123 * T;

end

H_456 = H_123^-1 * H_123456;

theta4 = atan2d(H_456(2,3), H_456(1,3));
theta6 = atan2d(H_456(3,2), -H_456(3,1));
theta5 = atan2d(H_456(2,3)/sind(theta4), H_456(3,3));

fprintf('Theta1: %f\nTheta2: %f\nTheta3: %f\nTheta4: %f\nTheta5: %f\nTheta6: %f\n',theta1,theta2,theta3,theta4,theta5,theta6);



