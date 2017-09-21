#!/bin/bash
fileName=$1
trainingDataSize=$2
for i in {1..5}
do 
	########################   split data  ########################
	python ./tools/subset.py "./matlab/originalData/${fileName}" ${trainingDataSize} "./runtimeData/${fileName}" "./runtimeData/${fileName}.t"
	########################   hinge  ########################
	./CVhinge.sh "./runtimeData/${fileName}" > "./CVforBigtable/original/${fileName}_hinge"
	bestParaHinge=$(python MaxCVHinge.py "./CVforBigtable/original/${fileName}_hinge"|head -1)
	bestCHinge=$(echo $bestParaHinge|cut -d \; -f 1)
	bestGammaHinge=$(echo $bestParaHinge|cut -d \; -f 2)
	#echo ${bestCHinge}
	#echo ${bestGammaHinge}
	########################  ramp   ########################
	./CVramp.sh "./runtimeData/${fileName}" > "./CVforBigtable/original/${fileName}_ramp"
	bestParaRamp=$(python MaxCVRampAndPinball.py "./CVforBigtable/original/${fileName}_ramp"|head -1)
	bestCRamp=$(echo $bestParaRamp|cut -d \; -f 1)
	bestTRamp=$(echo $bestParaRamp|cut -d \; -f 2)
	bestGammaRamp=$(echo $bestParaRamp|cut -d \; -f 3)
	########################  pinball   ########################
	./CVpinball.sh "./runtimeData/${fileName}" > "./CVforBigtable/original/${fileName}_pinball"
	bestParaPinball=$(python MaxCVRampAndPinball.py "./CVforBigtable/original/${fileName}_pinball"|head -1)
	bestCPinball=$(echo $bestParaPinball|cut -d \; -f 1)
	bestTauPinball=$(echo $bestParaPinball|cut -d \; -f 2)
	bestGammaPinball=$(echo $bestParaPinball|cut -d \; -f 3)
	########################  atp    ########################
	./CVATP.sh "./runtimeData/${fileName}" > "./CVforBigtable/original/${fileName}_atp"
	bestParaATP=$(python MaxCVATP.py "./CVforBigtable/original/${fileName}_atp"|head -1)
	bestCATP=$(echo $bestParaATP|cut -d \; -f 1)
	bestTATP=$(echo $bestParaATP|cut -d \; -f 2)
	bestSATP=$(echo $bestParaATP|cut -d \; -f 3)
	bestGammaATP=$(echo $bestParaATP|cut -d \; -f 4)
	########################  train and test ########################
	#hinge
	./svm-train -s 0  -g ${bestGammaHinge} -c ${bestCHinge} "./runtimeData/${fileName}"
	./svm-predict "./runtimeData/${fileName}.t" "${fileName}.model" "${fileName}.t.predict"
	#ramp
	./svm-train -s 5 -h 0 -g ${bestGammaRamp} -c ${bestCRamp} -y 1 -i 0 -u ${bestTRamp} -o 0.0000001 "./runtimeData/${fileName}"
	./svm-predict "./runtimeData/${fileName}.t" "${fileName}.model" "${fileName}.t.predict"
	#pinball
	./svm-train -s 5 -h 0 -g ${bestGammaPinball} -c ${bestCPinball} -y 10000000 -i ${bestTauPinball} -u -10000000 -o 0.0000001 "./runtimeData/${fileName}"
	./svm-predict "./runtimeData/${fileName}.t" "${fileName}.model" "${fileName}.t.predict"
	#atp
	./svm-train -s 5 -h 0 -g ${bestGammaATP} -c ${bestCATP} -y ${bestSATP} -i 0.5 -u ${bestTATP} -o 0.0000001 "./runtimeData/${fileName}"
	./svm-predict "./runtimeData/${fileName}.t" "${fileName}.model" "${fileName}.t.predict"
	echo -e ""	
done
