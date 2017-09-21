%to create data with label noise 
fileName = char('w4a');
repeatedTimes = 5;
ratio = 0.05;%ratio of label corrupted by noise

currentM = mfilename('fullpath');
srcFolder = strrep(currentM,'makeLabelNoise','originalData');   
dstFolder = strrep(currentM,'makeLabelNoise','labelNoiseData');
disp(fileName(1,:));
[label_vector, instance_matrix] = libsvmread(fullfile(srcFolder, fileName(1,:))); 
[row, ~] = size(instance_matrix);
numOfCorruptedData = floor(ratio*row);
for i = 1: repeatedTimes    
    perm = randperm(row);
    corruptedIndex = perm(1:numOfCorruptedData);
    corruptedLabelVector = label_vector;
    corruptedLabelVector(corruptedIndex,1) = -corruptedLabelVector(corruptedIndex,1);   
    libsvmwrite(fullfile(dstFolder, [fileName(1,:),num2str(i)]), corruptedLabelVector, instance_matrix);
end