#!/bin/bash
fileName=$1
#T=-1000000000
T=0
SSet=(1.00 1.05 1.10 1.15 1.20 1.25 1.30 1.35 1.40 1.45 1.50 1.55 1.60 1.65 1.70 1.75 1.80 1.85 1.90 1.95 2.00)
#SSet=(1.00 1.10 1.20 1.30 1.40 1.50 1.60 1.70 1.80 1.90 2.00)
#SSet=(1.0 1.2 1.4 1.6 1.8 2.0 2.2 2.4 2.6 2.8 3.0)
#SSet=(1.00 1.30 1.60 1.90 2.20 2.50 2.80 3.10 3.40 3.70 4.00)
for i in {1..100}
do 
	for k in "${SSet[@]}"
	do 
		echo -e "$k \c"
		./svm-train -s 5 -t 0 -h 0 -c 0.00001 -y $k -u $T -i 0.5 -o 0.0000001 "./matlab/artificialData/${fileName}${i}"
		#./svm-train -s 5 -h 0 -g ${gammaHinge} -c ${cHinge} -y $k -u $j -i 0.5 -o 0.0000001 "./matlab/boundaryNoiseData/${fileName}${i}"			
		#./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}${i}.model" "${fileName}.t.predict"
	done
	echo -e ""
done
