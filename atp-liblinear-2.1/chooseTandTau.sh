#!/bin/bash
# Author: Xin Shen 
paraT=(1.5 2 2.5 3 3.5 4)
paraTau=(0.05 0.1 0.2 0.3 0.5)
for i in "${paraT[@]}" 
do 
	for j in "${paraTau[@]}"
	do 
		echo -e "$i \c"
		echo -e "$j \c"
		./train -s 8 -a 0.1 -t  $i -u $j rcv1_train.binary
		./predict rcv1_test.binary rcv1_train.binary.model output
	done
done
