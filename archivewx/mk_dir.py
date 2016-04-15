#!/usr/bin/python
# This program generates the directory to start putting data into ...
# Daryl Herzmann 6-2-99
# UPDATED 7-12-99: Changed the ownerships of the upload directory

import os, time

data_dest = "/home/httpd/html/archivewx/data/"

def Main():
	now = time.time()
	now = now + 24*3600  # Tommarrow
	now_tuple = time.localtime(now)

	new_dir = time.strftime("%Y_%m_%d", now_tuple)
	os.mkdir(data_dest+new_dir)
	os.mkdir(data_dest+new_dir+"/skew")
	os.mkdir(data_dest+new_dir+"/DMX")
#	os.system("chown akrherz.palsdata "+data_dest+new_dir)
	os.system("chmod 775 "+data_dest+new_dir)
	os.system("chmod 775 "+data_dest+new_dir+"/skew")
	os.system("chmod 775 "+data_dest+new_dir+"/DMX")

Main()
