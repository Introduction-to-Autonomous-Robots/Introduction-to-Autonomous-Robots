function [alpha,r]=leastsquares(rho,theta)

N=length(rho);

% Calculate least-square fit for the line based on noisy data
S1=sum((rho.^2).*sin(2*theta));
S2=0;
 for I=1:N,
   for J=1:N,
         S2=S2+rho(I)*rho(J)*cos(theta(I))*sin(theta(J));
   end;
 end;
S3=sum((rho.^2.*cos(2*theta)));
S4=0;
 for I=1:N,
     for J=1:N,
          S4=S4+rho(I)*rho(J)*cos(theta(I)+theta(J));
     end;
 end;
 
 alpha=0.5*atan2((S1/N-2*S2/(N*N)),(S3/N-S4/(N*N)))+90/180*pi;
 r=sum(rho.*cos(theta-alpha))/N;
 