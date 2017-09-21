A = importdata('spambase');
%must comply with the data set!!!!!!!!!!!!!!!!!!!!!!!!!!
%[xq,yq] = meshgrid(-50:5:0, 1:2:21);
%[xq,yq] = meshgrid(-200:20:0, 1:1:11);
[xq,yq] = meshgrid(-200:20:0, 1:1:16);

%[xq,yq] = meshgrid(-6:0.6:0, 1:0.2:3);
%[xq,yq] = meshgrid(-6:0.6:0, 1:0.1:2);
%[xq,yq] = meshgrid(-5:0.5:0, 1:0.2:3);
%[xq,yq] = meshgrid(-4:0.4:0, 1:0.2:3);
%[xq,yq] = meshgrid(-4:0.4:0, 1:0.15:2.5);
%[xq,yq] = meshgrid(-3:0.3:0, 1:0.05:1.5);
%[xq,yq] = meshgrid(-3:0.3:0, 1:0.15:2.5);
%[xq,yq] = meshgrid(-3:0.3:0, 1:0.2:3);
%[xq,yq] = meshgrid(-3:0.3:0, 1:0.1:2);
%[xq,yq] = meshgrid(-100:10:0, 1:2:21);
%[xq,yq] = meshgrid(-2:0.2:0, 1:0.2:3);
%[xq,yq] = meshgrid(-2:0.2:0, 1:0.05:1.5);
%[xq,yq] = meshgrid(-2:0.2:0, 1:0.02:1.2);

%[xq,yq] = meshgrid(-4:0.4:0, 1:0.1:2);
%[xq,yq] = meshgrid(-1.5:0.15:0, 1:0.1:2);
%[xq,yq] = meshgrid(-1.5:0.15:0, 1.0:0.03:1.3);
%[xq,yq] = meshgrid(-1.5:0.15:0, 1.0:0.04:1.4);
%[xq,yq] = meshgrid(-2:0.2:0, 1:0.04:1.4);
%[xq,yq] = meshgrid(-1.5:0.15:0, 1.0:0.05:1.5);


x = A(:,1); 
y = A(:,2);
z = A(:,3);
%tmp = 2.^(-7:-1);
%[xq,yq] = meshgrid(tmp', 0:0.2:1);

vq = griddata(x,y,z,xq,yq);
surf(xq,yq,vq); 
%alpha(0.5);%transparent
colormap(summer);%label
%colormap(winter);%boundary

xlabel('t','fontsize',70);
ylabel('s','fontsize',70);
% yy = ylabel('$\tau$','fontsize',30);
% set(yy, 'Interpreter','latex');
zlabel('Percentage of SVs','fontsize',50);
%zlabel('Testing Accuracy','fontsize',30);
%axis([-200 0 1 16  0 100]);
axis([-200 0 1 16 0 100]);

set(gca,'XTick',-200:50:0);
set(gca,'YTick',1:3:16);
set(gca,'ZTick',0:20:100);

%set(gca,'xscale','log');


%title('ss','fontsize',25);
set(gca,'fontsize',18,'fontname','Times');
set(gca,'xdir','reverse');
%set(gca,'ydir','reverse');