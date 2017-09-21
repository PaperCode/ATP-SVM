#!/bin/bash
# Author: Xin Shen  cross validation for modified pin SVM 
Cset=(0.25 0.5 1 2 4)
Sset=(0.0000001 0.000001 0.00001 0.0001 0.001 0.01 0.1 0.3 0.5)
Tset=(2 2.5 3)
for i in "${Cset[@]}" 
do 
	for j in "${Sset[@]}"
	do 
		for k in "${Tset[@]}"
		do 
			echo -e "$i\c"
			echo -e " $j\c"
			echo -e " $k \c"
			./train -s 8 -c $i -a $j  -t $k -u 0.1 bridge
			./predict bridge.t bridge.model output
		done
	done
done
