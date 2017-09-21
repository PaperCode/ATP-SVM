#!/bin/bash
# Author: Xin Shen cross validation for C-SVM 
Cset=(0.01 0.1 1 10 100 1000 10000)
Gammaset=(0.00001 0.0001 0.001 0.01 0.1 1 10)
for i in "${Cset[@]}" 
do 
	for k in "${Gammaset[@]}"
	do 
		echo -e "$i\c"
		echo -e " $k\c"
		#./svm-train -s 0 -v 5 -g $k -c $i ./matlab/originalData/heart
		#./svm-train -s 0 -v 10 -g $k -c $i ./data/heart
		./svm-train -s 0 -v 10 -g $k -c $i $1
		#./svm-train -s 0 -v 5 -g $k -c $i $1
		echo -e ""
	done
done
