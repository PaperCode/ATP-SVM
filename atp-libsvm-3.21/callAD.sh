#!/bin/bash
# Author: Xin Shen 
fileName="ADNoNoise1000"
echo ${fileName}
./checkADatp.sh ${fileName} > "./matlab/ArtificialResults/${fileName}_temp"
#################     original   ########################
echo "original"
python avg3.py "./matlab/ArtificialResults/${fileName}_temp" > "./matlab/ArtificialResults/${fileName}_original"
#################     label   ########################
#echo "label"
#python avg3.py "./matlab/ArtificialResults/${fileName}_temp" > "./matlab/ArtificialResults/${fileName}_label"

#################     boundary   ########################
#echo "boundary"
#python avg3.py "./matlab/ArtificialResults/${fileName}_temp" > "./matlab/ArtificialResults/${fileName}_boundary"

#################    both    ########################
#echo "both"
#python avg3.py "./matlab/ArtificialResults/${fileName}_temp" > "./matlab/ArtificialResults/${fileName}_both"
