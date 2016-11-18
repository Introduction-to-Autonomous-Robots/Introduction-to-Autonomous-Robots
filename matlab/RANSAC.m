A=load('us_readings.txt');
N =size(A,2);
K=5;

%for K=1:size(A,1);
%clf;

nin=0;

for R=1:100;

%clf;


rho=A(K,:);
theta=linspace(-15,15,N);
theta=theta/180*pi;

plot(rho.*cos(theta),rho.*sin(theta),'*'); hold on;

% Guess r and alpha
%% 1. Approach: r and alpha completely random
%r=rand()*50;
%alpha=(rand()*90-45)/180*pi;
%% 2. Approach: pick two random points
 P1=round(rand()*(N-1))+1
 P2=round(rand()*(N-1))+1
 [alpha,r]=leastsquares(rho([P1 P2]),theta([P1 P2]))
 plot(rho([P1 P2]).*cos(theta([P1 P2])),rho([P1 P2]).*sin(theta([P1 P2])),'r*'); hold on;

% Plot the estimated line
plot([cos(alpha)*r cos(alpha)*r-sin(alpha)*r],[sin(alpha)*r sin(alpha)*r+cos(alpha)*r],'--');
plot([cos(alpha)*r cos(alpha)*r+sin(alpha)*r],[sin(alpha)*r sin(alpha)*r-cos(alpha)*r],'--');

% Calculate error
di=rho.*cos(theta-alpha)-r;
d=sum(di.^2);

% Calculate inliers
inliers=abs(di)<1;

if(sum(inliers)>nin)
    besta = alpha;
    bestr = r;
    nin = sum(inliers);
end;

plot(rho.*cos(theta),rho.*sin(theta),'*'); hold on;
plot(rho(inliers).*cos(theta(inliers)),rho(inliers).*sin(theta(inliers)),'g*'); hold on;


title(sprintf('Squared error %f, number of inliers %d',d,sum(inliers)));
xlabel(sprintf('Best: %d at alpha=%f and r=%f',nin,besta/pi*180,bestr));
axis([0 70 -25 25])
drawnow;
end;


% Final display
% Calculate error
di=rho.*cos(theta-besta)-bestr;
d=sum(di.^2);

% Calculate inliers
inliers=abs(di)<1;

plot(rho.*cos(theta),rho.*sin(theta),'*'); hold on;
plot(rho(inliers).*cos(theta(inliers)),rho(inliers).*sin(theta(inliers)),'g*'); hold on;

plot([cos(besta)*bestr cos(besta)*bestr-sin(besta)*bestr],[sin(besta)*r sin(besta)*r+cos(besta)*bestr],'LineWidth',3);
plot([cos(besta)*bestr cos(besta)*bestr+sin(besta)*bestr],[sin(besta)*r sin(besta)*r-cos(besta)*bestr],'LineWidth',3);
