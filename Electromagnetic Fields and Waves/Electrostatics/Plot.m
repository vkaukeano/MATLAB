pointsize = 100;
%scatter3( E_matrix(:,1), E_matrix(:,2), E_matrix(:,3), pointsize,E_matrix(:,4), 'filled')
xlabel('X Axis')
ylabel('Y Axis')
zlabel('Z Axis')
max = 19965049.3834652;
quiver3(E_matrix(:,1),E_matrix(:,2),E_matrix(:,3),max.*(E_matrix(:,3)./abs(E_matrix(:,3))),E_matrix(:,4),E_matrix(:,3))

xlabel('X Axis')
ylabel('Y Axis')
zlabel('Z Axis')