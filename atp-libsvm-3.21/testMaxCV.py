#!/usr/bin/env python
import numpy as np
import sys

filename = str(sys.argv[1])
table = np.loadtxt(filename) 
sortedTable=table[(-table[:,2]).argsort()]
for i in sortedTable:
	for j in i:
		print("%f"%j),
	print
