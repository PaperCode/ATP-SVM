#!/bin/bash
# Author: Xin Shen  check ramp point for ATP 
fileName="w4a"
TSet=(-3.00 -2.90 -2.80 -2.70 -2.60 -2.50 -2.40 -2.30 -2.20 -2.10 -2.00 -1.90 -1.80 -1.70 -1.60 -1.50 -1.40 -1.30 -1.20 -1.10 -1.00 -0.90 -0.80 -0.70 -0.60 -0.50 -0.40 -0.30 -0.20 -0.10 0.00)
for k in "${TSet[@]}"
do 
	echo -e "$k \c"
	./svm-train -s 5 -h 0 -g 0.1 -c 1 -y 1.5 -i 0.5 -u $k -o 0.00001 "./data/${fileName}"
	./svm-predict "./data/${fileName}.t" "${fileName}.model" "${fileName}.t.predict"
	echo -e ""
done
