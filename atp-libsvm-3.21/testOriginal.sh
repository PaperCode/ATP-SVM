#!/bin/bash
fileName="heart"
./CVhinge.sh "./matlab/originalData/${fileName}" > "./CVforBigtable/original/${fileName}_hinge"
python testMaxCV.py "./CVforBigtable/original/${fileName}_hinge"
