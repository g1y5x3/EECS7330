% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1386.337418719441757 ; 1381.756389345810248 ];

%-- Principal point:
cc = [ 359.607740109658550 ; 270.328130869737151 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.146122288244541 ; 0.250972210091359 ; 0.001468158024373 ; 0.005469651821088 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 14.626461018281395 ; 14.381653650186788 ];

%-- Principal point uncertainty:
cc_error = [ 24.215500031124051 ; 17.780277569799470 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.089082691552859 ; 1.118986722370773 ; 0.003412564207625 ; 0.004240811151541 ; 0.000000000000000 ];

%-- Image size:
nx = 640;
ny = 480;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 5;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 1.832160e+00 ; 1.843330e+00 ; 6.522289e-01 ];
Tc_1  = [ -1.263210e+02 ; -9.978183e+01 ; 5.710051e+02 ];
omc_error_1 = [ 1.350658e-02 ; 1.140397e-02 ; 1.852975e-02 ];
Tc_error_1  = [ 1.011091e+01 ; 7.464437e+00 ; 6.818505e+00 ];

%-- Image #2:
omc_2 = [ -2.110627e+00 ; -2.125357e+00 ; 2.019085e-01 ];
Tc_2  = [ -1.333201e+02 ; -1.008726e+02 ; 6.737995e+02 ];
omc_error_2 = [ 1.269906e-02 ; 1.104123e-02 ; 2.504220e-02 ];
Tc_error_2  = [ 1.180448e+01 ; 8.738010e+00 ; 7.147083e+00 ];

%-- Image #3:
omc_3 = [ 1.852453e+00 ; 1.717984e+00 ; -3.735949e-01 ];
Tc_3  = [ -1.355029e+02 ; -9.514536e+01 ; 6.256810e+02 ];
omc_error_3 = [ 9.068492e-03 ; 1.367444e-02 ; 2.059263e-02 ];
Tc_error_3  = [ 1.098094e+01 ; 8.121979e+00 ; 6.586956e+00 ];

%-- Image #4:
omc_4 = [ -1.804328e+00 ; -2.023553e+00 ; -8.361556e-01 ];
Tc_4  = [ -1.096071e+02 ; -1.043546e+02 ; 5.322649e+02 ];
omc_error_4 = [ 7.460223e-03 ; 1.432727e-02 ; 2.081726e-02 ];
Tc_error_4  = [ 9.423538e+00 ; 6.976094e+00 ; 6.498812e+00 ];

%-- Image #5:
omc_5 = [ 2.096274e+00 ; 2.119540e+00 ; 2.475089e-01 ];
Tc_5  = [ -1.378872e+02 ; -1.010351e+02 ; 6.838681e+02 ];
omc_error_5 = [ 1.263436e-02 ; 1.224436e-02 ; 2.332807e-02 ];
Tc_error_5  = [ 1.205263e+01 ; 8.915543e+00 ; 7.715088e+00 ];

