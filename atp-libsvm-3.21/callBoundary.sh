#!/bin/bash
fileName="monks3"
echo ${fileName}
echo "boundary noise corrupted data"
./boundary.sh ${fileName} > "./CVforBigtable/results/${fileName}_boundary"
python avg2.py "./CVforBigtable/results/${fileName}_boundary" > "./CVforBigtable/results/${fileName}_boundary_avg"
