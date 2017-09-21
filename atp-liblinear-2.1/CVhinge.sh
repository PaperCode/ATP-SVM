#!/bin/bash
# Author: Xin Shen cross validation for C-SVM 
Cset=(0.25 1 4)
#Gammaset=(0.00001 0.0001 0.001 0.01 0.1 1 10)
for i in "${Cset[@]}" 
do 
	echo -e "$i\c"
	./train -s 3 -v 5 -c $i $1
done
