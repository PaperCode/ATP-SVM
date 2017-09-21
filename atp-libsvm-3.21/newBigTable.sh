#!/bin/bash
fileName="transfusion"
#set hyper-parameters
#hinge
cHinge=10
gammaHinge=10
#ramp
cRamp=10
tRamp=-1.2
gammaRamp=10
#pinball
cPinball=10
tauPinball=0.5
gammaPinball=10
#atp
cATP=10
tATP=-1
sATP=1.6
gammaATP=0.001
#train and test
#no noise
#hinge
./svm-train -s 0  -g ${gammaHinge} -c ${cHinge} "./matlab/originalData/${fileName}"
./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}.model" "${fileName}.t.predict"
#ramp
./svm-train -s 5 -h 0 -g ${gammaRamp} -c ${cRamp} -y 1 -i 0 -u ${tRamp} -o 0.0000001 "./matlab/originalData/${fileName}"
./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}.model" "${fileName}.t.predict"
#pinball
./svm-train -s 5 -h 0 -g ${gammaPinball} -c ${cPinball} -y 10000000 -i ${tauPinball} -u -10000000 -o 0.0000001 "./matlab/originalData/${fileName}"
./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}.model" "${fileName}.t.predict"
#atp
./svm-train -s 5 -h 0 -g ${gammaATP} -c ${cATP} -y ${sATP} -i 0.5 -u ${tATP} -o 0.0000001 "./matlab/originalData/${fileName}"
./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}.model" "${fileName}.t.predict"
echo -e ""	
echo -e ""	
for i in {1..10}
do 
#label noise
	#hinge
	./svm-train -s 0  -g ${gammaHinge} -c ${cHinge} "./matlab/labelNoiseData/${fileName}${i}"
	./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}${i}.model" "${fileName}.t.predict"
	#ramp
	./svm-train -s 5 -h 0 -g ${gammaRamp} -c ${cRamp} -y 1 -i 0 -u ${tRamp} -o 0.0000001 "./matlab/labelNoiseData/${fileName}${i}"
	./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}${i}.model" "${fileName}.t.predict"
	#pinball
	./svm-train -s 5 -h 0 -g ${gammaPinball} -c ${cPinball} -y 10000000 -i ${tauPinball} -u -10000000 -o 0.0000001 "./matlab/labelNoiseData/${fileName}${i}"
	./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}${i}.model" "${fileName}.t.predict"
	#atp
	./svm-train -s 5 -h 0 -g ${gammaATP} -c ${cATP} -y ${sATP} -i 0.5 -u ${tATP} -o 0.0000001 "./matlab/labelNoiseData/${fileName}${i}"
	./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}${i}.model" "${fileName}.t.predict"
##################################################
#boundary noise
	#hinge
	./svm-train -s 0  -g ${gammaHinge} -c ${cHinge} "./matlab/boundaryNoiseData/${fileName}${i}"
	./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}${i}.model" "${fileName}.t.predict"
	#ramp
	./svm-train -s 5 -h 0 -g ${gammaRamp} -c ${cRamp} -y 1 -i 0 -u ${tRamp} -o 0.0000001 "./matlab/boundaryNoiseData/${fileName}${i}"
	./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}${i}.model" "${fileName}.t.predict"
	#pinball
	./svm-train -s 5 -h 0 -g ${gammaPinball} -c ${cPinball} -y 10000000 -i ${tauPinball} -u -10000000 -o 0.0000001 "./matlab/boundaryNoiseData/${fileName}${i}"
	./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}${i}.model" "${fileName}.t.predict"
	#atp
	./svm-train -s 5 -h 0 -g ${gammaATP} -c ${cATP} -y ${sATP} -i 0.5 -u ${tATP} -o 0.0000001 "./matlab/boundaryNoiseData/${fileName}${i}"
	./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}${i}.model" "${fileName}.t.predict"
##################################################
#both noise
	#hinge
	./svm-train -s 0  -g ${gammaHinge} -c ${cHinge} "./matlab/bothNoiseData/${fileName}${i}"
	./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}${i}.model" "${fileName}.t.predict"
	#ramp
	./svm-train -s 5 -h 0 -g ${gammaRamp} -c ${cRamp} -y 1 -i 0 -u ${tRamp} -o 0.0000001 "./matlab/bothNoiseData/${fileName}${i}"
	./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}${i}.model" "${fileName}.t.predict"
	#pinball
	./svm-train -s 5 -h 0 -g ${gammaPinball} -c ${cPinball} -y 10000000 -i ${tauPinball} -u -10000000 -o 0.0000001 "./matlab/bothNoiseData/${fileName}${i}"
	./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}${i}.model" "${fileName}.t.predict"
	#atp
	./svm-train -s 5 -h 0 -g ${gammaATP} -c ${cATP} -y ${sATP} -i 0.5 -u ${tATP} -o 0.0000001 "./matlab/bothNoiseData/${fileName}${i}"
	./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}${i}.model" "${fileName}.t.predict"
	echo -e ""	
done
