% Generate wheel movements
dsl=ones(100,1)*0.11;
dsr=ones(100,1).*0.10;

% Initialize position
x=0;
y=0;
theta=0;
Cp=[0 0 0; 
    0 0 0; 
    0 0 0];

% Setup drawing
subplot(1,2,2);
set(gcf,'DoubleBuffer','On');
xlabel('X position');
ylabel('Y positiion');

subplot(1,2,1);
hold on;
set(gcf,'DoubleBuffer','On');
axis([0 12 -2 7]);
xlabel('X position');
ylabel('Y positiion');



for I=1:length(dsl),
 oldx=x;
 oldy=y;   
 [x,y,theta,Cp]=pos_update(x,y,theta,dsl(I),dsr(I),Cp);
 
 % Plotting
 subplot(1,2,1);
 plot([oldx x],[oldy y],'b--');
 if(mod(I,10)==0)
  quiver(x,y,cos(theta),sin(theta),'b');
  
  Ellipse_x=Cp(1,1).*cos(0:0.01:2*pi);
  Ellipse_y=Cp(2,2).*sin(0:0.01:2*pi);
  plot(x+Ellipse_x.*cos(theta)-Ellipse_y*sin(theta),y+Ellipse_x.*sin(theta)+Ellipse_y*cos(theta),'--');

 end;
 subplot(1,2,2);
  G=Gauss2D(repmat(linspace(0,12),100,1),repmat(linspace(-2,7),100,1)',x,y,Cp(1,1),Cp(2,2)); 
  mesh(linspace(0,12),linspace(-2,7),G);
  drawnow;
end;