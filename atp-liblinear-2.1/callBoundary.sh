#!/bin/bash
fileName=$1
trainingDataSize=$2
noiseProp=$3
sigma=$4
echo "Start! ${fileName} with boundary noise, trainingDataSize=${trainingDataSize}, noise proportion=${noiseProp}, sigma=${sigma}."
./boundary.sh ${fileName} ${trainingDataSize} boundary ${noiseProp} ${sigma} > "./CVforBigtable/results/${fileName}_boundary"
python avg2.py "./CVforBigtable/results/${fileName}_boundary" > "./CVforBigtable/results/${fileName}_boundary_avg"
echo "Complete! ${fileName} with boundary noise, trainingDataSize=${trainingDataSize}, noise proportion=${noiseProp}, sigma=${sigma}."
