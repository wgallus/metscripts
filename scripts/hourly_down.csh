#!/bin/csh
# 	Script to download hourly data
# 	# Daryl Herzmann 8 June 2001

 	source ~/webscripts/COMMON

 	cp /home/www/meteor/html/pix/gemwx.gif test_d.gif

 	if (-e test_d.gif) then
 		mv test_d.gif ${ARCHIVE}/sfc${TIMESTAMP}.gif
 		endif

