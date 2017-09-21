#!/bin/bash
# Author: Xin Shen  cross validation for atp SVM 
Cset=(0.25 1 4)
Tset=(1.5 2 3)
Sset=(0.1 0.5 1)
#Cset=(0.25 1 4)
#Tset=(1.5 2 3)
#Sset=(0.1 0.5 1)
#Cset=(0.25 1 4)
#Tset=(1 2 3)
#Sset=(0.1 0.3 0.5)
#Tset=(-0.2 0)
#Tset=(-1 -0.8)
#Sset=(1.6 1.8)
#Gammaset=(0.00001 0.0001 0.001 0.01 0.1 1 10)
for i in "${Cset[@]}" 
do 
	for j in "${Tset[@]}"
	do 
		for l in "${Sset[@]}"
		do
			echo -e "$i\c"
			echo -e " $j\c"
			echo -e " $l\c"
			./train -s 8 -v 5 -a $l -u 0.5 -t $j -c $i $1
		done
	done
done
