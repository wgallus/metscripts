#! /bin/csh 
# 12 Jun 2002:	Clean up a little bit
#
##########################################################

source ~/webscripts/COMMON
cd ~/webscripts/tmp
rm -f satir.gif* >& /dev/null
setenv LOGFILE 	www_satir

setenv OUTPUT0 satir.gif
set device="GF|${OUTPUT0}|960;720"
set grid=`ls -t /data/gempak/images/sat/SUPER-NATIONAL/8km/IR/IR* | head -1`
set grid1="/data/gempak/surface/"
#
# Run GPMAP to generate radar plot
#
$GEMEXE/gpmap_gf << EOF > $LOGFILE
	DEVICE   = $device
	MAP      = 3/1/2
	GAREA    = 20;-120;65;-59
	PROJ     = sat
	SATFIL   = ${grid}
	RADFIL   =        
	LATLON   = 0
	PANEL    = 0 
	TITLE    = 1
	LUTFIL   = DEFAULT
	STNPLT   = 0
	TEXT     = 1/2/1/hw
	CLEAR    = yes
	list
	run

	exit
EOF

if (-e ${OUTPUT0}) then

  gifsicle -b -O2 --use-col=web ${OUTPUT0}

  cp ${OUTPUT0} ${ARCHIVE}/sat${TIMESTAMP}.gif
  mv ${OUTPUT0} ~/current
endif
