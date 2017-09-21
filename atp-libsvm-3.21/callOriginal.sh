#!/bin/bash
fileName="rna"  
echo ${fileName}
echo "original data with no noise"
./original.sh ${fileName} > "./CVforBigtable/results/${fileName}_original"
