%toPrint = (-4:0.4:0);
%toPrint = (-1.5:0.15:0);
%toPrint = (-3:0.2:0);
%toPrint = (-2:0.1:0);
%toPrint = (-2.5:0.25:0);
%toPrint = (1:2:21);
%toPrint = (-50:5:0);
%toPrint = (-100:10:0);
%toPrint = (1:1:11);
%toPrint = (-200:20:0);
%toPrint = (1:1.5:16);
%toPrint = (1.0:0.2:3.0);
toPrint = (1.0:0.05:2.0);
%toPrint = (1.0:0.03:1.3);
%toPrint = (0.1:0.1:0.9);
%toPrint = (1:0.3:4);
%toPrint = (-2.25:0.25:-0.25);
%toPrint = (-6:0.6:0);
%toPrint = (-5:0.5:0);
%toPrint = (1.0:0.04:1.4);
%toPrint = (1.0:0.02:1.2);
%toPrint = (1.0:0.05:1.5);
%toPrint = (1.0:0.15:2.5);
%toPrint = vpa((-3:0.1:0,2);
for i = 1:length(toPrint)
    % !!!!!!!!!!!note: pls choose the precision carefully!!!!!!!!!!!
	fprintf('%1.2f ', toPrint(i));
    %fprintf('%1.1f ', toPrint(i));
end