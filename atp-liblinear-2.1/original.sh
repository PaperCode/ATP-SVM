#!/bin/bash
fileName=$1
trainingDataSize=$2
for i in {1..5}
do 
	########################   split data  ########################
	python ./tools/subset.py "./data/unsplit/${fileName}" ${trainingDataSize} "./data/no/${fileName}" "./data/no/${fileName}.t"
	########################   hinge  ########################
	./CVhinge.sh "./data/no/${fileName}" > "./CVforBigtable/no/${fileName}_hinge"
	bestParaHinge=$(python MaxCVHinge.py "./CVforBigtable/no/${fileName}_hinge"|head -1)
	bestCHinge=$(echo $bestParaHinge|cut -d \; -f 1)
	#bestGammaHinge=$(echo $bestParaHinge|cut -d \; -f 2)
	#echo ${bestCHinge}
	#echo ${bestGammaHinge}
	########################  ramp   ########################
	./CVramp.sh "./data/no/${fileName}" > "./CVforBigtable/no/${fileName}_ramp"
	bestParaRamp=$(python MaxCVRampAndPinball.py "./CVforBigtable/no/${fileName}_ramp"|head -1)
	bestCRamp=$(echo $bestParaRamp|cut -d \; -f 1)
	bestTRamp=$(echo $bestParaRamp|cut -d \; -f 2)
	#bestGammaRamp=$(echo $bestParaRamp|cut -d \; -f 3)
	########################  pinball   ########################
	./CVpinball.sh "./data/no/${fileName}" > "./CVforBigtable/no/${fileName}_pinball"
	bestParaPinball=$(python MaxCVRampAndPinball.py "./CVforBigtable/no/${fileName}_pinball"|head -1)
	bestCPinball=$(echo $bestParaPinball|cut -d \; -f 1)
	bestTauPinball=$(echo $bestParaPinball|cut -d \; -f 2)
	#bestGammaPinball=$(echo $bestParaPinball|cut -d \; -f 3)
	########################  atp    ########################
	./CVATP.sh "./data/no/${fileName}" > "./CVforBigtable/no/${fileName}_atp"
	bestParaATP=$(python MaxCVATP.py "./CVforBigtable/no/${fileName}_atp"|head -1)
	bestCATP=$(echo $bestParaATP|cut -d \; -f 1)
	bestTATP=$(echo $bestParaATP|cut -d \; -f 2)
	bestSATP=$(echo $bestParaATP|cut -d \; -f 3)
	#bestGammaATP=$(echo $bestParaATP|cut -d \; -f 4)
	########################  train and test ########################
	#hinge
	./train -s 3 -c ${bestCHinge} "./data/no/${fileName}"
	./predict "./data/no/${fileName}.t" "${fileName}.model" "./data/no/${fileName}.t.predict"
	#ramp
	./train -s 8 -a 0 -t ${bestTRamp} -u 0 -c ${bestCRamp} "./data/no/${fileName}"
	./predict "./data/no/${fileName}.t" "${fileName}.model" "./data/no/${fileName}.t.predict"
	#pinball
	./train -s 8 -a 10000000 -t 10000000 -u ${bestTauPinball} -c ${bestCPinball} "./data/no/${fileName}"
	./predict "./data/no/${fileName}.t" "${fileName}.model" "./data/no/${fileName}.t.predict"
	#atp
	./train -s 8 -a ${bestSATP} -t ${bestTATP}  -u 0.5 -c ${bestCATP} "./data/no/${fileName}"
	./predict "./data/no/${fileName}.t" "${fileName}.model" "./data/no/${fileName}.t.predict"
	echo -e ""	
done
