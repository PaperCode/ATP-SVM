A = importdata('w4a_label_1');
%must comply with the data set!!!!!!!!!!!!!!!!!!!!!!!!!!
%[xq,yq] = meshgrid(-3:0.3:0, 1:0.2:3);
%[xq,yq] = meshgrid(-2:0.2:0, 1:0.1:2);
[xq,yq] = meshgrid(-2:0.2:0, 1:0.15:2.5);

x = A(:,1); 
y = A(:,2);
z = A(:,3);
%tmp = 2.^(-7:-1);
%[xq,yq] = meshgrid(tmp', 0:0.2:1);

vq = griddata(x,y,z,xq,yq);
surf(xq,yq,vq); 
%alpha(0.5);%transparent
colormap(autumn);%label
%colormap(winter);%boundary

xlabel('t','fontsize',40);
ylabel('s','fontsize',40);
% yy = ylabel('$\tau$','fontsize',30);
% set(yy, 'Interpreter','latex');
%zlabel('Percentage of SVs','fontsize',30);
zlabel('Testing Accuracy','fontsize',30);

%set(gca,'xscale','log');


%title('ss','fontsize',25);
set(gca,'fontsize',14,'fontname','Times');
set(gca,'xdir','reverse');
set(gca,'ydir','reverse');