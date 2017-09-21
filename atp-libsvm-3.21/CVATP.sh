#!/bin/bash
# Author: Xin Shen  cross validation for atp SVM 
Cset=(0.01 0.1 1 10 100 1000 10000)
Tset=(-2 -1 -0.5)
Sset=(1.1 1.5 2)
#Tset=(-0.2 0)
#Tset=(-1 -0.8)
#Sset=(1.6 1.8)
Gammaset=(0.00001 0.0001 0.001 0.01 0.1 1 10)
for i in "${Cset[@]}" 
do 
	for j in "${Tset[@]}"
	do 
		for l in "${Sset[@]}"
		do
			for k in "${Gammaset[@]}"
			do 
				echo -e "$i\c"
				echo -e " $j\c"
				echo -e " $l\c"
				echo -e " $k\c"
				#./svm-train -s 5 -v 10 -h 0 -g $k -c $i -i 0.5 -y $l -u $j -o 0.00001 ./data/transfusion
				./svm-train -s 5 -v 5 -h 0 -g $k -c $i -i 0.5 -y $l -u $j -o 0.0001 $1
				echo -e ""
			done
		done
	done
done
