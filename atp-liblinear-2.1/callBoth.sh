#!/bin/bash
fileName=$1
trainingDataSize=$2
boundaryNoiseProp=$3
sigma=$4
echo "Start! ${fileName} with both noise, training Data Size=${trainingDataSize}, boundary noise proportion=${boundaryNoiseProp}, sigma=${sigma}."
./both.sh ${fileName} ${trainingDataSize} both ${boundaryNoiseProp} ${sigma} > "./CVforBigtable/results/${fileName}_both"
python avg2.py "./CVforBigtable/results/${fileName}_both" > "./CVforBigtable/results/${fileName}_both_avg"
echo "Complete! ${fileName} with both noise, training Data Size=${trainingDataSize}, boundary noise proportion=${boundaryNoiseProp}, sigma=${sigma}."
