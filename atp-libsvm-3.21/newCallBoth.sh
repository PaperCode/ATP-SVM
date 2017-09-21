#!/bin/bash
fileName="sonar"  
trainingDataSize=100
echo ${fileName}
echo "both two noise corrupted data"
./newBoth.sh ${fileName} ${trainingDataSize} > "./CVforBigtable/results/${fileName}_both"
python avg2.py "./CVforBigtable/results/${fileName}_both" > "./CVforBigtable/results/${fileName}_both_avg"
