%to create data with boundary and label noise 
filename = char('sonar');
repeatedTimes = 5;
ratioLabel = 0.02;%ratio of label corrupted by noise

normalPara = 0.2;%parameter in Gaussian distribution
ratioBoundary = 0.2;%ratio of data corrupted by boundary noise

currentM = mfilename('fullpath');
srcFolder = strrep(currentM,'makeBothNoise','originalData');
dstFolder = strrep(currentM,'makeBothNoise','bothNoiseData');
disp(filename(1,:));
[label_vector, instance_matrix] = libsvmread(fullfile(srcFolder, filename(1,:))); 
[row, column] = size(instance_matrix);
numOfLabelCorruptedData = floor(ratioLabel*row);
numOfBoundaryCorruptedData = floor(ratioBoundary*row);
mu = zeros(1, numOfBoundaryCorruptedData);
for i = 1: repeatedTimes
    %make label noise
    perm1 = randperm(row);
    corruptedIndex1 = perm1(1:numOfLabelCorruptedData);
    corruptedLabelVector = label_vector;
    corruptedLabelVector(corruptedIndex1,1) = -corruptedLabelVector(corruptedIndex1,1);  
    %make boudary noise
    corruptedTrainingSet = instance_matrix;
    sigmaMatrix = normalPara*eye(numOfBoundaryCorruptedData);
    for j =1:column
        perm2 = randperm(row);
        corruptedIndex2 = perm2(1:numOfBoundaryCorruptedData);
        corruptedTrainingSet(corruptedIndex2,j) =...
            corruptedTrainingSet(corruptedIndex2,j)...
            + mvnrnd(mu,sigmaMatrix,1)';
    end
    libsvmwrite(fullfile(dstFolder, [filename(1,:),num2str(i)]), corruptedLabelVector, corruptedTrainingSet);
end