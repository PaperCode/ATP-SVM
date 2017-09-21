#!/bin/bash
fileName="rna"
echo ${fileName}
echo "label noise corrupted data"
./label.sh ${fileName} > "./CVforBigtable/results/${fileName}_label"
python avg2.py "./CVforBigtable/results/${fileName}_label" > "./CVforBigtable/results/${fileName}_label_avg"
