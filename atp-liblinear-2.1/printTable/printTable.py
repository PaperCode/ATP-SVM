#!/usr/bin/env python
import numpy as np
import sys	

table = np.loadtxt('src') 
for i in range(0, 7):
	print("  & $\square\lozenge$          "),
	for j in range(0, 4):
		print(" & "),
		print("%.2f$\pm$%.2f"%(round(table[8*i+0,j],2),round(table[8*i+1,j],2))),
	print("\\\\")
	print("  & $\\blacksquare\lozenge$     "),
	for j in range(0, 4):
		print(" & "),
		print("%.2f$\pm$%.2f"%(round(table[8*i+2,j],2),round(table[8*i+3,j],2))),
	print("\\\\")
	print("  & $\square\\blacklozenge$     "),
	for j in range(0, 4):
		print(" & "),
		print("%.2f$\pm$%.2f"%(round(table[8*i+4,j],2),round(table[8*i+5,j],2))),
	print("\\\\")
	print("  & $\\blacksquare\\blacklozenge$"),
	for j in range(0, 4):
		print(" & "),
		print("%.2f$\pm$%.2f"%(round(table[8*i+6,j],2),round(table[8*i+7,j],2))),
	print("\\\\")
	print("\hline")
"""
for row in avg:
	for column in row:
		print("%f"%j),
	print
"""
