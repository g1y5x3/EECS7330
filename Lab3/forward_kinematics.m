clear, clc

%% Input
theta1 = 2.047;
theta2 = 48.802;
theta3 = -36.430;
theta4 = -45.292;
theta5 = 121.801;
theta6 = 51.465;

%% Forward Kinematics
% Initialize the D-H table
% Number of joints
N = 6;

% theta parameter (degrees)
THETA = [theta1*pi/180;    % 0-1
         theta2*pi/180;    % 1-2
         theta3*pi/180;    % 2-3    
         theta4*pi/180;    % 3-4
         theta5*pi/180;    % 4-5
         theta6*pi/180;];  % 5-6

% d parameter (mm)
D = [ 0      ;      % 0-1
      73.025 ;      % 1-2
      52.3875;      % 2-3
      203.2  ;      % 3-4
      0      ;      % 4-5
      55.9308;];    % 5-6

% a parameter (mm)
A = [0    ;
     203.2;
     0;
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

% Initialize the transformation
H = [1 0 0 0;
     0 1 0 0;
     0 0 1 0;
     0 0 0 1;];
 
for n = 1 : N
    
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
    H = H * T;

end

% Get the position X, Y, Z
X = H(1,4);
Y = H(2,4);
Z = H(3,4);

% Calculte the orientation O, A, T angle
angle_T = atan2 (H(3,2), -H(3,1));
angle_O = atan2( H(1,3), -H(2,3));
angle_A = atan2(-H(3,3), H(1,3)/sin(angle_O));

fprintf('X %f\nY %f\nZ %f\nO %f\nA %f\nT %f\n',X,Y,Z,angle_O*180/pi,angle_A*180/pi,angle_T*180/pi);