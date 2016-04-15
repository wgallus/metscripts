source ../COMMON.csh

setenv DISPLAY localhost:1

set day=`date -u +"%Y%m%d"`
set time=`date -u +"%Y%m%d%H%M"`
set lyear=`date -u +"%Y"`
set lmonth=`date -u +"%b"`
set lday=`date -u +"%d"`
set lhr=`date +"%I"`
set lmin=`date +"%M"`
set lap=`date +"%p"`
set lzone=`date +"%Z"`

set lgmt=`date -u +"%H%M"`


set plotlabel="NEXRAD Reflectivity (dBz)     ${lgmt} UTC ${lday} ${lmonth}, ${lyear} (${lhr}:${lmin} ${lap} ${lzone})"

gdcntr_gf << EOF2 > tmp/natMOSIAC.log
rest usgdcntr
GDFILE=/data/gempak/model/${day}_radar.gem
GFUNC=RDSP1
TITLE = 5/2/${plotlabel}
PROJ =  STR/90;-97;0
PROJ =  MER
PROJ =  STR/39;-97;0
PROJ = LCC/20;-96;60/NM
GAREA = 20.00;-120.00;  51.00; -62.00
r

exit
EOF2

if (-e temp.gif) then
	mv temp.gif ~/current/nationalRAD.gif
endif

gdcntr_gf << EOF2 > tmp/mwMOSIAC.log
rest usgdcntr
GDFILE=/data/gempak/model/${day}_radar.gem
GFUNC=RDSP1
TITLE = 5/2/${plotlabel}
PROJ =  STR/90;-97;0
PROJ =  MER
PROJ =  STR/39;-97;0
GAREA = IA-
r

exit
EOF2

if (-e temp.gif) then
        mv temp.gif $CURRENT/mwRAD.gif
endif

