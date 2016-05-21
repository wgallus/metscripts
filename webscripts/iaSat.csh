#! /bin/csh 
# 12 Jun 2002:	Catch goofs with rm
#
#####################################################3


source ~/webscripts/COMMON
cd ~/webscripts/tmp
rm -f IAsat*.gif* >& /dev/null
setenv LOGFILE 	www_IAsatir

setenv OUTPUT0 IAsatir.gif
set device="GF|${OUTPUT0}"
set grid=`ls -t /data/mcidas/AREA015? | head -1`
set grid1="/data/gempak/surface/"
#
#
$GEMEXE/gpmap_gf << EOF > $LOGFILE
	DEVICE   = $device
	MAP      = 3/1/2
	GAREA    = IA
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



#gifsicle -b -O2 --use-col=web ${OUTPUT0}

if (-e ${OUTPUT0}) then
  mv ${OUTPUT0} ~/current
endif

set device="GF|IAsatvis.gif"
set grid=`ls -t /data/mcidas/AREA014? | head -1`

$GEMEXE/gpmap_gf << EOF >> $LOGFILE
	DEVICE   = $device
	MAP      = 3/1/2
	GAREA    = IA
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
	CLRBAR	= 0
	list
	run

	exit
EOF

if (-e IAsatvis.gif) then
  mv IAsatvis.gif ~/current
endif
