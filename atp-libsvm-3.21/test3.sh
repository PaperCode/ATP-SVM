#!/bin/bash

bestPara=$(python MaxCV.py w4a|head -1)
bestC=$(echo $bestPara|cut -d \; -f 1)
bestGamma=$(echo $bestPara|cut -d \; -f 2)
echo ${bestC}
echo ${bestGamma}
