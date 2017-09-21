#!/bin/bash
fileName=$1
trainingDataSize=$2
echo "Start! ${fileName} with no noise, trainingDataSize=${trainingDataSize}."
./original.sh ${fileName} ${trainingDataSize} > "./CVforBigtable/results/${fileName}_original"
python avg2.py "./CVforBigtable/results/${fileName}_original" > "./CVforBigtable/results/${fileName}_original_avg"
echo "Complete! ${fileName} with no noise, trainingDataSize=${trainingDataSize}."
