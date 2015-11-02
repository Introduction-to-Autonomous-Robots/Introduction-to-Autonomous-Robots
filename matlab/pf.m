% Map dimensions
width=30;
height=50;

% Robot position
x=width/2;
y=height/2;

% Error model
sx = 0.5;
sy = 0.5;

% Particle filter
Nparticles = 200;
% Initialize around known position with Gaussian distribution
X=normrnd(x,sx,Nparticles,1);
Y=normrnd(y,sy,Nparticles,1);
% Initialize uniformly in the environment
X=rand(Nparticles,1)*width;
Y=rand(Nparticles,1)*height;
 

% Initialize P(feat|loc)
Pfeat=zeros(height,width);
% Add a border around the environment
Pfeat(:,3)=0.1;
Pfeat(:,width-2)=0.1;
Pfeat(3,:)=0.1;
Pfeat(height-2,:)=0.1;
Pfeat(:,2)=0.3;
Pfeat(:,width-1)=0.3;
Pfeat(2,:)=0.3;
Pfeat(height-1,:)=0.3;
Pfeat(:,1)=0.5;
Pfeat(:,width)=0.5;
Pfeat(1,:)=0.5;
Pfeat(height,:)=0.5;
% Add an obstacle
Pfeat(15:20,7:12)=0.5;
Pfeat(16:19,8:11)=0.01; % This is inside the obstacle

imagesc(Pfeat), hold on;
H=[]; % graphic handles
R=[];

while(waitforbuttonpress),

 key = get(gcf,'CurrentCharacter');
 % 1.A Action Update: move all particles
 switch(key)
     case 'i' 
         if(y>2), y=y-1; Y=Y-1;  end;
     case 'k'
         if(y<height-1), y=y+1; Y=Y+1;  end;
     case 'j'
         if(x>2), x=x-1; X=X-1;  end;
     case 'l'
         if(x<width-1), x=x+1; X=X+1; end;
 end;
 delete(H);
 delete(R);
 % 1.B Action update: add noise to particles
   X=normrnd(X,sx);
   Y=normrnd(Y,sy);
 
 % 1.C Action update: constrain particles to environment
 X(X<1)=1;
 X(X>width)=width;
 Y(Y<1)=1;
 Y(Y>height)=height;
 
 % 2. Perception update
 
if(Pfeat(y,x)>0),
 nX=[];
 nY=[];
 meanX=mean(X); % Keep this value in case no particle turns out to be valid
 meanY=mean(Y);
 for I=1:Nparticles,
  % Calculate the probability for this particle being valid
  probI = Pfeat(round(Y(I)),round(X(I)));
  if(rand()<probI) % Keep only selected particles
      nX=[nX; X(I)];
      nY=[nY; Y(I)];
  else
     % disp(sprintf('Rejecting %f,%f',X(I),Y(I)));
  end;
 end;
 X=nX;
 Y=nY;
 % Replace rejected particles with valid ones
 if(length(X)<Nparticles),
  if(length(X)>0),
  Header=1;
  for I=length(X)+1:Nparticles,
      X(I)=X(Header);
      Y(I)=Y(Header);
      Header=Header+1;
  end;
  else % reinitialize filter
     %X=normrnd(meanX,sx,Nparticles,1);
     %Y=normrnd(meanY,sy,Nparticles,1); 
     X=rand(Nparticles,1)*width;
     Y=rand(Nparticles,1)*height;
  end;
 end;
 end;
 
 H=plot([X],[Y],'r*');
 R=plot(x,y,'g*');
 
 
end;
 
