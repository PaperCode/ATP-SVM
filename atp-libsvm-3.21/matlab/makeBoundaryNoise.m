%to create data with boundary noise 
filename = char('sonar');
repeatedTimes = 5;
normalPara = 0.1;%parameter in Gaussian distribution
ratio = 0.2;%ratio of data corrupted by noise

currentM = mfilename('fullpath');
srcFolder = strrep(currentM,'makeBoundaryNoise','originalData');
dstFolder = strrep(currentM,'makeBoundaryNoise','boundaryNoiseData');
disp(filename(1,:));
[label_vector, instance_matrix] = libsvmread(fullfile(srcFolder, filename(1,:))); 
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
    libsvmwrite(fullfile(dstFolder, [filename(1,:),num2str(i)]), label_vector, corruptedTrainingSet);
end