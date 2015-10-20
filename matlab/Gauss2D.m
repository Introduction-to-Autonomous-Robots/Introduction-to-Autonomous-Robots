function p=Gauss2D(x,y,m1,m2,s1,s2)

p=exp(-((x-m1).^2/(2*s1*2)+(y-m2).^2/(2.*s2^2)));

% Testing
%G=Gauss2D(repmat(linspace(-5,5),100,1),repmat(linspace(-5,5),100,1)',0,0,0.1,0.2); 
