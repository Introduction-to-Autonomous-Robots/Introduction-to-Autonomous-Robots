function h=show_coord(T);
hold on;
h(1)=quiver3(T(1,4),T(2,4),T(3,4),T(1,1),T(2,1),T(3,1),'r');
h(2)=quiver3(T(1,4),T(2,4),T(3,4),T(1,2),T(2,2),T(3,2),'g');
h(3)=quiver3(T(1,4),T(2,4),T(3,4),T(1,3),T(2,3),T(3,3),'b');