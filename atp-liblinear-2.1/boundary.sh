#!/bin/bash
originalFileName=$1
fileName="${originalFileName}_boundary"
trainingDataSize=$2
noiseType=$3
noiseProp=$4
sigma=$5
for i in {1..5}
do 
	########################   add noise  ########################
	python ./addFeatureNoise.py "./data/unsplit/${originalFileName}" ${noiseProp} ${sigma} "./data/unsplit/${fileName}"
	########################   split data  ########################
	python ./tools/subset.py "./data/unsplit/${fileName}" ${trainingDataSize} "./data/${noiseType}/${fileName}" "./data/${noiseType}/${fileName}.t"
	########################  delete temporary data set  ########################
	rm "./data/unsplit/${fileName}"
	########################   hinge  ########################
	./CVhinge.sh "./data/${noiseType}/${fileName}" > "./CVforBigtable/${noiseType}/${fileName}_hinge"
	bestParaHinge=$(python MaxCVHinge.py "./CVforBigtable/${noiseType}/${fileName}_hinge"|head -1)
	bestCHinge=$(echo $bestParaHinge|cut -d \; -f 1)
	#bestGammaHinge=$(echo $bestParaHinge|cut -d \; -f 2)
	#echo ${bestCHinge}
	#echo ${bestGammaHinge}
	########################  ramp   ########################
	./CVramp.sh "./data/${noiseType}/${fileName}" > "./CVforBigtable/${noiseType}/${fileName}_ramp"
	bestParaRamp=$(python MaxCVRampAndPinball.py "./CVforBigtable/${noiseType}/${fileName}_ramp"|head -1)
	bestCRamp=$(echo $bestParaRamp|cut -d \; -f 1)
	bestTRamp=$(echo $bestParaRamp|cut -d \; -f 2)
	#bestGammaRamp=$(echo $bestParaRamp|cut -d \; -f 3)
	########################  pinball   ########################
	./CVpinball.sh "./data/${noiseType}/${fileName}" > "./CVforBigtable/${noiseType}/${fileName}_pinball"
	bestParaPinball=$(python MaxCVRampAndPinball.py "./CVforBigtable/${noiseType}/${fileName}_pinball"|head -1)
	bestCPinball=$(echo $bestParaPinball|cut -d \; -f 1)
	bestTauPinball=$(echo $bestParaPinball|cut -d \; -f 2)
	#bestGammaPinball=$(echo $bestParaPinball|cut -d \; -f 3)
	########################  atp    ########################
	./CVATP.sh "./data/${noiseType}/${fileName}" > "./CVforBigtable/${noiseType}/${fileName}_atp"
	bestParaATP=$(python MaxCVATP.py "./CVforBigtable/${noiseType}/${fileName}_atp"|head -1)
	bestCATP=$(echo $bestParaATP|cut -d \; -f 1)
	bestTATP=$(echo $bestParaATP|cut -d \; -f 2)
	bestSATP=$(echo $bestParaATP|cut -d \; -f 3)
	#bestGammaATP=$(echo $bestParaATP|cut -d \; -f 4)
	########################  train and test ########################
	#hinge
	./train -s 3 -c ${bestCHinge} "./data/${noiseType}/${fileName}"
	./predict "./data/${noiseType}/${fileName}.t" "${fileName}.model" "./data/${noiseType}/${fileName}.t.predict"
	#ramp
	./train -s 8 -a 0 -t ${bestTRamp} -u 0 -c ${bestCRamp} "./data/${noiseType}/${fileName}"
	./predict "./data/${noiseType}/${fileName}.t" "${fileName}.model" "./data/${noiseType}/${fileName}.t.predict"
	#pinball
	./train -s 8 -a 10000000 -t 10000000 -u ${bestTauPinball} -c ${bestCPinball} "./data/${noiseType}/${fileName}"
	./predict "./data/${noiseType}/${fileName}.t" "${fileName}.model" "./data/${noiseType}/${fileName}.t.predict"
	#atp
	./train -s 8 -a ${bestSATP} -t ${bestTATP}  -u 0.5 -c ${bestCATP} "./data/${noiseType}/${fileName}"
	./predict "./data/${noiseType}/${fileName}.t" "${fileName}.model" "./data/${noiseType}/${fileName}.t.predict"
	echo -e ""	
done
