x=fmincon(@(x) error_d(x,rho,theta-0.5*pi),[1 10],[],[],[],[],[0 5],[pi 100])

figure();
hold on;

alpha=x(1);
r=x(2);

% Plot result
hold on;
plot([cos(alpha)*r cos(alpha)*r-sin(alpha)*r],[sin(alpha)*r sin(alpha)*r+cos(alpha)*r],'--');
plot([cos(alpha)*r cos(alpha)*r+sin(alpha)*r],[sin(alpha)*r sin(alpha)*r-cos(alpha)*r],'--');
plot(rho.*cos(theta),rho.*sin(theta),'*'); 
