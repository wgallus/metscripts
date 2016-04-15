
source ../Gemenviron.csh

set yy=`date --date "1 days ago" -u +%y`
set YY=`date --date "1 days ago" -u +%Y`
set mm=`date --date "1 days ago" -u +%m`
set dd=`date --date "1 days ago" -u +%d`
set DATE=${YY}${mm}${dd}
set hh=`date --date "1 days ago" -u +%H`
set bigdate=`date --date "1 days ago" -u +%Y.%m.%d\ %HZ`
setenv ARCHIVE ~/archive/${YY}_${mm}_${dd}/
setenv TIMESTAMP ${yy}${mm}${dd}${hh}



setenv IMAGE skew_${2}_${1}.gif
setenv DEVICE GF\|${IMAGE}\|720\;540

setenv DATA_DIR	/data/gempak/upperair
setenv LOGFILE 	www_skew

setenv TIMESTAMP  ${yy}${mm}${dd}${1}
setenv ARCHIVE $ARCHIVE/${YY}_${mm}_${dd}/skew/
setenv OUTFILE1 $CURRENT/skew/skew${2}.gif
setenv OUTFILE2 ${ARCHIVE}/skew${2}${TIMESTAMP}.gif


set grid=${DATA_DIR}/${DATE}_upa.gem

$GEMEXE/snprof_gf << EOF > skew_log/${LOGFILE}_${2}
	SNFILE   = $grid
	DEVICE   = ${DEVICE}
	DATTIM   = ${DATE}/${1}
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

if (-e ${IMAGE} ) then
  cp ${IMAGE} ${OUTFILE1}
  mv ${IMAGE} ${OUTFILE2}
endif
