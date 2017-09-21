#!/bin/bash
# Author: Xin Shen 
paraS=(0.05 0.1 0.2 0.3 0.4 0.5)
paraT=(1.5 2 2.5 3 3.5 4)
for i in "${paraS[@]}" 
do 
	for j in "${paraT[@]}"
	do 
		echo -e "$i \c"
		echo -e "$j \c"
		./train -s 8 -a $i -t $j -u 0.1 rcv1_train.binary
		./predict rcv1_test.binary rcv1_train.binary.model output
	done
done
