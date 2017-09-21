#!/bin/bash
# Author: Xin Shen  cross validation for ramp SVM 
Cset=(0.01 0.1 1 10 100 1000 10000)
Tset=(-2.25 -2.00 -1.75 -1.50 -1.25 -1.00 -0.75 -0.50 -0.25)
#Tset=(-1.2 -1 -0.8)
#Tset=(-0.4 -0.2 0)
Gammaset=(0.00001 0.0001 0.001 0.01 0.1 1 10)
for i in "${Cset[@]}" 
do 
	for j in "${Tset[@]}"
	do 
		for k in "${Gammaset[@]}"
		do 
			echo -e "$i\c"
			echo -e " $j\c"
			echo -e " $k\c"
			#./svm-train -s 5 -v 10 -h 0 -g $k -c $i -i 0 -y 1 -u $j -o 0.00001 ./data/diabetic
			./svm-train -s 5 -v 5 -h 0 -g $k -c $i -i 0 -y 1 -u $j -o 0.0001 $1
			echo -e ""
		done
	done
done
