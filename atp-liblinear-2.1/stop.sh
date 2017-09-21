#!/bin/bash
# Author: Xin Shen 
stopAccu=(1 0.1 0.01 0.001 0.0001 0.00001 0.000001)
echo "bridge"
for i in "${stopAccu[@]}" 
do 
	echo -e "$i\c"
	./train -s 8 -e $i  -c 0.25 -a 0.0001 -t 2.5 -u 0.1 bridge
	./predict bridge.t bridge.model output
done
