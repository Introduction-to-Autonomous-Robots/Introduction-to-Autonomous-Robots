% Define line y=mx+c with N samples
m=-0.05;
c=40;
N=40;

x=linspace(-30,30,N);
y=m*x+c;




axis equal

for K=1:50,
clf

% Plot the real line
plot(x,y);
axis([-50 50 -10 60]);
set(gcf,'DoubleBuffer','On');
hold on;

% Sample theta and rho from the line
theta=atan2(y,x);
rho=x./cos(theta);

% Add %5 noise to rho
rho=rho+(rand(1,length(rho))-0.5).*rho/100*20;

% Plot the individual laser rays
for I=1:N,
 plot([0 (cos(theta(I)).*rho(I))'],[0 (sin(theta(I)).*rho(I))'],'c--');
end;
plot(rho.*cos(theta),rho.*sin(theta),'r*');

[alpha,r]=leastsquares(rho,theta)
 
 % Plot the estimated orthogonal
 plot([0 cos(alpha)*r],[0 sin(alpha)*r],'r')
 
 % Plot the estimated line itself
 plot([cos(alpha)*r cos(alpha)*r-sin(alpha)*r],[sin(alpha)*r sin(alpha)*r+cos(alpha)*r],'LineWidth',3);
 plot([cos(alpha)*r cos(alpha)*r+sin(alpha)*r],[sin(alpha)*r sin(alpha)*r-cos(alpha)*r],'LineWidth',3);

 
drawnow;

end;

