function E=display_chain(T);

E=eye(4);
    show_coord(E);
for I=1:size(T,3),
    oldE=E;
    E=transform(rotz(0),T(1:3,4))*E; % 1. translate
    E=transform(T(1:3,1:3,I),[0 0 0])*E; % 2. rotate
    show_coord(E);
    draw_vector(oldE(1:3,4),E(1:3,4)-oldE(1:3,4)); 
    
end;