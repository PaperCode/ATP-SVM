#!/bin/bash
fileName=$1
#paraT=(-2 -1 -0.5)
#paraS=(1.1 1.5 2)
paraT=(-3.0 -2.7 -2.4 -2.1 -1.8 -1.5 -1.2 -0.9 -0.6 -0.3 0.0)
paraS=(1.0 1.2 1.4 1.6 1.8 2.0 2.2 2.4 2.6 2.8 3.0)
for i in {1..100}
do 
	for j in "${paraT[@]}" 
	do 
		for k in "${paraS[@]}"
		do 
			echo -e "$j \c"
			echo -e "$k \c"
			./svm-train -s 5 -t 0 -h 0 -c 8 -y $k -u $j -i 0.5 -o 0.0000001 "./matlab/artificialData/${fileName}${i}"
			#./svm-train -s 5 -h 0 -g ${gammaHinge} -c ${cHinge} -y $k -u $j -i 0.5 -o 0.0000001 "./matlab/boundaryNoiseData/${fileName}${i}"			
			#./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}${i}.model" "${fileName}.t.predict"
		done
	done
	echo -e ""
done
