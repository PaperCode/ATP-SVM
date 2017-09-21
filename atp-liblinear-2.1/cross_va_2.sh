#!/bin/bash
# Author: Xin Shen  cross validation for modified pin SVM 
Cset=(0.25 0.5 1 2 4)
Sset=(0.001 0.01 0.05 0.1 0.3 0.5)
Tset=(1.01 1.1 1.3 1.5 1.7 2 2.5)
echo "madelon"
for i in "${Cset[@]}" 
do 
	for j in "${Sset[@]}"
	do 
		for k in "${Tset[@]}"
		do 
			echo -e " $i \c"
			echo -e " $j \c"
			echo -e " $k \c"
			./train -s 8 -v 10 -c $i -a $j  -t $k -u 0.1 madelon
		done
	done
done
