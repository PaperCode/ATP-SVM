#!/bin/bash
fileName=$1
trainingDataSize=$2
echo "Start! ${fileName} with label noise, trainingDataSize=${trainingDataSize}."
./label.sh ${fileName} ${trainingDataSize} label > "./CVforBigtable/results/${fileName}_label"
python avg2.py "./CVforBigtable/results/${fileName}_label" > "./CVforBigtable/results/${fileName}_label_avg"
echo "Complete! ${fileName} with label noise, trainingDataSize=${trainingDataSize}."
