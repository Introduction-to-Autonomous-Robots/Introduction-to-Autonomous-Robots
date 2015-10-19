function d=error_d(param,rho,theta)
alpha=param(1);
r=param(2);

di=rho.*cos(theta-alpha)-r;
d=sum(di.^2);