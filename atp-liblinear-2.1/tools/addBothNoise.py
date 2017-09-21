#!/usr/bin/env python
"""
usage: 
> python addBothNoise.py dataSet labelNoiseProp featureNoiseProp sigma noisySet
"""
import os, sys, string, random
#, numpy

def process_options(argv):
	dataset = argv[1]
	labelNoiseProp = float(argv[2])
	featureNoiseProp = float(argv[3])
	sigma = float(argv[4])
	noisySet = open(argv[5],'w')
	return dataset, labelNoiseProp, featureNoiseProp, sigma, noisySet

def main(argv=sys.argv):
	dataset, labelNoiseProp, featureNoiseProp, sigma, noisySet = process_options(argv)
	dataset = open(dataset,'r')
	for line in dataset: 		
		#line = dataset.readline()
############### label noise ###################
		if random.random() < labelNoiseProp:
			line = line.split(None, 1)
			if len(line) == 1: line += ['']# In case an instance with all zero features
			label, feature = line
			line = str(-int(label)) + ' ' + feature
############### feature noise ###################
		if random.random() < featureNoiseProp:
			line = line.split(None, 1)
			if len(line) == 1: line += ['']# In case an instance with all zero features
			label, feature = line
			line = label
			for e in feature.split():
				index, value = e.split(":")
				value = float(value) + random.gauss(0,sigma)
				line = line + ' ' + index + ':' + str(value)
			line = line + '\n'
###############  end ###################
		noisySet.write(line)
	noisySet.close()
	dataset.close()

if __name__ == '__main__':
	main(sys.argv)

