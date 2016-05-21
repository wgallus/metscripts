#!/bin/csh -f
###################################################
# Sample GPRCM radar coded message summary plotting 
# script. 
#
# Chiz/Unidata 11/99
###################################################

source COMMON
setenv DISPLAY localhost:1

set DATTIM=`date -u '+%y%m%d/%H%M'`

rm radar_sum.gif* >& /dev/null

# Obtain last 3 RCM file names to obtain data over
# the past hour. Open these files in reverse order.
#
set RCM=`ls -r /data/rcm/*_rcm.dat | head -3`
set LOGFILE=radSum.out

if($#RCM < 1) then
   echo "no radar data"
   exit
endif


# cat the rcm data to a single file
set RCM1=/tmp/tmprad.$$
cat $RCM > $RCM1

gprcm_gf << EOF > ${LOGFILE}
 MAP      = 2
 GAREA    = 35;-105;46;-83
 PROJ     = STR/90.0;-105.0;0.0
 SATFIL   = 
 RADFIL   = 
 LATLON   = 0
 PANEL    = 0
 TITLE    = 1/0/Radar Summary ${DATTIM}
 TEXT     = 1/1/1/hw
 CLEAR    = YES
 DEVICE   = gf|radar_sum.gif
 RCMFIL   = $RCM1
 RADTIM   = current
 RADDUR   = 50
 DITHER   = 0
 MESO     = 5/2/1/2/hw
 TVS      = 5/1/1/2/hw
 CNTR     = 0
 MAXTOP   = 0
 RADINFO  = 0
 ECHO     = 1
 CLRBAR   = 1/h/cc/.45;.06
 r

 e
EOF

rm $RCM1


