#!/usr/bin/env python
"""
usage: 
> python addFeatureNoise.py dataSet noiseProp sigma noisySet
"""
import os, sys, string, random
#, numpy

def process_options(argv):
	dataset = argv[1]
	noiseProp = float(argv[2])
	sigma = float(argv[3])
	noisySet = open(argv[4],'w')
	return dataset, noiseProp, sigma, noisySet

def main(argv=sys.argv):
	dataset, noiseProp, sigma, noisySet = process_options(argv)
	dataset = open(dataset,'r')
	for line in dataset: 		
		#line = dataset.readline()
############### feature noise ###################
		if random.random() < noiseProp:
			line = line.split(None, 1)
			if len(line) == 1: line += ['']# In case an instance with all zero features
			label, feature = line
			line = label + ' '
			for e in feature.split():
				index, value = e.split(":")
				value = float(value) + random.gauss(0,sigma)
				line = line + index + ':' + str(value) + ' '
			line = line + '\n'
		noisySet.write(line)
	noisySet.close()
	dataset.close()

if __name__ == '__main__':
	main(sys.argv)

