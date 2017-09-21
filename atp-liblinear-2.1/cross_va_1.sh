#!/bin/bash
# Author: Xin Shen, cross validation for linear SVM 
SetC=(0.25 0.5 1 2 4)
for i in "${SetC[@]}" 
do 
	echo -e "$i \c"
	./train -s 3 -v 10 -c $i webspam
done

