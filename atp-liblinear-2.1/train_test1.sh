#!/bin/bash
# Author: Xin Shen,  for linear SVM 
SetC=(0.25 0.5 1 2 4)
echo "bridge"
for i in "${SetC[@]}" 
do 
	echo -e "$i \c"
	./train -s 3 -c $i bridge
	./predict bridge.t bridge.model output
done
