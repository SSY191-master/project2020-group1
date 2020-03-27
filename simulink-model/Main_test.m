load('FlightData.mat')

% Complementary filter coefficents
alpha = 0.1;
Ts = 0.01;


% Controller gain
P_gain = 10000;


% Angles for acceleration
% phi_a = atan2(fby,fbz);
% theta_a = atan2(-fbx,sqrt((fby)^2+(fbz)^2));

% Rotation matrices 
% syms phi theta psi
% rot_x = [1 0 0;0 cos(phi) sin(phi);0 -sin(phi) cos(phi)]
% rot_y = [cos(theta) 0 -sin(theta);0 1 0; sin(theta) 0 cos(theta)]
% rot_z = [cos(psi) sin(psi) 0; -sin(psi) cos(psi) 0; 0 0 1]


% R=simplify(rot_x*rot_y*rot_z)
