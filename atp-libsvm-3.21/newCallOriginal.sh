#!/bin/bash
fileName="w4a"  
trainingDataSize=1000
echo ${fileName}
echo "original data with no noise"
./newOriginal.sh ${fileName} ${trainingDataSize} > "./CVforBigtable/results/${fileName}_original"
python avg2.py "./CVforBigtable/results/${fileName}_original" > "./CVforBigtable/results/${fileName}_original_avg"
