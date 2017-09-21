#!/usr/bin/env python
import numpy as np
import sys

filename = str(sys.argv[1])
table = np.loadtxt(filename) 
sortedTable=table[(-table[:,2]).argsort()]
print("%f;%f"%(sortedTable[0,0],sortedTable[0,1]))