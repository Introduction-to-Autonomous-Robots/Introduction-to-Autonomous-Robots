function [E,T]=planar_arm(alpha)

E=eye(4);
for I=1:length(alpha),
 T(:,:,I)=transform(rotz(alpha(I)),[5 0 0]);
 E=transform(rotz(0),T(1:3,4))*E; % 1. translate
 E=transform(T(1:3,1:3,I),[0 0 0])*E; % 2. rotate
   
 %E=T(:,:,I)*E;
end;