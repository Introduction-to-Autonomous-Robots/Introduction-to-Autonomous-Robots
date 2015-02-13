close all;
initialj=[45 30 30]';
goal=transform(eye(3),[5 5 0]);

delta=0.1;
[E,T]=planar_arm([initialj]);
display_chain(T);
%axis([-10 10 -10 +10 -10 10]);
axis([-16 16 -16 +16 -16 16]);

currentj=initialj;
Jacobian=eye(3);


b=0;
while(b~=3),
counter=0;
[x,y,b]=ginput(1);
goal(1,4)=x;
goal(2,4)=y;
show_coord(goal);
while(dist(E,goal)>0.1 && counter<100),
    counter=counter+1;
    [E,T]=planar_arm(currentj);
    Edelta(:,:,1)=planar_arm(currentj+[delta 0 0]');
    Edelta(:,:,2)=planar_arm(currentj+[0 delta 0]');
    Edelta(:,:,3)=planar_arm(currentj+[0 0 delta]');
    cla
    display_chain(T);
   

    xlabel(sprintf('%d',counter));
    drawnow;
    for I=1:3,
     Jacobian(1,I)=(E(1,4)-Edelta(1,4,I))/delta;
     Jacobian(2,I)=(E(2,4)-Edelta(2,4,I))/delta;
     Jacobian(3,I)=(E(3,4)-Edelta(3,4,I))/delta;
     quiver3(E(1,4),E(2,4),E(3,4),Jacobian(1,I),Jacobian(2,I),Jacobian(3,I),'c')
    end;

    % displacement = Jacobian * change_in_joints
    % inv(Jacobian)*displacement = change_in_joints
    
    currentj=currentj+pinv(Jacobian)*(E(1:3,4)-goal(1:3,4))/10;
  end;
end;

