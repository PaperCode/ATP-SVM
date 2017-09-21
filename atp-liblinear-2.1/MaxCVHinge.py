#!/usr/bin/env python
import numpy as np
import sys

filename = str(sys.argv[1])
table = np.loadtxt(filename) 
sortedTable=table[(-table[:,1]).argsort()]
print("%f"%(sortedTable[0,0]))
