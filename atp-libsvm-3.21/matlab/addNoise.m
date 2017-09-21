%to create data with noise
fileList1 = char('splice');
repeatedTimes = 10;
normalPara = 10;%parameter in Gaussian distribution
ratio = 0.1;%ratio of data corrupted by noise

currentM = mfilename('fullpath');
dataFolder1 = strrep(currentM,'addNoise','originalData');
dataFolder2 = strrep(currentM,'addNoise','noise5');
disp(fileList1(1,:));
[label_vector, instance_matrix] = libsvmread(fullfile(dataFolder1, fileList1(1,:))); 
disp(label_vector);
[row, column] = size(instance_matrix);
numOfCorruptedData = floor(ratio*row);
mu = zeros(1, numOfCorruptedData);
for i = 1: repeatedTimes    
    corruptedTrainingSet = instance_matrix;
    sigmaMatrix = normalPara*eye(numOfCorruptedData);
    for j =1:column
        perm = randperm(row);
        corruptedIndex = perm(1:numOfCorruptedData);
        corruptedTrainingSet(corruptedIndex,j) =...
            corruptedTrainingSet(corruptedIndex,j)...
            + mvnrnd(mu,sigmaMatrix,1)';
    end
    libsvmwrite(fullfile(dataFolder2, [fileList1(1,:),num2str(i)]), label_vector, corruptedTrainingSet);
end