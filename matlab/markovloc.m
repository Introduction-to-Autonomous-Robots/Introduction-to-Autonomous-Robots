% Map dimensions
width=30;
height=50;

% Robot position
x=width/2;
y=height/2;

% Initialize Probability Map
% 1. Initialize with Dirac at known position
Ploc=zeros(height,width);
Ploc(y,x)=1;
% 2. Or initialize with uniform distribution
%Ploc=ones(height,width)/(height*width);


% Motion model
mmodel=[0.1 0.1 0.1;
        0.1 0.9 0.1
        0.1 0.1 0.1];
mmodel=mmodel/sum(sum(mmodel));

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

colormap(gray);
disp('Control robot with i,j,k,l');

subplot(1,2,1);
imagesc(Ploc);
title('P(loc)');

subplot(1,2,2)
imagesc(Pfeat);
title('P(feat|loc)');

while(waitforbuttonpress),
 key = get(gcf,'CurrentCharacter');
 switch(key)
     case 'i' 
         if(y>2), y=y-1; mmmodel=[mmodel; 0 0 0]; end;
     case 'k'
         if(y<height-1), y=y+1; mmmodel=[0 0 0; 0 0 0; mmodel]; end;
     case 'j'
         if(x>2), x=x-1; mmmodel=[mmodel [0 0 0]']; end;
     case 'l'
         if(x<width-1), x=x+1; mmmodel=[[0 0 0]' [0 0 0]' mmodel]; end;
 end;

 
 % Action update
 M=zeros(height,width);
 M((y-1):(y+1),(x-1):(x+1))=mmodel;
 subplot(1,2,2);
 imagesc(M+Pfeat);
 title('P(feat|loc)');
 
 Ploc=conv2(Ploc,mmmodel,'same');
 Ploc=Ploc/sum(sum(Ploc));
 
 subplot(1,2,1);

 % Perception update
 % P(loc|feat) = P(loc)P(feat|loc)
 if(Pfeat(y,x)>0),
  Ploc = Ploc.*Pfeat; Ploc=Ploc/sum(sum(Ploc));
  imagesc(Ploc)
  title('P(loc|feat)');
 else
  imagesc(Ploc);
  title('P(loc)');  
 end;
end;





    
