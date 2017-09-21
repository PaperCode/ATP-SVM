#!/usr/bin/env python
import numpy as np
import sys

filename = str(sys.argv[1])
filename += '_temp'
table = np.loadtxt(filename) 
avg = table.mean(axis=0)
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
index = 0
for i in avg
	print("%f "%i)
	if(index%3==0) : print("\n")
	index += 1
"""
#print ("His height is %f m"%(1.835))
