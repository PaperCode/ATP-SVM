#!/bin/bash
# Author: Xin Shen
SetC=(0.125 0.25 0.5 1 2 4 8)
for i in "${SetC[@]}" 
do 
	echo -e "$i \c"
	./train -s 3 -c $i webspam
	./predict webspam.t webspam.model output
done
