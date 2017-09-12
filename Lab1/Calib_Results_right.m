% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ -2257.851654756119387 ; -2060.359012052990238 ];

%-- Principal point:
cc = [ 997.536446143717399 ; 219.475960474683831 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.242403128466287 ; 0.111139349134334 ; -0.011176949620196 ; 0.063768564723309 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 510.224313443054655 ; 429.442035313733527 ];

%-- Principal point uncertainty:
cc_error = [ 0.000000000000000 ; 0.000000000000000 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.163160299542418 ; 0.156480003162426 ; 0.004576482972816 ; 0.028290925130864 ; 0.000000000000000 ];

%-- Image size:
nx = 640;
ny = 480;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 5;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 0;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -2.034668e+00 ; 2.091465e+00 ; -3.354592e-01 ];
Tc_1  = [ 3.928109e+02 ; 4.495539e+01 ; 1.085937e+03 ];
omc_error_1 = [ 3.959444e-02 ; 3.842711e-02 ; 5.987681e-02 ];
Tc_error_1  = [ 8.010749e+00 ; 6.515473e-01 ; 2.264274e+02 ];

%-- Image #2:
omc_2 = [ -2.024845e+00 ; 2.103155e+00 ; -3.319487e-01 ];
Tc_2  = [ 3.726748e+02 ; 4.688360e+01 ; 1.067498e+03 ];
omc_error_2 = [ 3.954829e-02 ; 3.868726e-02 ; 5.960941e-02 ];
Tc_error_2  = [ 1.022014e+01 ; 9.611359e-01 ; 2.140967e+02 ];

%-- Image #3:
omc_3 = [ -2.007347e+00 ; 2.116485e+00 ; -3.301743e-01 ];
Tc_3  = [ 3.500445e+02 ; 4.681356e+01 ; 1.047092e+03 ];
omc_error_3 = [ 3.941143e-02 ; 3.913889e-02 ; 5.908324e-02 ];
Tc_error_3  = [ 1.236413e+01 ; 1.258399e+00 ; 2.014516e+02 ];

%-- Image #4:
omc_4 = [ -2.021826e+00 ; 2.104464e+00 ; -3.317101e-01 ];
Tc_4  = [ 3.277908e+02 ; 5.024002e+01 ; 1.026811e+03 ];
omc_error_4 = [ 3.954760e-02 ; 3.872627e-02 ; 5.961605e-02 ];
Tc_error_4  = [ 1.450600e+01 ; 1.565159e+00 ; 1.888887e+02 ];

%-- Image #5:
omc_5 = [ -1.999453e+00 ; 2.122170e+00 ; -3.295581e-01 ];
Tc_5  = [ 3.073353e+02 ; 5.202118e+01 ; 1.007914e+03 ];
omc_error_5 = [ 3.940158e-02 ; 3.929915e-02 ; 5.896955e-02 ];
Tc_error_5  = [ 1.677767e+01 ; 1.892005e+00 ; 1.763373e+02 ];

