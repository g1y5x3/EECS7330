% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 2138.895753865000643 ; 2062.943387402081044 ];

%-- Principal point:
cc = [ 319.455670444727616 ; 258.310434196040887 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.533652092506046 ; 7.299670918401591 ; 0.002958415161135 ; 0.010269137576268 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 2308.162506901086090 ; 2004.335318763304031 ];

%-- Principal point uncertainty:
cc_error = [ 59.998440183519421 ; 39.376293121265284 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 1.147627186727000 ; 31.413229470340152 ; 0.002911056639019 ; 0.013456540655931 ; 0.000000000000000 ];

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
omc_1 = [ 2.036737e+00 ; 2.061109e+00 ; 3.358621e-01 ];
Tc_1  = [ -1.140517e+02 ; -9.503404e+01 ; 1.022708e+03 ];
omc_error_1 = [ 1.881903e-01 ; 1.935994e-01 ; 3.174435e-01 ];
Tc_error_1  = [ 2.884162e+01 ; 1.962792e+01 ; 9.929062e+02 ];

%-- Image #2:
omc_2 = [ 2.035901e+00 ; 2.058622e+00 ; 3.375355e-01 ];
Tc_2  = [ -1.068285e+02 ; -9.477597e+01 ; 9.656018e+02 ];
omc_error_2 = [ 1.868951e-01 ; 1.920962e-01 ; 3.158756e-01 ];
Tc_error_2  = [ 2.721128e+01 ; 1.852899e+01 ; 9.376410e+02 ];

%-- Image #3:
omc_3 = [ 2.035296e+00 ; 2.057233e+00 ; 3.396775e-01 ];
Tc_3  = [ -9.955274e+01 ; -9.455419e+01 ; 9.082295e+02 ];
omc_error_3 = [ 1.863298e-01 ; 1.914266e-01 ; 3.138797e-01 ];
Tc_error_3  = [ 2.557706e+01 ; 1.742808e+01 ; 8.821910e+02 ];

%-- Image #4:
omc_4 = [ 2.034926e+00 ; 2.057336e+00 ; 3.399225e-01 ];
Tc_4  = [ -9.242927e+01 ; -9.426778e+01 ; 8.515782e+02 ];
omc_error_4 = [ 1.862925e-01 ; 1.914057e-01 ; 3.132754e-01 ];
Tc_error_4  = [ 2.396780e+01 ; 1.634213e+01 ; 8.272136e+02 ];

%-- Image #5:
omc_5 = [ 2.028753e+00 ; 2.060260e+00 ; 3.417465e-01 ];
Tc_5  = [ -8.514679e+01 ; -9.381450e+01 ; 7.935496e+02 ];
omc_error_5 = [ 1.855358e-01 ; 1.914479e-01 ; 3.099387e-01 ];
Tc_error_5  = [ 2.232530e+01 ; 1.523407e+01 ; 7.711872e+02 ];

