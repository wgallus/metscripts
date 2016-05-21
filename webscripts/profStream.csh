#!/bin/csh
# Script that plots profiler StreamLines
# Daryl Herzmann 1 Nov 2001


source ~nawips/Gemenviron

set date=`date -u +%Y%m%d`
set hh=`date -u +%H`

setenv DISPLAY localhost:1

oabsnd << EOF > tmp/oabsnd_profStream.out
	SNFILE	 =  /data/gempak/profiler/${date}_pro.gem
	GDFILE	 =  snd.grd
	SNPARM	 =  uwnd;vwnd
	STNDEX	 =
	LEVELS	 =  500;1000
	VCOORD	 =  HGHT
	DATTIM	 =  all
	DTAAREA	 =  us-
	GUESS	 =  
	GAMMA	 =  0.3
	SEARCH	 =  20
	NPASS	 =  2
	QCNTL	 =  5;;50
	list
	run

	exit
EOF

gpend


gdstream_gf << EOF > tmp/gdstream_profStream.out
	GDATTIM	 =  /${hh}00
	GLEVEL	 =  500
	GVCORD	 =  HGHT
	GVECT	 =  WND
	GDFILE	 =  snd.grd
	GAREA	 =  ia-
	SATFIL	 =
	RADFIL	 =
	LINE	 =  3//2
	MAP	 =  1/7
	LATLON	 =  2/10/1/1/5;5
	TITLE	 =  5
	PANEL	 =  0
	TEXT	 =  1
	DEVICE	 =  GF|profS_500.gif
	PROJ	 =  nps
	CLEAR	 =  yes
	WIND	 =  an3////.75
	LUTFIL   =
	STNPLT   =
	list
	run

	exit
EOF


