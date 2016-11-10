
source ../COMMON.csh

setenv LOGFILE 	logs/www_ruc.log

set device="GF|ruc1.gif"
set grid=${MODEL}/ruc/${DATE}${1}_ruc236.gem

$GEMEXE/gdplot_gf << EOF > $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f00-f12-03
DEVICE	= $device 
PANEL	= 0
TEXT	= 1.2/21//hw
CONTUR	= 1
MAP     = 31/1/1
CLEAR	= yes
CLRBAR  = 31

GAREA	= grid
PROJ	= lcc/25;-95;25
LATLON	= 0

GLEVEL	= 500:1000                  !0
GVCORD	= pres                      !none
GFUNC	= (sub(hght@500,hght@1000)) !mmsl@0%none
SCALE	= -1                        ! 0
CINT	= 6                         ! 4
LINE	= 3/3/1                     ! 20//2
GVECT	=
TITLE	= 5/-2/ ~ RUC   MSL PRESSURE, 1000-500 MB THICKNESS|^ MSLP, 1000-500 THKN!0
SKIP	= 1
FINT	=
FLINE	=
CTYPE	= c
HLSYM   = 2;1.5//21//hw
HILO    = ! 25;2/H#;L#///30;30/y 
STNPLT  = 0
\$mapfil=HIPOWO.GSF
list
run

exit
EOF
#

if (-e ruc1.gif) then
  cp ruc1.gif $CURRENT/rucTHKF00.gif
  cp ruc1.gif.001 $CURRENT/rucTHKF03.gif
  cp ruc1.gif.002 $CURRENT/rucTHKF06.gif
  cp ruc1.gif.003 $CURRENT/rucTHKF09.gif
  cp ruc1.gif.004 $CURRENT/rucTHKF12.gif

  mv ruc1.gif ${ARCHIVE2}/rucTHK${date}${1}F00.gif
  mv ruc1.gif.001 ${ARCHIVE2}/rucTHK${date}${1}F03.gif
  mv ruc1.gif.002 ${ARCHIVE2}/rucTHK${date}${1}F06.gif
  mv ruc1.gif.003 ${ARCHIVE2}/rucTHK${date}${1}F09.gif
  mv ruc1.gif.004 ${ARCHIVE2}/rucTHK${date}${1}F12.gif
endif

#
# Run GDPLOT and generate ETA model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
DEVICE	= $device 
GVCORD  = pres
GLEVEL	= 500
GVECT	= WND ! 
WIND    = bk31
SKIP    = /4;4 !
GFUNC	= (avor(wnd))           !(avor(wnd))           !hght
CINT	= 2/10/99               !2/4/8                 !6
LINE	= 7/5/1/2               !4/5/1/2               !19/1/2/1
HILO	= 2;6/X;N/10-99;10-99   !
SCALE	= 5                     !5                     ! -1
TITLE	= 5/-2/ ~ RUC  500 HEIGHTS AND VORTICITY|^ 500 HGHT AND VORTICITY!0
PROJ	= lcc/25;-95;25/1,3,0,0
FINT	= 16;20;24;28;32;36;40;44
FLINE	= 0;23-15
CTYPE	= c/f ! c
STNPLT  = 0
\$mapfil=HIPOWO.GSF
list
run

exit
EOF
#
# Run GPEND to clean up
#

if (-e ruc1.gif) then
  cp ruc1.gif ${ARCHIVE2}/rucVORT${date}${1}F00.gif
  cp ruc1.gif.001 ${ARCHIVE2}/rucVORT${date}${1}F03.gif
  cp ruc1.gif.002 ${ARCHIVE2}/rucVORT${date}${1}F06.gif
  cp ruc1.gif.003 ${ARCHIVE2}/rucVORT${date}${1}F09.gif
  cp ruc1.gif.004 ${ARCHIVE2}/rucVORT${date}${1}F12.gif

  mv ruc1.gif $CURRENT/rucVORTF00.gif
  mv ruc1.gif.001 $CURRENT/rucVORTF03.gif
  mv ruc1.gif.002 $CURRENT/rucVORTF06.gif
  mv ruc1.gif.003 $CURRENT/rucVORTF09.gif
  mv ruc1.gif.004 $CURRENT/rucVORTF12.gif
endif


# Run GDPLOT and generate ETA model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
DEVICE	= $device
GDATTIM	= F03-F12-03
GLEVEL	= 0 ! 0 ! 0 !700
GVCORD	= pres !   pres  !   none  
GFUNC	= (quo(p03m,25.4)) !(quo(p03m,25.4)) ! mmsl@0%none 
GVECT	=
CINT	= /.1/.1!0.10;0.20;0.30;0.50;0.75;1.00;1.25;1.5;1.75;2.0;2.25;2.5;3.0!4
LINE	= 20//1/0           !30//1/0          ! 5/1/1/3 
TITLE	= 5/-2/ ~ RUC  03-HR TOTAL PCPN, MSLP|^ 03-HOURLY TOTAL PCPN, MSLP!0
SCALE	= 0 ! ! 
SKIP	= 0
FINT    = 0.01;0.10;0.20;0.30;0.5;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.5;3.0
FLINE   = 0;21-27;24;28-30;14;15;2;5
CTYPE	= f                !c                ! c  
HILO    =                  !                 !25;2////30;30/y 
HLSYM   = 2;1.5//21//hw
STNPLT  = 0
\$mapfil=HIPOWO.GSF
list
run

exit
EOF
#
# Run GPEND to clean up
#

if (-e ruc1.gif) then
  cp ruc1.gif $CURRENT/rucPRECF03.gif
  cp ruc1.gif.001 $CURRENT/rucPRECF06.gif
  cp ruc1.gif.002 $CURRENT/rucPRECF09.gif
  cp ruc1.gif.003 $CURRENT/rucPRECF12.gif

  mv ruc1.gif ${ARCHIVE2}/rucPREC${date}${1}F03.gif
  mv ruc1.gif.001 ${ARCHIVE2}/rucPREC${date}${1}F06.gif
  mv ruc1.gif.002 ${ARCHIVE2}/rucPREC${date}${1}F09.gif
  mv ruc1.gif.003 ${ARCHIVE2}/rucPREC${date}${1}F12.gif
endif

##############################################################
set device="GF|ruc2.gif"

#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f00-f12-03
DEVICE	= $device 
PANEL	= 0
TEXT	= 1.2/21//hw
CONTUR	= 1
MAP     = 31/1/1
CLEAR	= yes
CLRBAR  = 31

GAREA	= grid
PROJ	= lcc/25;-95;25
LATLON	= 0

GLEVEL	= 850                      !850     
GVCORD	= pres                     !pres    
GFUNC	= dwpc                     !hght   
SCALE	= 0                        ! 0    
CINT	= -20;-16;-12;-8;-4;0;4;8;10;12;14;16;18;20  ! 30     
LINE	= 7/5/1/2                  ! 2/1/2/1
GVECT	= WND
WIND    = bk4
TITLE	= 5/-2/ ~ RUC   850 HGHTS, DEW POINTS (C) AND WIND|^ 850 Z, TD, WIND!0
SKIP	= /4;4 !
FINT	= -20;-16;-12;-8;-4;0;4;8;10;12;14;16;18;20
FLINE	= 0;26-16--1;14-8--2 !
CTYPE	= c/f ! c
HLSYM   = 
HILO    = 
STNPLT  = 0
\$mapfil=HIPOWO.GSF
list
run


exit
EOF
#
# Run GPEND to clean up
#
# Copy ps.plt to different name for ruc model

if (-e ruc2.gif) then
  cp ruc2.gif $CURRENT/ruc85PF00.gif
  cp ruc2.gif.001 $CURRENT/ruc85PF03.gif
  cp ruc2.gif.002 $CURRENT/ruc85PF06.gif
  cp ruc2.gif.003 $CURRENT/ruc85PF09.gif
  cp ruc2.gif.004 $CURRENT/ruc85PF12.gif

  mv ruc2.gif ${ARCHIVE2}/ruc85P${date}${1}F00.gif
  mv ruc2.gif.001 ${ARCHIVE2}/ruc85P${date}${1}F03.gif
  mv ruc2.gif.002 ${ARCHIVE2}/ruc85P${date}${1}F06.gif
  mv ruc2.gif.003 ${ARCHIVE2}/ruc85P${date}${1}F09.gif
  mv ruc2.gif.004 ${ARCHIVE2}/ruc85P${date}${1}F12.gif
endif


# Run GDPLOT and generate RUC model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GAREA	= grid
PROJ	= lcc/25;-95;25
CLRBAR  = 31
DEVICE	= $device 
GLEVEL	= 700 
GVCORD  = pres !pres !pres
GFUNC	= relh(tmpc,dwpc)    !tmpc           !hght
GVECT   = wnd  ! !
WIND    = bk2
skip    = /4;4 !
CINT	= 10;30;50;70;90 !-20;-10;-5;0;4;6;8;10;12;14;16;18   !30
LINE	= 7/5/1/2               !4/2/2/1             !4/1/2/2
HLSYM   = 
HILO    = 
SCALE	= 0  !0 !0 
TITLE	= 5/-2/ ~ RUC  700 HEIGHTS, RH and TEMP|^ 700 HGHT, RH AND TEMP!0!0
FINT	= 10;30;50;70;90
FLINE	= 0;11;17-23-2
CTYPE	= f ! c
STNPLT  = 0
\$mapfil=HIPOWO.GSF
list
run

exit
EOF
#
# Run GPEND to clean up
#
if (-e ruc2.gif) then
  cp ruc2.gif ${ARCHIVE2}/ruc70P${date}${1}F00.gif
  cp ruc2.gif.001 ${ARCHIVE2}/ruc70P${date}${1}F03.gif
  cp ruc2.gif.002 ${ARCHIVE2}/ruc70P${date}${1}F06.gif
  cp ruc2.gif.003 ${ARCHIVE2}/ruc70P${date}${1}F09.gif
  cp ruc2.gif.004 ${ARCHIVE2}/ruc70P${date}${1}F12.gif

  mv ruc2.gif $CURRENT/ruc70PF00.gif
  mv ruc2.gif.001 $CURRENT/ruc70PF03.gif
  mv ruc2.gif.002 $CURRENT/ruc70PF06.gif
  mv ruc2.gif.003 $CURRENT/ruc70PF09.gif
  mv ruc2.gif.004 $CURRENT/ruc70PF12.gif
endif

# Run GDPLOT and generate RUC model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GAREA	= grid
PROJ	= lcc/25;-95;25
CLRBAR  = 31
DEVICE	= $device 
GLEVEL	= 250  
GVCORD	= pres !pres  !pres
GFUNC	= sped !hght  !div(wnd)
GVECT	= ! !
CINT	= 10;20;30;40;50;60;70;80;90! 120 !2
LINE	= 7/5/1/2           !31/1/2/2  !29/1/1/1
TITLE	= 5/-2/ ~ RUC  250 MB HGHTS, WIND SPEED (M/S) AND DIV|^ 250 MB HGHTS, SPEEDS, DIV!0!
SCALE	= 0 ! 0 ! 5
SKIP	= 0 ! 0 ! 0
FINT    = 10;20;30;40;50;60;70;80;90!!
FLINE	= 0;26-16--2;14-8--2 
CTYPE	= f              !c
HLSYM   = 
HILO    = 
STNPLT  = 0
\$mapfil=HIPOWO.GSF
list
run

exit
EOF
#
# Copy ps.plt to different name for eta model

if (-e ruc2.gif) then 
  cp ruc2.gif $CURRENT/ruc25PF00.gif
  cp ruc2.gif.001 $CURRENT/ruc25PF03.gif
  cp ruc2.gif.002 $CURRENT/ruc25PF06.gif
  cp ruc2.gif.003 $CURRENT/ruc25PF09.gif
  cp ruc2.gif.004 $CURRENT/ruc25PF12.gif

  mv ruc2.gif ${ARCHIVE2}/ruc25P${date}${1}F00.gif
  mv ruc2.gif.001 ${ARCHIVE2}/ruc25P${date}${1}F03.gif
  mv ruc2.gif.002 ${ARCHIVE2}/ruc25P${date}${1}F06.gif
  mv ruc2.gif.003 ${ARCHIVE2}/ruc25P${date}${1}F09.gif
  mv ruc2.gif.004 ${ARCHIVE2}/ruc25P${date}${1}F12.gif
endif
####################################################################################
set device="GF|ruc3.gif"

##set param1="mul(quo(cape@0%none,1000.),quo(hlcy@0:3000%hagl,150.))"
##set param1="MUL(WSHR(OBS),SQRT(CAPE%NONE@0))"
#
# Run GDPLOT and generate ETA model gfs
##GFUNC=quo(mul(cape,hlcy@3000:0%hagl),160000.)!dwpf!tmpf
##GFUNC=quo(mul(cape,hlcy@3000:0%hagl),160000.)!dwpf!MUL(WSHR(OBS),SQRT(CAPE%NONE@0))
##CINT    = 0;0.5;1;1.5;2;3;4;5;6;7;8!45;50;55;60;65;70;75;80!60;70;75;80;85;90;95;100
##CINT    = 0;0.5;1;1.5;2;3;4;5;6;7;8!45;50;55;60;65;70;75;80!.1;.2;.3;.4;.5;.6
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE  = $grid
GDATTIM = f00-f12-03
DEVICE  = $device
PANEL   = 0
TEXT    = 1.2/21//hw
CONTUR  = 1
MAP     = 31/1/1
CLEAR   = yes
CLRBAR  = 31
GAREA   = grid
PROJ    = lcc/25;-95;25
LATLON  = 0

GLEVEL  = 2      !2 !10
GVCORD  = hght
GFUNC   = dwpf!tmpf!
GVECT   =   !      !wnd
WIND    = !  !bk31
SKIP    = !    !/2;2
SCALE   = 0 ! 0 !
CINT    = 5! 5 !
LINE    = 2/1/1/2           !32/1/2 !
TITLE   = 5/-2/ ~ RUC SFC T, DEW POINT (shaded) & WINDS |^ SFC T,DEW POINT & WINDS! 0
FINT    = -40;-10;0;10;20;25;30;40;50;55;60;65;70;75;80! !
FLINE   = 0;27-16--1;14-8--1
CTYPE   = c/f                !c !
HILO    =                  !
STNPLT  =0 !
\$mapfil=HIPOWO.GSF
list
run

exit
EOF
#
#
# Run GPEND to clean up
#
# Copy images to different name for eta model
if (-e ruc3.gif) then
  cp ruc3.gif $CURRENT/rucTEMPF00.gif
  cp ruc3.gif.001 $CURRENT/rucTEMPF03.gif
  cp ruc3.gif.002 $CURRENT/rucTEMPF06.gif
  cp ruc3.gif.003 $CURRENT/rucTEMPF09.gif
  cp ruc3.gif.004 $CURRENT/rucTEMPF12.gif

  mv ruc3.gif ${ARCHIVE2}/rucTEMP${date}${1}F00.gif
  mv ruc3.gif.001 ${ARCHIVE2}/rucTEMP${date}${1}F03.gif
  mv ruc3.gif.002 ${ARCHIVE2}/rucTEMP${date}${1}F06.gif
  mv ruc3.gif.003 ${ARCHIVE2}/rucTEMP${date}${1}F09.gif
  mv ruc3.gif.004 ${ARCHIVE2}/rucTEMP${date}${1}F12.gif
endif
