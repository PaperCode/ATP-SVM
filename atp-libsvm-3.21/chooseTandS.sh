 #!/bin/bash
# Author: Xin Shen 
fileName="german"
#optimal hinge para 
cHinge=1000
gammaHinge=0.001
##### Pls note the step size!!!!! 
#paraT=(-2.0 -1.8 -1.6 -1.4 -1.2 -1.0 -0.8 -0.6 -0.4 -0.2 0.0)
paraT=(-3.0 -2.7 -2.4 -2.1 -1.8 -1.5 -1.2 -0.9 -0.6 -0.3 0.0)
paraS=(1.0 1.2 1.4 1.6 1.8 2.0 2.2 2.4 2.6 2.8 3.0)
#paraS=(1.00 1.15 1.30 1.45 1.60 1.75 1.90 2.05 2.20 2.35 2.50)
#paraS=(1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0)
for i in {1..10}
do 
	for j in "${paraT[@]}" 
	do 
		for k in "${paraS[@]}"
		do 
			echo -e "$j \c"
			echo -e "$k \c"
			./svm-train -s 5 -h 0 -g ${gammaHinge} -c ${cHinge} -y $k -u $j -i 0.5 -o 0.0000001 "./matlab/labelNoiseData/${fileName}${i}"
			#./svm-train -s 5 -h 0 -g ${gammaHinge} -c ${cHinge} -y $k -u $j -i 0.5 -o 0.0000001 "./matlab/boundaryNoiseData/${fileName}${i}"			
			./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}${i}.model" "${fileName}.t.predict"
		done
	done
	echo -e ""
done
