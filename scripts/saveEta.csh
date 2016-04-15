#!/bin/csh
# This file simply saves the ETA plots into the current and archive 

source ../COMMON.csh

if (-f ${1}.gif ) then
	cp ${1}.gif $CURRENT/${3}F00.gif
#	echo "${1}.gif ${ARCHIVE2}/${2}F00.gif"
	mv ${1}.gif ${ARCHIVE2}/${2}F00.gif
else
	cp black.gif $CURRENT/${3}F00.gif
	echo Did not find "${1}.gif" 
	cp black.gif ${ARCHIVE2}/${2}F00.gif

endif

if (-f ${1}.gif.001 ) then
	cp ${1}.gif.001 $CURRENT/${3}F06.gif
#	echo "${1}.gif.001 ${ARCHIVE2}/${2}F06.gif"
	mv ${1}.gif.001 ${ARCHIVE2}/${2}F06.gif
else
	cp black.gif $CURRENT/${3}F06.gif
	echo Did not find "${1}.gif.001" 
	cp black.gif ${ARCHIVE2}/${2}F06.gif

endif

if (-f ${1}.gif.002 ) then
	cp ${1}.gif.002 $CURRENT/${3}F12.gif
#	echo "${1}.gif.002 ${ARCHIVE2}/${2}F12.gif"
	mv ${1}.gif.002 ${ARCHIVE2}/${2}F12.gif
else
	cp black.gif $CURRENT/${3}F12.gif
	echo Did not find "${1}.gif.002" 
	cp black.gif ${ARCHIVE2}/${2}F12.gif

endif

if (-f ${1}.gif.003 ) then
	cp ${1}.gif.003 $CURRENT/${3}F18.gif
#	echo "${1}.gif.003 ${ARCHIVE2}/${2}F18.gif"
	mv ${1}.gif.003 ${ARCHIVE2}/${2}F18.gif
else
	cp black.gif $CURRENT/${3}F18.gif
	echo Did not find "${1}.gif.003" 
	cp black.gif ${ARCHIVE2}/${2}F18.gif

endif

if (-f ${1}.gif.004 ) then
	cp ${1}.gif.004 $CURRENT/${3}F24.gif
#	echo "${1}.gif.004 ${ARCHIVE2}/${2}F24.gif"
	mv ${1}.gif.004 ${ARCHIVE2}/${2}F24.gif
else
	cp black.gif $CURRENT/${3}F24.gif
	echo Did not find "${1}.gif.004" 
	cp black.gif ${ARCHIVE2}/${2}F24.gif

endif

if (-f ${1}.gif.005 ) then
	cp ${1}.gif.005 $CURRENT/${3}F30.gif
#	echo "${1}.gif.005 ${ARCHIVE2}/${2}F30.gif"
	mv ${1}.gif.005 ${ARCHIVE2}/${2}F30.gif
else
	cp black.gif $CURRENT/${3}F30.gif
	echo Did not find "${1}.gif.005" 
	cp black.gif ${ARCHIVE2}/${2}F30.gif

endif

if (-f ${1}.gif.006 ) then
	cp ${1}.gif.006 $CURRENT/${3}F36.gif
#	echo "${1}.gif.006 ${ARCHIVE2}/${2}F36.gif"
	mv ${1}.gif.006 ${ARCHIVE2}/${2}F36.gif
else
	cp black.gif $CURRENT/${3}F36.gif
	echo Did not find "${1}.gif.006" 
	cp black.gif ${ARCHIVE2}/${2}F36.gif

endif

if (-f ${1}.gif.007 ) then
	cp ${1}.gif.007 $CURRENT/${3}F42.gif
#	echo "${1}.gif.007 ${ARCHIVE2}/${2}F42.gif"
	mv ${1}.gif.007 ${ARCHIVE2}/${2}F42.gif
else
	cp black.gif $CURRENT/${3}F42.gif
	echo Did not find "${1}.gif.007" 
	cp black.gif ${ARCHIVE2}/${2}F42.gif

endif

if (-f ${1}.gif.008 ) then
	cp ${1}.gif.008 $CURRENT/${3}F48.gif
#	echo "${1}.gif.008 ${ARCHIVE2}/${2}F48.gif"
	mv ${1}.gif.008 ${ARCHIVE2}/${2}F48.gif
else
	cp black.gif $CURRENT/${3}F48.gif
	echo Did not find "${1}.gif.008" 
	cp black.gif ${ARCHIVE2}/${2}F48.gif

endif

if (-f ${1}.gif.009 ) then
        cp ${1}.gif.009 $CURRENT/${3}F54.gif
#        echo "${1}.gif.009 ${ARCHIVE2}/${2}F54.gif"
        mv ${1}.gif.009 ${ARCHIVE2}/${2}F54.gif
else
        cp black.gif $CURRENT/${3}F54.gif
        echo Did not find "${1}.gif.009"
        cp black.gif ${ARCHIVE2}/${2}F54.gif

endif



if (-f ${1}.gif.010 ) then
	cp ${1}.gif.010 $CURRENT/${3}F60.gif
#	echo "${1}.gif.010 ${ARCHIVE2}/${2}F60.gif"
	mv ${1}.gif.010 ${ARCHIVE2}/${2}F60.gif
else
	cp black.gif $CURRENT/${3}F60.gif
	echo Did not find "${1}.gif.010" 
	cp black.gif ${ARCHIVE2}/${2}F60.gif

endif
