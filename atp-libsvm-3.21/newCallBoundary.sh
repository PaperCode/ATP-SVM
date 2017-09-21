#!/bin/bash
fileName="sonar"  
trainingDataSize=100
echo ${fileName}
echo "boundary noise corrupted data"
./newBoundary.sh ${fileName} ${trainingDataSize} > "./CVforBigtable/results/${fileName}_boundary"
python avg2.py "./CVforBigtable/results/${fileName}_boundary" > "./CVforBigtable/results/${fileName}_boundary_avg"
