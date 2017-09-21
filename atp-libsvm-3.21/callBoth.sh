#!/bin/bash
fileName="sonar"
echo ${fileName}
echo "both two noise corrupted data"
./both.sh ${fileName} > "./CVforBigtable/results/${fileName}_both"
python avg2.py "./CVforBigtable/results/${fileName}_both" > "./CVforBigtable/results/${fileName}_both_avg"
