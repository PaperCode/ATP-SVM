#!/bin/bash
fileName="sonar"  
trainingDataSize=100
echo ${fileName}
echo "label noise corrupted data"
./newLabel.sh ${fileName} ${trainingDataSize} > "./CVforBigtable/results/${fileName}_label"
python avg2.py "./CVforBigtable/results/${fileName}_label" > "./CVforBigtable/results/${fileName}_label_avg"
