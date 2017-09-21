#!/bin/bash
# Author: Xin Shen 
paraS=(0.05 0.1 0.2 0.3 0.4 0.5)
paraTau=(0.05 0.1 0.2 0.3 0.5)
for i in "${paraS[@]}" 
do 
	for j in "${paraTau[@]}"
	do 
		echo -e "$i \c"
		echo -e "$j \c"
		./train -s 8 -a $i -t  2.0 -u $j rcv1_train.binary
		./predict rcv1_test.binary rcv1_train.binary.model output
	done
done
