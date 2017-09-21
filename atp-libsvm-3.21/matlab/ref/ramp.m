%-----------------
xmax = 2.9;
xmin = -xmax;
Nx=300;
x=linspace(xmin, xmax, Nx);
y1 = 2.2.*(x<=-1.2) + (1 - x).*(-1.2<x & x<1) +0.*(x>=1);%convex1


p1 = plot(x,y1,'r','linewidth',5);
hold on;
axis([-2 2 -0.8 3]);
axis equal;
grid on;
    
myLegend = legend(p1,'$L_{ramp}^{t}(u)$');
set(myLegend,'Interpreter','latex');
set(myLegend,'fontsize',45);
set(myLegend,'Location','NorthEast');
set(myLegend,'Box','off');

%title('A Convex Function','fontsize',16);
set(gca, 'XTick',[-1.2,0,1] ); 
set(gca, 'XTicklabel',{'t','0','1'});
set(gca, 'YTick',[0] ); 
set(gca, 'YTicklabel',{'0'});

set(gca,'linewidth',2,'fontsize',35,'fontname','Times');
xlabel('u','linewidth',2,'fontsize',35);
ylabel('linewidth',3,'fontsize',35);
%ylabel('Pinball Loss $P_{0,0}(u)$','fontsize',18, 'Interpreter','latex');
%ylabel('Truncated Pinball Loss $P_{0,0}(u)$','fontsize',16, 'Interpreter','latex');