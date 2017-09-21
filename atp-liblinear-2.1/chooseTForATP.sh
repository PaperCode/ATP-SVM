#!/bin/bash
# Author: Xin Shen  check ramp point for ATP 
fileName="algebra"
TSet=(1.00 1.10 1.20 1.30 1.40 1.50 1.60 1.70 1.80 1.90 2.00 2.10 2.20 2.30 2.40 2.50 2.60 2.70 2.80 2.90 3.00)
for k in "${TSet[@]}"
do 
	echo -e "$k \c"
	./train -s 8 -a 0.1 -t $k -u 0.5 ${fileName}
	./predict "${fileName}.t" "${fileName}.model" "${fileName}.t.predict"
	echo -e ""
done
