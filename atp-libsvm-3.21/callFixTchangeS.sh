#!/bin/bash
# Author: Xin Shen 
#fileName="Boundary500"
fileName="Label500"
#fileName="NoNoise500"
echo ${fileName}
./fixTchangeS.sh ${fileName} > "./matlab/ArtificialResults/${fileName}"
#################     original   ########################
#echo "original"
python avg4.py "./matlab/ArtificialResults/${fileName}" > "./matlab/ArtificialResults/${fileName}_t0"
#################     label   ########################
#echo "label"
#python avg3.py "./matlab/ArtificialResults/${fileName}_temp" > "./matlab/ArtificialResults/${fileName}_label"

#################     boundary   ########################
#echo "boundary"
#python avg3.py "./matlab/ArtificialResults/${fileName}_temp" > "./matlab/ArtificialResults/${fileName}_boundary"

#################    both    ########################
#echo "both"
#python avg3.py "./matlab/ArtificialResults/${fileName}_temp" > "./matlab/ArtificialResults/${fileName}_both"
