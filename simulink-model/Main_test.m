clear all, clc
load('FlightData.mat')
% D:\project1_git\project2020-group1\simulink-model


% Complementary filter coefficents
alpha = 0.1;
Ts = 0.01;

% Controller gain
P_gain = 40000;

%%
% Angles for acceleration
% phi_a = atan2(fby,fbz);
% theta_a = atan2(-fbx,sqrt((fby)^2+(fbz)^2));

% Rotation matrices 
syms phi theta psi dphi dtheta dpsi
rot_x = [1 0 0;0 cos(phi) -sin(phi);0 sin(phi) cos(phi)]
rot_y = [cos(theta) 0 sin(theta);0 1 0; -sin(theta) 0 cos(theta)]
rot_z = [cos(psi) -sin(psi) 0; sin(psi) cos(psi) 0; 0 0 1]

R=rot_z*rot_y*rot_x


w = [dphi;0;0]+rot_x*[0;dtheta;0]+rot_x*rot_y*[0;0;dpsi]

%% LQ controller
clear all, clc, close all
load('FlightData.mat')

% Complementary filter coefficents
alpha = 0.1;
Ts = 0.01;
g = 9.81;
Ts = 0.01;


A = [0     0     0     1     0     0;
     0     0     0     0     1     0;
     0     0     0     0     0     1;
     0     0     0     0     0     0;
     0     0     0     0     0     0;
     0     0     0     0     0     0];

 B = 1.0e+06 *[0         0         0         0;
               0         0         0         0;
               0         0         0         0;
              -0.0028   -0.0028    0.0028    0.0028;
              -0.0019    0.0019    0.0019   -0.0019;
              -2.6045    2.6045   -2.6045    2.6045];

C = [1 0 0 0 0 0;
     0 1 0 0 0 0]; 
 
D = zeros(2,4);

Ad = expm(A*Ts);
Bd = (pinv(A)*expm(A*Ts)*B-pinv(A)*B); % Add this: *0.06/4*g/65536 : And remove 

Cdnew = [1 0 0 0 0 0;
         0 1 0 0 0 0];

Qx = 10*diag([1 1 1 1 1 1]);    % Tune these
Qu = 10*diag([1 1 1 1]);        % Tune these

Klqr = dlqr(Ad,Bd,Qx,Qu)

Klqr = [Klqr(:,1:2) Klqr(:,4:end)]

'done'
