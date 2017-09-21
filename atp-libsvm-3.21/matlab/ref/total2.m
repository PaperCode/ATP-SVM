fileList = char('A3a', 'Ijcnn1', 'Cancer', 'Diabetes', 'Australian', 'Svmguide3');
symbolList = {'bo-', 'rp--', 'cx:', 'k^--', 'ms-.', 'g*-.'};%'go-',, 

    fid = fopen('record');
    p=[];
    if fid == -1
        disp('File open not successful');
    else
        x = str2double(strsplit( fgetl( fid ) ));
        for i = 1: 6
            v = str2double(strsplit( fgetl( fid ) ));
            [~, length] = size(v);

            p(:,i) = plot(x,v, symbolList{i}, 'MarkerSize', 12, 'linewidth',1.5);
            hold on;
        end
        
        numOfColumns = str2double( fgetl(fid) );
        dataset = [];
        datasetFlag = [];        
        fclose(fid);
    end
    
x1 = power(10, linspace(-4, 2, 500));
y1= 1;
plot(x1, y1,'r','linewidth',2);

set(gca,'linewidth',2,'fontsize',12,'fontname','Times');
xlabel('s','fontsize',32);
%ylabel('Number of Inner Iterations','fontsize',22);
ylabel('$t^s/t^*$','fontsize',32, 'Interpreter','latex');
set(gca,'xscale','log');

%axis([1 20 0 1000]);
axis([0 100 0 6.6]);
%grid on;
ah=axes('position',get(gca,'position'),'visible','off');
hl=legend(ah,p(1:2),strtrim(fileList(1,:)),strtrim(fileList(2,:)),'fontsize',3,'Location','NorthEast');
set(gca,'linewidth',3,'fontsize',16,'fontname','Times');
set(hl,'Box','off');

ah=axes('position',get(gca,'position'),'visible','off');
hl=legend(ah,p(3:4),strtrim(fileList(3,:)),strtrim(fileList(4,:)), 'fontsize',3,'Location','North');
set(gca,'linewidth',3,'fontsize',16,'fontname','Times');
set(hl,'Box','off');

ah=axes('position',get(gca,'position'),'visible','off');
hl=legend(ah,p(5:6),strtrim(fileList(5,:)),strtrim(fileList(6,:)), 'fontsize',3,'Location','NorthWest');
set(gca,'linewidth',3,'fontsize',16,'fontname','Times');
set(hl,'Box','off');

% myLegend = legend(p,fileList{1},fileList{2},fileList{3},fileList{4},fileList{5},fileList{6});
% set(myLegend,'fontsize',26);
% set(myLegend,'Location','Northeast');

%set(myLegend,'Position',[10 15 150 230]);
%set(myLegend,'Position',[10 15 8 14]);
%set(myLegend,'Box','off');
