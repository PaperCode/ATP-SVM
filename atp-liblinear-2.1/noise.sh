#!/bin/bash
for j in 'svmguide1' 'rna' 'b_cancer' 'a9a' 'w8a' 'real-sim' 'rcv1' 'url' 'webspam'
do
	echo -e "$j\c"
	for i in {1..10}
	do	
		./train -s 8 -c 1 -a 10000  -t 10000 -u 0.1 $j
#		./train -s 3 -c 1 $j
		./predict $j.t $j.model output
	done
		echo -e ""
done


