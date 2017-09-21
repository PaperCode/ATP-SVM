#!/bin/bash
# Author: Xin Shen  cross validation for ramp SVM 
Cset=(0.25 1 4)
Tset=(1.25 1.50 1.75 2.00 2.25 2.50 2.75 3.00 3.25)
#Tset=(-1.2 -1 -0.8)
#Tset=(-0.4 -0.2 0)
#Gammaset=(0.00001 0.0001 0.001 0.01 0.1 1 10)
for i in "${Cset[@]}" 
do 
	for j in "${Tset[@]}"
	do 
		echo -e "$i\c"
		echo -e " $j\c"
		./train -s 8 -v 5 -a 0 -u 0 -t $j -c $i $1
	done
done
