#! /bin/csh 
#  27 Feb 2003:	Check to make sure gif exists

#source /home/nawips/Gemenviron

#setenv DISPLAY :1

#
set yy=`date -u +%y`
set mm=`date -u +%m`
set dd=`date -u +%d`
set date=${yy}${mm}${dd}
# set hh=`date -u +%H`
source ~/webscripts/COMMON
# Set up local variables
#
# DATA_DIR=GEMPAK surface data directory;
# META_DIR=Directory to store Meta files in
# LOGFILE=file to catch GEMPAK program output
#
setenv DATA_DIR	$SAO
setenv LOGFILE 	www_tmp2
#
# Remove last hour's sfc grid file, and ps file
#
rm -f www_tmp2 tmp2_01.gif
#
# Set some variables for GDPLOT run
#
set device="gf"
# set grid=${DATA_DIR}/${date}${1}.gbm
set grid=${DATA_DIR}/${DATE}${1}_sao.gem
#
# Run SFMAP to generate plot of 6 am temps
#
# modified 24 Jun 1997 geff@iastate.edu; "sfmap1 not found"
#$GEMEXE/sfmap1 << EOF >> $LOGFILE
$GEMEXE/sfmap_gf << EOF >> $LOGFILE
\$RESPOND = YES
DEVICE	= GF|tmp2_01.gif|720;540
AREA     = 20;-128;53;-54
GAREA    = 20;-116;51;-62
SATFIL   = 
RADFIL   = 
SFPARM   = tmpf
DATTIM   = ${date}/18
SFFILE   = $grid
COLORS   = 5
MAP      = 15/1/3
LATLON   = 0
MARKER   = 0
TITLE    = 31/-2/~  NOON SURFACE TEMPERATURE
CLEAR    = yes
PANEL    = 0
PROJ     = lcc
FILTER   = 0.8
TEXT     = 0.70/2/1/hw
SKPMIS   = NO
list
run

exit
EOF

if (-e tmp2_01.gif) then

  cp tmp2_01.gif ${ddir2}/pix/tmp/${DATE}_12pm_sfc_temps.gif
  mv tmp2_01.gif $WEBPIX//tmp2_01.gif
  keep $WEBPIX//tmp2_01.gif

endif
