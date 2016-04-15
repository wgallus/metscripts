#!/usr/bin/python
# This program brings the severe data file over onto PALS
# Daryl Herzmann 6-2-99
# 08 Jun 2002:	Lets not make excessive emails...
#
############################################################

import os, time

svr_orig = "/data/text/Severe/"
pub_orig = "/data/text/Public/"
data_dest = "/home/httpd/html/archivewx/data/"

def Main():
	now = time.time()
	now = now - 2*86400
	now_tuple = time.localtime(now)

	filename = time.strftime("Severe.%d", now_tuple)
	filename2 = time.strftime("Public.%d", now_tuple)
	new_filename = time.strftime("sev%Y_%m_%d.txt", now_tuple)
	new_filename2 = time.strftime("pub%Y_%m_%d.txt", now_tuple)
	dirname = time.strftime("%Y_%m_%d/", now_tuple)	

	os.system("cp "+svr_orig+filename+" "+data_dest+dirname+new_filename+" ")
#	print data_dest+dirname+new_filename

	os.system("cp "+pub_orig+filename2+" "+data_dest+dirname+new_filename2+" ")
#	print data_dest+dirname+new_filename2

Main()
