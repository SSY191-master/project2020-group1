
clear all


J = sym('J',[3,3]);
syms phi dphi ddphi theta dtheta ddtheta psi dpsi ddpsi tau_x tau_y tau_z 
d = 0.046;
b = 1.97e-9;
k = 2.53e-11;
% omega = sym('omega',[3,1]);
ctrl = sym('ctrl_',[4,1]);

tau_x = d*sin(pi/4) * (ctrl(3) + ctrl(4) - ctrl(1) - ctrl(2));
tau_y = d*sin(pi/4) * (ctrl(2) + ctrl(3) - ctrl(1) - ctrl(4));
tau_z = (b/k)*(-ctrl(1)-ctrl(3)+ctrl(4)+ctrl(2));
tau = [tau_x tau_y tau_z].';

% tau = sym('tau',[3,1]);
omega = [dphi; dtheta; dpsi];
f =J\(cross(-omega,J*omega)+tau);

x0 = zeros(6,1);
tau0 = zeros(3,1);
x = [phi; theta; psi; omega]; 
xdot = [omega(1); omega(2); omega(3); f];
dfdx = jacobian(xdot,x)

dfdu = jacobian(xdot,ctrl)

Jx = 1.1463e-5;
Jy = 1.6993e-5;
Jz = 2.9944e-5;
J = [Jx,0,0;0,Jy,0;0,0,Jz];
J1_1 = J(1,1);
J1_2 = J(1,2);
J1_3 = J(1,3);
J2_1 = J(2,1);
J2_2 = J(2,2);
J2_3 = J(2,3);
J3_1 = J(3,1);
J3_2 = J(3,2);
J3_3 = J(3,3);
dphi = 0 %omega(1);
dtheta = 0 %omega(2);
dpsi = 0 %omega(3);
%%

A = [0     0     0     1     0     0;
     0     0     0     0     1     0;
     0     0     0     0     0     1;
     0     0     0     0     0     0;
     0     0     0     0     0     0;
     0     0     0     0     0     0]

 B = 1.0e+06 *[0         0         0         0;
               0         0         0         0;
               0         0         0         0;
              -0.0028   -0.0028    0.0028    0.0028;
              -0.0019    0.0019    0.0019   -0.0019;
              -2.6045    2.6045   -2.6045    2.6045]

C = [1 0 0 0 0 0;
     0 1 0 0 0 0]; 
 
D = zeros(2,4);