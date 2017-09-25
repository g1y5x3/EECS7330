function [ud,vd]=convert_undistor_distor_ToolBox(uu, vu, d, Intsc)
%
%   Copyright (C) 2003 ViGIR - Vision-Guided and Intelligent Robotics Lab
%   Written by Guilherme Nelson DeSouza <desouzag@missouri.edu>
%
%   This program is free software; you can redistribute it and/or modify
%   it under the terms of the GNU General Public License as published by
%   the Free Software Foundation, meaning:
%                       keep this copyright notice,
%                       do not try to make money out of it,
%                       it's distributed WITHOUT ANY WARRANTY,
%                       yada yada yada...
%
%
%   This function converts undistorted image coordinates into distorted
%   image coordinates using the radial and tangential distortion parameters.
%
%   Usage:  [ud,vd] = convert_undistor_distor_ToolBox(uu, vu, d, Intsc)
%
%          where (uu,vu) and (ud,vd) are the undistorted and distorted
%                                    pixel coordinates respectively;
%                d is the vector with the distortion parameters;
%           and  Intsc are the camera intrinsic parameters
%
u0 = Intsc(1,3);
v0 = Intsc(2,3);
au = Intsc(1,1);
av = Intsc(2,2);
nuu = (uu - u0)/au;
nvu = (vu - v0)/av;
dist_vec = [1 0 2*d(3) 3*d(4)   d(4) d(1)    0 d(1)    0 d(2)    0 2*d(2)      0 d(2)    0 d(5)    0 3*d(5)      0 3*d(5)      0  d(5)     0;
            0 1 2*d(4)   d(3) 3*d(4)    0 d(1)    0 d(1)    0 d(2)      0 2*d(2)    0 d(2)    0 d(5)      0 3*d(5)      0 3*d(5)     0  d(5)];
A = [nuu; nvu; nuu.*nvu; nuu.^2; nvu.^2; nuu.*(nvu.^2); (nuu.^2).*nvu; nuu.^3; nvu.^3; ...
     nuu.*(nvu.^4); (nuu.^4).*nvu; (nuu.^3).*(nvu.^2); (nuu.^2).*(nvu.^3); (nuu.^5); (nvu.^5);...
     nuu.*(nvu.^6); (nuu.^6).*nvu; (nuu.^3).*(nvu.^4); (nuu.^4).*(nvu.^3); (nuu.^5).*(nvu.^2); (nuu.^2).*(nvu.^5); ...
     nuu.^7; nvu.^7];
%     1    0    2*d3      3*d4     d4       d1             0             d1       0
%        d2                0             2*d2                  0              d2         0
%        d5                0             3*d5                  0                 3*d5                  0
%     d5       0
%
%     0    1    2*d4       d3     3*d3       0             d1             0      d1
%         0               d2               0                 2*d2              0        d2
%         0               d5               0                 3*d5                   0               3*d5
%      0      d5
nd = dist_vec*A;
ud = nd(1,:)*au + u0;
vd = nd(2,:)*av + v0;