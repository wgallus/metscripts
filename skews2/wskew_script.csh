#! /bin/csh 
########################################################
# generate multiple skew-T plots
#
# Can be run from cron.
# 
########################################################
#
# The first argument is the observation hour to be used
# The second is the station's three-letter identifier
# The third is the station name that should appear in the title
#
# source the 5.2 environment variables 
#
source ~/projects/metscripts/COMMON.csh
setenv TARGET $WEBPIX/skew
setenv IMAGE ${TARGET}/skew_${2}_${1}.gif
setenv DEVICE GF\|${IMAGE}\|720\;540
#
# Set the root Ntrans directory
#
# setenv NTRANSHOME  ${NAWIPS}/nprogs/ntrans2.1
#
# cd to temporary directory. This is where the Nmeta file 
# will be kept while the script is running.
#
cd ~/skews
#
# Define current date
#
set yy=`date -u +%Y`
set mm=`date -u +%m`
set dd=`date -u +%d`
set date=${yy}${mm}${dd}
#
# Set up local variables
#
# DATA_DIR=GEMPAK surface data directory;
# LOGFILE=file to catch GEMPAK program output
#
setenv DATA_DIR	/data/gempak/upperair
setenv LOGFILE 	www_skew
#
# Remove previous error output and image
#
rm -f www_skew ${IMAGE}
#
# Set some variables for GDPLOT run
#
set grid=${DATA_DIR}/${date}_upa.gem
#
# Run SNPROF to generate skew-Ts
#
# changed 2001.04.13 geff@iastate.edu
#$GEMEXE/snprof << EOF >> $LOGFILE
$GEMEXE/snprof_gf << EOF >> $LOGFILE
SNFILE   = $grid
DEVICE   = ${DEVICE}
DATTIM   = ${date}/${1}
AREA     = @${2}
SNPARM   = tmpc;dwpc
LINE     = 3
PTYPE    = skewt
VCOORD   = pres
STNDEX   = lift;swet;kinx;totl;cape;cins;brch
STNCOL   = 5
WIND     = bk27/.8/1//.5
WINPOS   = 1
MARKER   = 0
BORDER   = 31
TITLE    = 5/-0/ Skew-T from ${3}
YAXIS    = 1020/100//1;1;0
XAXIS    = -40/40/10/1;1;0
FILTER   = no
CLEAR    = yes
PANEL    = 0
TEXT     = 0.8/2//hw
THTALN   = 4/1/1
THTELN   = 4/2/1
MIXRLN   = 2/2/1
list
run

exit

EOF

#
# Run GPEND to clean up
#
# disabled 2001.04.13 geff@iastate.edu
#$GEMEXE/gpend

# archive the image we just created
if (-e ${IMAGE}) then
  keep ${IMAGE}
endif
