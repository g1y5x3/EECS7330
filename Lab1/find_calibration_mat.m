clear, clc

%% Read images for calibration
load('left_corners.mat')
% load('right_corners.mat')

%% Construct the A matrix
XYZ = [X_1 X_2 X_3 X_4 X_5];
uv  = [x_1 x_2 x_3 x_4 x_5];

N = size(XYZ, 2);
A = zeros(2 * N, 12);
for i = 1 : N
    % Row 1
    A(2*i-1,1:3) = XYZ(:,i);                % x y z
    A(2*i-1,4)   = 1;                       % 1
    A(2*i-1,5:8) = [0 0 0 0];               % 0 0 0 0
    A(2*i-1,9)   = -uv(1,i) * XYZ(1,i);     % -u * x
    A(2*i-1,10)  = -uv(1,i) * XYZ(2,i);     % -u * y
    A(2*i-1,11)  = -uv(1,i) * XYZ(3,i);     % -u * z
    A(2*i-1,12)  = -uv(1,i);                % -u
    
    % Row 2
    A(2*i,1:4)   = [0 0 0 0];               % 0 0 0 0
    A(2*i,5:7)   = XYZ(:,i);                % x y z
    A(2*i,8)     = 1;                       % 1
    A(2*i,9)     = -uv(2,i) * XYZ(1,i);     % -v * x
    A(2*i,10)    = -uv(2,i) * XYZ(2,i);     % -v * y
    A(2*i,11)    = -uv(2,i) * XYZ(3,i);     % -v * z
    A(2*i,12)    = -uv(2,i);                % -v        
end

%% Solution for Aq = 0

% Decomposition
[U, D, V] = svd(A);

% q is the last column of matrix V
q = V(:,end);

% Restruct the projection matrix P
P = [q(1) q(2)  q(3)  q(4);...
     q(5) q(6)  q(7)  q(8);...
     q(9) q(10) q(11) q(12);];
