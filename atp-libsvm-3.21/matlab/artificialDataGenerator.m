repeatedTimes = 100;
numOfInstances = 500;
output = 'NoNoise500';%file name
currentM = mfilename('fullpath');
dataFolder = strrep(currentM,'artificialDataGenerator','artificialData');
for i = 1: repeatedTimes 
    %Positive
    muPositive = [0.5, -3];  
    SIGMAPositive = [0.2 0; 0 3];
    PositiveData = mvnrnd(muPositive,SIGMAPositive,numOfInstances/2);
    PositiveData = [ones(numOfInstances/2,1),PositiveData];
    %Negative
    muNegative = [-0.5, 3];
    SIGMANegative = [0.2 0; 0 3];
    NegativeData = mvnrnd(muNegative,SIGMANegative,numOfInstances/2);
    NegativeData = [-ones(numOfInstances/2,1),NegativeData];
    data = [PositiveData; NegativeData];
    %data = [PositiveData; NegativeData; boundryNoiseData];
    % data = [PositiveData; NegativeData; labelNoiseData1; labelNoiseData2];
    %data = [PositiveData; NegativeData; labelNoiseData; boundryNoiseData];
    data = data';
    
    processedFileName = fullfile(dataFolder, [output, num2str(i)]);
    fileID = fopen(processedFileName,'w');
    formatSpec = '%d 1:%3.5f 2:%3.5f\n';%str concatenation for high demision data
    fprintf(fileID, formatSpec, data);
    fclose(fileID);
end



%label noise 
% labelNoiseData1 = mvnrnd(muPositive,SIGMAPositive,10);
% labelNoiseData1 = [-ones(10,1),labelNoiseData1];
% labelNoiseData2 = mvnrnd(muNegative,SIGMANegative,10);
% labelNoiseData2 = [ones(10,1),labelNoiseData2];
% plot(labelNoiseData1(:,1),labelNoiseData1(:,2),'r+','MarkerSize',10, 'linewidth',1);
%hold on;

%boundry noise
% boundryNoiseLabel = 2*randi([0,1],40,1) - 1;
% muBoundryNoise = [0 0];
% SIGMABoundryNoise = [1 -0.8; -0.8 1];
% boundryNoiseData = mvnrnd(muBoundryNoise,SIGMABoundryNoise,40);
% boundryNoiseData = [boundryNoiseLabel, boundryNoiseData];
% %------------------
% axis equal;
% axis(([ -3, 3, -8, 8]));
%------------------

%output

%save(processedFileName, 'PositiveData', 'NegativeData');