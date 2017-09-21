#!/usr/bin/env python
import os 
var='123'
os.environ['var']=str(var)
os.system('echo $var') 
