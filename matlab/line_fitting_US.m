A=load('us_readings.txt')
N =size(A,2);

axis equal

for K=1:size(A,1),
clf

set(gcf,'DoubleBuffer','On');
hold on;

rho=A(K,:);
theta=linspace(-15,15,N);
theta=theta/180*pi;

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

