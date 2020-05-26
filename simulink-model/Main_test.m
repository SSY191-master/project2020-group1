clear all, clc
load('FlightData.mat')

%% LQ controller
clear all, clc, close all
% cd D:\project1_git\project2020-group1\simulink-model
load('FlightData.mat')

% Complementary filter coefficents
alpha = 0.1;
Ts = 0.01;
g = 9.81;
m = 0.027;
Ts = 0.01;

base_thrust = ((m*g)/4)*(1/(0.06/4*g/65536)); % Base thrust

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
Bd = (pinv(A)*expm(A*Ts)*B-pinv(A)*B)*0.06/4*g/65536;

Cdnew = [1 0 0 0 0 0;
         0 1 0 0 0 0];

Qx = diag([100 100 1 10 10 10])*10;    % Tune these
Qu = 0.1*eye(4);        % Tune these


Klqr = dlqr(Ad,Bd,Qx,Qu);
Klqr = [Klqr(:,1:2) Klqr(:,4:end)] % Only use phi, theta, wx, wy and wz.

'done'
