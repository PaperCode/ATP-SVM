#!/usr/bin/env python
"""
usage: 
> python addLabelNoise.py dataSet 0.1 noisySet
"""
import os, sys, string, random

def process_options(argv):
	dataset = argv[1]
	noiseProp = float(argv[2])
	noisySet = open(argv[3],'w')
	return dataset, noiseProp, noisySet

def main(argv=sys.argv):
	dataset, noiseProp, noisySet = process_options(argv)
	dataset = open(dataset,'r')
	for line in dataset: 		
		#line = dataset.readline()
		if random.random() < noiseProp:
			line = line.split(None, 1)
			if len(line) == 1: line += ['\n']# In case an instance with all zero features
			label, feature = line
			line = str(-int(label)) + ' ' + feature
		noisySet.write(line)
	noisySet.close()
	dataset.close()

if __name__ == '__main__':
	main(sys.argv)

