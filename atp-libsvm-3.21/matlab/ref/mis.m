%-----------------
xmax = 2.9;
xmin = -xmax;
Nx=300;
x1=linspace(xmin, 0, Nx);
x2=linspace(0, xmax, Nx);

y1 = 1;%convex1
y2 = 0;%convex1


p1 = plot(x1,y1,'r','linewidth',5);
hold on;
p2 = plot(x2,y2,'r','linewidth',5);
hold on;
axis([-2 2 -0.8 3]);
axis equal;
grid on;
    
myLegend = legend(p1,'$L_{mis}(u)$');
set(myLegend,'Interpreter','latex');
set(myLegend,'fontsize',45);
set(myLegend,'Location','NorthEast');
set(myLegend,'Box','off');

%title('A Convex Function','fontsize',16);
set(gca, 'XTick',[0] ); 
set(gca, 'XTicklabel',{'0'});
set(gca, 'YTick',[ 0,1] ); 
set(gca, 'YTicklabel',{'0','1'});

set(gca,'linewidth',2,'fontsize',35,'fontname','Times');
xlabel('u','linewidth',2,'fontsize',35);
ylabel('linewidth',3,'fontsize',35);
%ylabel('Pinball Loss $P_{0,0}(u)$','fontsize',18, 'Interpreter','latex');
%ylabel('Truncated Pinball Loss $P_{0,0}(u)$','fontsize',16, 'Interpreter','latex');