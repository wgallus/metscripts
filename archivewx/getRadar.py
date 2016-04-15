#!/usr/bin/python
# This program goes and gets radar data from ncdc, lets run at 1 O'clock
# Daryl Herzmann 12-9-99

import time, urllib

now = time.time() - 3*24*3600		# 3 days ago
now_tuple = time.localtime(now)
gmtNow_tuple = time.gmtime(now)

def Main():
	dataDir = time.strftime("/home/httpd/html/archivewx/data/%Y_%m_%d/", gmtNow_tuple)

	for i in range(24):
		i = ("0"+str(i))[-2:]
		timestamp = time.strftime("nowrad%y%m%d"+i+".gif", gmtNow_tuple)
		getFile = time.strftime("%Y/%m/%Y%m%d_"+i+"00_nowrad.gif", gmtNow_tuple)

		remoteURL = "http://www.ncdc.noaa.gov/pub/data/nexrad/natcompnew/"+getFile
		localFile = dataDir+timestamp

#		print remoteURL, localFile		
		urllib.urlretrieve(remoteURL, localFile)




Main()
