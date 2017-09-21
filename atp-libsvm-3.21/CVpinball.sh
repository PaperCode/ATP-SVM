#!/bin/bash
# Author: Xin Shen  cross validation for pinball SVM 
Cset=(0.01 0.1 1 10 100 1000 10000)
#Tauset=(0.25 0.5 0.75)
Tauset=(0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9)
Gammaset=(0.00001 0.0001 0.001 0.01 0.1 1 10)
for i in "${Cset[@]}" 
do 
	for j in "${Tauset[@]}"
	do 
		for k in "${Gammaset[@]}"
		do 
			echo -e "$i\c"
			echo -e " $j\c"
			echo -e " $k\c"
			#./svm-train -s 5 -v 10 -h 0 -g $k -c $i -i $j -y 10000000 -u -10000000 -o 0.00001 ./data/diabetic
			./svm-train -s 5 -v 5 -h 0 -g $k -c $i -i $j -y 10000000 -u -10000000 -o 0.0001 $1
			echo -e ""
		done
	done
done
