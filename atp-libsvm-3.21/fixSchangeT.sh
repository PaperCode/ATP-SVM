#!/bin/bash
fileName=$1
S=1.001
#S=2
TSet=(-2.00 -1.90 -1.80 -1.70 -1.60 -1.50 -1.40 -1.30 -1.20 -1.10 -1.00 -0.90 -0.80 -0.70 -0.60 -0.50 -0.40 -0.30 -0.20 -0.10 0.00)
#TSet=(-3.00 -2.70 -2.40 -2.10 -1.80 -1.50 -1.20 -0.90 -0.60 -0.30 0.00)
#TSet=(-2.00 -1.80 -1.60 -1.40 -1.20 -1.00 -0.80 -0.60 -0.40 -0.20 0.00)
#TSet=(-3.00 -2.80 -2.60 -2.40 -2.20 -2.00 -1.80 -1.60 -1.40 -1.20 -1.00 -0.80 -0.60 -0.40 -0.20 0.00)
for i in {1..100}
do 
	for k in "${TSet[@]}"
	do 
		echo -e "$k \c"
		./svm-train -s 5 -t 0 -h 0 -c 100 -y $S -u $k -i 0 -o 0.0000001 "./matlab/artificialData/${fileName}${i}"
		#./svm-train -s 5 -t 0 -h 0 -c 0.00001 -y $S -u $k -i 0.5 -o 0.0000001 "./matlab/artificialData/${fileName}${i}"
		#./svm-train -s 5 -h 0 -g ${gammaHinge} -c ${cHinge} -y $k -u $j -i 0.5 -o 0.0000001 "./matlab/boundaryNoiseData/${fileName}${i}"			
		#./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}${i}.model" "${fileName}.t.predict"
	done
	echo -e ""
done
