A = importdata('NoNoise100_t-inf');

x = A(1,:); 
w1 = A(2,:);
w1std = A(3,:);
b = A(4,:);
bstd = A(5,:);

% x = 0:pi/10:pi;
% y = sin(x);
% e = std(y)*ones(size(x));

figure
x1 = linspace(1, 3, 500);
y1= 1;
plot(x1, y1,'r','linewidth',2);
hold on;

w1eb = errorbar(x,w1,w1std,'bx:','linewidth',3,'MarkerSize',13);
hold on;
beb = errorbar(x,b,bstd,'gs:','linewidth',3,'MarkerSize',13);
hold on;


axis([1 3 -1 3.5]);
myLegend = legend([w1eb,beb],'w(1)','b');
set(myLegend,'fontsize',17,'linewidth',2);
set(myLegend,'Box','off');
set(myLegend,'Location','East');


set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
