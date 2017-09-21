#!/bin/bash
fileName=$1
for i in {1..5}
do 
	########################   hinge  ########################
	./CVhinge.sh "./matlab/boundaryNoiseData/${fileName}${i}" > "./CVforBigtable/boundary/${fileName}_hinge${i}"
	bestParaHinge=$(python MaxCVHinge.py "./CVforBigtable/boundary/${fileName}_hinge${i}"|head -1)
	bestCHinge=$(echo $bestParaHinge|cut -d \; -f 1)
	bestGammaHinge=$(echo $bestParaHinge|cut -d \; -f 2)
	########################  ramp   ########################
	./CVramp.sh "./matlab/boundaryNoiseData/${fileName}${i}" > "./CVforBigtable/boundary/${fileName}_ramp${i}"
	bestParaRamp=$(python MaxCVRampAndPinball.py "./CVforBigtable/boundary/${fileName}_ramp${i}"|head -1)
	bestCRamp=$(echo $bestParaRamp|cut -d \; -f 1)
	bestTRamp=$(echo $bestParaRamp|cut -d \; -f 2)
	bestGammaRamp=$(echo $bestParaRamp|cut -d \; -f 3)
	########################  pinball   ########################
	./CVpinball.sh "./matlab/boundaryNoiseData/${fileName}${i}" > "./CVforBigtable/boundary/${fileName}_pinball${i}"
	bestParaPinball=$(python MaxCVRampAndPinball.py "./CVforBigtable/boundary/${fileName}_pinball${i}"|head -1)
	bestCPinball=$(echo $bestParaPinball|cut -d \; -f 1)
	bestTauPinball=$(echo $bestParaPinball|cut -d \; -f 2)
	bestGammaPinball=$(echo $bestParaPinball|cut -d \; -f 3)
	########################  atp    ########################
	./CVATP.sh "./matlab/boundaryNoiseData/${fileName}${i}" > "./CVforBigtable/boundary/${fileName}_atp${i}"
	bestParaATP=$(python MaxCVATP.py "./CVforBigtable/boundary/${fileName}_atp${i}"|head -1)
	bestCATP=$(echo $bestParaATP|cut -d \; -f 1)
	bestTATP=$(echo $bestParaATP|cut -d \; -f 2)
	bestSATP=$(echo $bestParaATP|cut -d \; -f 3)
	bestGammaATP=$(echo $bestParaATP|cut -d \; -f 4)
	########################  train and test ########################
	#hinge
	./svm-train -s 0  -g ${bestGammaHinge} -c ${bestCHinge} "./matlab/boundaryNoiseData/${fileName}${i}"
	./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}${i}.model" "${fileName}.t.predict"
	#ramp
	./svm-train -s 5 -h 0 -g ${bestGammaRamp} -c ${bestCRamp} -y 1 -i 0 -u ${bestTRamp} -o 0.0000001 "./matlab/boundaryNoiseData/${fileName}${i}"
	./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}${i}.model" "${fileName}.t.predict"
	#pinball
	./svm-train -s 5 -h 0 -g ${bestGammaPinball} -c ${bestCPinball} -y 10000000 -i ${bestTauPinball} -u -10000000 -o 0.0000001 "./matlab/boundaryNoiseData/${fileName}${i}"
	./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}${i}.model" "${fileName}.t.predict"
	#atp
	./svm-train -s 5 -h 0 -g ${bestGammaATP} -c ${bestCATP} -y ${bestSATP} -i 0.5 -u ${bestTATP} -o 0.0000001 "./matlab/boundaryNoiseData/${fileName}${i}"
	./svm-predict "./matlab/originalData/${fileName}.t" "${fileName}${i}.model" "${fileName}.t.predict"
	echo -e ""	
done
