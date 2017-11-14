x = [1 50 50 1 1];
y = [1 1 50 50 1];
plot(x,y,'k','LineWidth',2,'Clipping','off')
axis equal
axis ij
axis off

hold on
plot(25,25,'k','Marker','o','MarkerSize',8,'MarkerFaceColor','k')

plot([1 25], [1 25], 'b', 'LineWidth', 2, 'LineStyle', '--')

plot([1 49], [49 1], 'b', 'LineWidth', 2)

text(10,20,'\rho = 33.9')
text(5,3,'\theta = 45^\circ')
text(27,25,'(25,25)')
text(-3,-1,'(1,1)')

hold off