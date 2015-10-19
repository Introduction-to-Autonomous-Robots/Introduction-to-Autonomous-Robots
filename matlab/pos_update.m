function [x,y,theta,Cp]=pos_update(x,y,theta,dsr,dsl,Cp)


ds = (dsr+dsl)/2;
dtheta = (dsr-dsl)/2;
dx = ds*cos(theta+dtheta/2);
dy = ds*sin(theta+dtheta/2);

% Covariance of wheel slip
Cw = [abs(dsr)/100 0; 
      0 abs(dsl)/100];

% Partial derivatives of kinematics with respect to x, y, theta
Pp =[1 0 -ds*sin(theta+dtheta/2);
     0 1 ds*cos(theta+dtheta/2);
     0 0 1];
% Partial derivatives of kinematics with respect to wheel motion
Pw = [0.5*cos(theta+dtheta/2) 0.5*cos(theta+dtheta/2); 
      0.5*sin(theta+dtheta/2) 0.5*sin(theta+dtheta/2);
      0.5                     -0.5];
 

x=x+dx;
y=y+dy;
theta=theta+dtheta;

% Dimensions: 3x3 3x3 3x3 + 3x2 2x2 2x3
Cp=Pp*Cp*Pp'+Pw*Cw*Pw';