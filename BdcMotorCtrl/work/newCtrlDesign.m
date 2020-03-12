%% New Controller Design

%% Introduction
mdl = 'TopModel';
load_system(mdl);
h = get_param(mdl, 'modelworkspace');

%% Parameters
R = [2, 1.8, 2.2]; % (Ohm)
J = [.02, .03, .01]; % (kg.m2/s2)
[R, J] = ndgrid(R, J);

%% Linearization
params(1).Name = 'R';
params(1).Value = R;
params(2).Name = 'J';
params(2).Value = J;
io = getlinio(mdl);
[linsys, linop] = linearize(mdl, io, params);

%% Controller Design
% Starting from the current controller implemented in the Simulink model we
% start the SISO Control System Designer.
%
% Current requirements are:
%  # GM > 20 dB
%  # PM > 30 deg
%  # Rise time at 80% < 1 s 
%  # Settling time at 1 % < 5 s
%  # Overshoot < 10 %
%
% After tuning the controller, do not forget to export your design and
% update the Simulink model.
num = getVariable(h, 'ctrlNum');
den = getVariable(h, 'ctrlDen');
C = tf(num, den);
controlSystemDesigner(linsys, C);
