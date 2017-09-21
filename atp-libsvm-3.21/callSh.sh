#!/bin/bash
# Author: Xin Shen 
fileName="german"
echo ${fileName}
./chooseTandS.sh > "${fileName}_temp"
#################    split    line    ########################
echo "label"
python avg.py ${fileName} > "./matlab/ChooseHyper/${fileName}_label"

#################    split    line    ########################
#echo "boundary"
#python avg.py ${fileName} > "./matlab/ChooseHyper/${fileName}_boundary"

#################    split    line    ########################
#echo "both"
#python avg.py ${fileName} > "./matlab/ChooseHyper/${fileName}_both"
