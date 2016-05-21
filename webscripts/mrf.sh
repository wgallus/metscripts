#!/bin/csh  
# 14 Jun 2002:	Cleanups and such
# 24 Feb 2003:	Check if for output file
##############################################################3

source ~/webscripts/COMMON
cd ~/webscripts/tmp

setenv FILE_DIR	/data/gempak/model
setenv LOGFILE	www_mrf

rm -f mrf.gif* >& /dev/null

set device="GF|mrf.gif"
set grid=${FILE_DIR}/mrf/${DATE}${1}_mrf201.gem
# set grid=${FILE_DIR}/00041900_m.gem


if !(-e $grid) then
        echo "ABORT: Can not find grid file $grid"
        echo "MRF Model -> $grid" >> RERUNS
        exit 2
endif



$GEMEXE/gdplot_gf << EOF > $LOGFILE
	GDFILE	= $grid
	GDATTIM	= f96-f240-24
	DEVICE	= $device 
	PANEL	= 0
	TEXT	= 1.2/21//hw
	CONTUR	= 1
	MAP     = 31/1/1
	CLEAR	= yes
	CLRBAR  = 0

	GAREA	= 17.529;-129.296;53.771;-22.374
	PROJ	= str/90;-105;0
	LATLON	= 0
	
	GFUNC =  hght  ! pmsl@0%NONE 
	GLEVEL = 500   !0     ! 1000
	GVECT =        !      ! wind@1000%PRES
	WIND  =        !      ! Bk32/0.8/2 
	GVCORD=  PRES            
	PROJ  =   str/+90;-100;0/1;3;1;2  
	GAREA =  10;-125;50;-20         
	SKIP  =  0/0/1 
	SCALE =  999
	CTYPE =  c/f ! c                               
	CINT  =  60 ! 4
	LINE  =  15/1/2/1 ! 32/1/2/1  
	FINT  =  4800;4920;5040;5160;5280;5400;5520;5640;5760;5880;6000 !
	FLINE =  30-22--1;18-10--1!
	HILO  =  !25;2/H#;L#///30;30/y !
	HLSYM =   
	REFVEC=                 
	STNPLT=  
	TITLE   = 31/-2/  ~  MRF 500mb HGHT, WIND (knts), MSL Press|^ 500mb HGHT WND & PMSL!0
	list
	run

	exit
EOF

if (-e mrf.gif) then 
  ~/bin/saveMrf mrf mrfSTD${date}${1} mrfSTD
endif
