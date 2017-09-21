#!/usr/bin/env python
import numpy as np
import sys

filename = str(sys.argv[1])
table = np.loadtxt(filename) 
tableAVG = table.mean(axis=0)
tableSTD = np.std(table, axis=0)
for i in tableAVG:
	print("%f"%i),
print
for j in tableSTD:
	print("%f"%j),
"""
size = avg.size
paraNum = size/3
avg.resize(paraNum, 3)
#np.savetxt('output',avg)
for i in avg:
	for j in i:
		print("%f"%j),
	print
#print(avg)
"""
