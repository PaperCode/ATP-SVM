#!/bin/bash
# Author: Xin Shen  cross validation for pinball SVM 
Cset=(0.25 1 4)
#Tauset=(0.25 0.5 0.75)
Tauset=(0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9)
#Gammaset=(0.00001 0.0001 0.001 0.01 0.1 1 10)
for i in "${Cset[@]}" 
do 
	for j in "${Tauset[@]}"
	do 
		echo -e "$i\c"
		echo -e " $j\c"
		./train -s 8 -v 5 -a 10000000 -u $j -t 10000000 -c $i $1
	done
done
