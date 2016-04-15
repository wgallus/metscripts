source ../COMMON.csh

setenv DATA_DIR	/data/gempak/profiler
setenv LOGFILE 	www_pro

set device="GF|slater.gif"
set grid=${DATA_DIR}/${DATE}_pro.gem

#
# Run SNCROSS2 to generate time series of Slater profiler winds
#
$GEMEXE/sncross2_gf << EOF > $LOGFILE
	DEVICE	= $device 
	CXSTNS   = slai4
	SNPARM   =     
	SNFILE   = $grid
	DATTIM   = all
	VCOORD   = hght
	PTYPE    = lin
	YAXIS    = 500/12000/1000
	TAXIS    = 
	LINE     = 31/1/1/1
	BORDER   = 5
	CINT     = 5
	WIND     = bk30-7
	TITLE    = 5/-2/ TODAY'S PROFILER WINDS FROM SLATER, IA
	PANEL    = 0
	CLEAR    = y
	FILTER   = 0.7
	TEXT     = 0.8/21/1/hw
	CURVE    = 2
	CLRBAR   = 0
	CONTUR   = 3/3
	FINT     = 
	FLINE    = 
	CTYPE    = c
	list
	run

	exit
EOF



# Rename ps file to indicate sfc data
mv slater.gif $CURRENT
