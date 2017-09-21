#!/usr/bin/env python
import numpy as np
import sys

filename = str(sys.argv[1])
table = np.loadtxt(filename) 
tableAVG = table.mean(axis=0)
tableSTD = np.std(table, axis=0)
size = tableAVG.size
paraNum = size/3
tableAVG.resize(paraNum, 3)
tableSTD.resize(paraNum, 3)
#print(tableAVG[:,0])
#outputMatrix = np.concatenate((tableAVG, tableSTD), axis=1)
#np.savetxt('output',avg)
for i in tableAVG[:,0]:
	print("%f"%i),
print
for i in tableAVG[:,1]:
	print("%f"%i),
print
for i in tableSTD[:,1]:
	print("%f"%i),
print
for i in tableAVG[:,2]:
	print("%f"%i),
print
for i in tableSTD[:,2]:
	print("%f"%i),
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
