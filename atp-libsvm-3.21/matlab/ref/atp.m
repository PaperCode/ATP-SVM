tau = 0.5;
t = -1.2;
s = 1.8;
%-----------------
xmax = 7;
xmin = -7;
Nx=500;
x=linspace(xmin, xmax, Nx);
y1 = (-(1+tau)*(x-1)).*(x<1) + 0.*(x>=1);%convex1
y2 = (t-x).*(x<t) + 0.*(x>=t);
y3 = (-tau*(x-s)).*(x<s) +0.*(x>=s);
y4 = y2 + y3 - tau*(s-1);%convex2
y5 = y1 - y4;%final

p1 = plot(x,y1,'b-.','linewidth',3);
hold on;
p2 = plot(x,y4,'g--','linewidth',3);
hold on;
p3 = plot(x,y5,'r','linewidth',3.5);
axis([-6 6 -1 9]);
axis equal;
%grid on;
    
myLegend = legend([p1,p2, p3],...
    '$H_{1+\tau}(u-1)$',...
    '$H_{1}(u-t) + H_{\tau}(u-s) - \tau(s-1)$',...
    '$L_{atp}^{\tau,s,t}(u)$');
set(myLegend,'Interpreter','latex');
set(myLegend,'fontsize',17,'linewidth',2);
set(myLegend,'Location','NorthEast');
set(myLegend,'Box','off');
%title('Difference of Two Convex Functions','fontsize',18);
set(gca, 'XTick',[t, 0, 1, s] ); 
set(gca, 'XTicklabel',{'t', '0', '1', 's'});
set(gca, 'YTick',[0] ); 
set(gca, 'YTicklabel',{'0'});

set(gca,'linewidth',2,'fontsize',28,'fontname','Times');