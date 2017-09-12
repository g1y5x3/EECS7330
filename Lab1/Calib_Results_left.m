% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1125.020769242885763 ; 1213.316329123976857 ];

%-- Principal point:
cc = [ 666.537486761337618 ; 265.856356651125452 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.004161042591768 ; -0.033417679405156 ; -0.002498121786532 ; -0.007718252147014 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 204.506651788805698 ; 209.650365134774972 ];

%-- Principal point uncertainty:
cc_error = [ 0.000000000000000 ; 0.000000000000000 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.051182576664382 ; 0.060675769463713 ; 0.000879667781287 ; 0.009567206689060 ; 0.000000000000000 ];

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
omc_1 = [ 2.143812e+00 ; 2.075957e+00 ; 2.236542e-01 ];
Tc_1  = [ -3.209497e+02 ; -5.818993e+01 ; 6.007061e+02 ];
omc_error_1 = [ 2.158625e-02 ; 2.198154e-02 ; 3.812680e-02 ];
Tc_error_1  = [ 2.582232e+00 ; 1.574072e-01 ; 1.039105e+02 ];

%-- Image #2:
omc_2 = [ 2.152538e+00 ; 2.063469e+00 ; 2.293567e-01 ];
Tc_2  = [ -3.104784e+02 ; -5.835696e+01 ; 6.063738e+02 ];
omc_error_2 = [ 2.233828e-02 ; 2.238560e-02 ; 3.964655e-02 ];
Tc_error_2  = [ 1.113147e+00 ; 4.631097e-01 ; 9.783359e+01 ];

%-- Image #3:
omc_3 = [ 2.167472e+00 ; 2.046668e+00 ; 2.337416e-01 ];
Tc_3  = [ -2.975011e+02 ; -5.657913e+01 ; 6.112777e+02 ];
omc_error_3 = [ 2.279741e-02 ; 2.239749e-02 ; 4.065637e-02 ];
Tc_error_3  = [ 8.614908e-01 ; 7.684082e-01 ; 9.184216e+01 ];

%-- Image #4:
omc_4 = [ 2.152561e+00 ; 2.062628e+00 ; 2.625546e-01 ];
Tc_4  = [ -2.851523e+02 ; -6.021515e+01 ; 6.133830e+02 ];
omc_error_4 = [ 2.262279e-02 ; 2.097275e-02 ; 4.936833e-02 ];
Tc_error_4  = [ 2.380687e+00 ; 1.155070e+00 ; 8.481895e+01 ];

%-- Image #5:
omc_5 = [ 2.172358e+00 ; 2.036191e+00 ; 2.353891e-01 ];
Tc_5  = [ -2.744014e+02 ; -5.788417e+01 ; 6.209173e+02 ];
omc_error_5 = [ 2.336556e-02 ; 2.269972e-02 ; 4.070886e-02 ];
Tc_error_5  = [ 4.084784e+00 ; 1.255012e+00 ; 7.972944e+01 ];

