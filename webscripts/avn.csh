
source ../COMMON.csh

setenv LOGFILE 	logs/www_avn.log

set gdattim="f00-f72-6"
set garea="17;-122;53;-60"
set device="GF|avn1.gif"
set grid=${MODEL}/gfs/${DATE}${1}_gfs215.gem

$GEMEXE/gdplot_gf << EOF > $LOGFILE

	GDFILE	= $grid
	GDATTIM	= $gdattim
	DEVICE	= $device 
	PANEL	= 0
	TEXT	= 1.2/21//hw
	CONTUR	= 1
	MAP     = 31/1/1
	CLEAR	= yes
	CLRBAR  = 31

	GAREA	= $garea
	PROJ	= lcc/25;-95;25
	LATLON	= 0

	GLEVEL	= 500:1000                  !0
	GVCORD	= pres                      !none
	GFUNC	= (sub(hght@500,hght@1000)) !pmsl@0%none
	SCALE	= -1                        ! 0
	CINT	= 6                         ! 4
	LINE	= 3/3/1                     ! 20//2
	GVECT	=
	TITLE	= 5/-2/ ~ AVN MSL PRESSURE, 1000-500 MB THICKNESS
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

# $GEMEXE/gpend

../scripts/saveAVN.csh avn1 avnTHK${date}${1} avnTHK

######################


$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	GDFILE	= $grid
	GVCORD  = pres
	DEVICE	= $device 
	GLEVEL	= 500
	GVECT	= WND ! 
	WIND    = bk31
	SKIP    = /4;4 !
	GFUNC	= (avor(wnd))           !(avor(wnd))           !hght
	CINT	= 2/10/99               !2/4/8                 !6
	LINE	= 7/5/1/2               !4/5/1/2               !19/1/2/1
	HILO	= 2;6/X;N/10-99;10-99   !
	SCALE	= 5                     !5                     ! -1
	TITLE	= 5/-2/ ~ AVN  500 HEIGHTS AND VORTICITY
	PROJ	= lcc/25;-95;25
	FINT	= 16;20;24;28;32;36;40;44
	FLINE	= 0;23-15
	CTYPE	= c/f ! c
	STNPLT  = 0

	list
	run

	exit
EOF

# $GEMEXE/gpend

../scripts/saveAVN.csh avn1 avnVORT${date}${1} avnVORT

#########################

$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	GDFILE	= $grid
	DEVICE	= $device 
	GDATTIM	= $gdattim
	GLEVEL	= 0	!0	!0	!700
	GVCORD	= NONE	!NONE	!none	!pres
	GFUNC	= (quo(p06m,25.4)) !(quo(p06m,25.4)) ! pmsl@0%none !omeg@700%pres
	GVECT	=
	CINT	= /.1/.1!0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0!4!4
	LINE	= 20//1/0           !30//1/0          ! 5/1/1/3 !2/1/1/1
	TITLE	= 5/-2/ ~ AVN  6-HR TOTAL PCPN, MSLP, 700 VV|^ 6-HR TOTAL PCPN, MSLP, 700 VV!0
	SCALE	= 0 ! ! ! 3
	SKIP	= 0
	FINT    = 0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0
	FLINE   = 0;21-27;24;28-30;14;15;2;5
	CTYPE	= f                !c                ! c  ! c
	HILO    =                  !                 !25;2////30;30/y !
	HLSYM   = 2;1.5//21//hw
	STNPLT  = 0
	
	list
	run

	exit
EOF

 # $GEMEXE/gpend

../scripts/saveAVN.csh avn1 avnPREC${date}${1} avnPREC

#########################

rm -f avn2.gif
set device="GF|avn2.gif"


#$GEMEXE/gdplot << EOF >> $LOGFILE
#	GDFILE	= $grid
#	GDATTIM = $gdattim
#	DEVICE  = $device
#	GLEVEL  = 0          !180:0                ! 3000:0
#	GVCORD  = eatm            !pagl             !hght
#	GFUNC   = (quo(pwtr,25.4)) !lft4              !hlcy
#	GVECT   =
#	CINT    = .5;.75;1.0;1.25;1.5;1.75;2.0!-14.;-12.;-10.;-8.;-6.;-4.;-2.;0.;2.!150.;250.;300.;400.;600.
#	LINE    = 0              !15/1/2          ! 30/5/2
#	TITLE   = 5/-2/ ~ AVN  PWTR,LI AND HELICITY    |^ PREC.WATER, LI, HELICITY  !0
#	SCALE   = 0
#	SKIP    = 0
#	FINT    = .5;.75;1.0;1.25;1.5;1.75;2.0
#	FLINE   = 0;21-25;28-30;14;15;2;5
#	CTYPE   = c/f                !c                ! c
#	HILO    =                  !                 !
#	HLSYM   =
#	STNPLT =0

#	list
#	run


#	exit
#EOF

#$GEMEXE/gpend

#../scripts/saveAVN.csh avn2 avnHEL${date}${1} avnHEL

#######################

rm -f avn3.gif

set device="GF|avn3.gif"


#$GEMEXE/gdplot << EOF >> $LOGFILE
#
#	GDFILE	= $grid
#	GDATTIM	= $gdattim
#	DEVICE	= $device 
#	PANEL	= 0
#	TEXT	= 1.2/21//hw
#	CONTUR	= 1
#	MAP     = 31/1/1
#	CLEAR	= yes
#	CLRBAR  = 31
#	GAREA	= $garea
#	PROJ	= lcc/25;-95;25
#	LATLON	= 0
	
	
#	GLEVEL  = 0                !0      !  850
#	GVCORD  = none             !none   !  pres
#	GFUNC   = cape             !cins
#	GVECT   =                  !       !  wind@850%pres
#	WIND    =                  !       !  bk31//1
#	SKIP    = 0                !       ! /4
#	CINT    = 500!-300.;-200.;-160.;-120.;-80.;-40.;0.
#	LINE    = 3/1/1/2           !15/1/2
#	TITLE   = 5/-2/ ~ AVN  CAPE,CIN AND 850 WIND   |^ CAPE,CIN,850 WIND ! 0
#	SKIP    = /2;2
#	FINT    = 500;1000;1500;2000;2500;3000;3500;4000;5000;6000
#	FLINE   = 0;26-16--2;14-8--2
#	CTYPE   = c/f                !c
#	HILO    =                  !
	
#	list
#	run

#	exit
#EOF

#$GEMEXE/gpend

#../scripts/saveAVN.csh avn3 avnCCW${date}${1} avnCCW

#################


$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	GDFILE	= $grid
	GDATTIM	= $gdattim
	DEVICE	= $device 
	PANEL	= 0
	TEXT	= 1.2/21//hw
	CONTUR	= 1
	MAP     = 31/1/1
	CLEAR	= yes
	CLRBAR  = 31
	GAREA	= $garea
	PROJ	= lcc/25;-95;25
	LATLON	= 0
	
	GLEVEL  = 0                !850		!700	!2
	GVCORD  = NONE             !pres	!pres	!hght
	GFUNC   = (quo(p06m,25.4)) !(tmpc) 	!(tmpc)	!(tmpc)
	GVECT   =
	CINT    = 0.10;0.25;0.50;0.75;1.0;1.25;1.5;2.0!-5.0;0.0;2.0!-2.0;0.0;2.0 !-5.;0.;2.
	LINE    = 20//2/0	!6/1/2		!7/1/2	!2/4/2
	TITLE   = 5/-2/ ~ AVN 2M(RED),850MB(BLUE),700 MB T(C)|^ 2M,850,700 MB TMPC, PREC !0!0
	SCALE   = 0
	SKIP    = 0
	FINT    = 0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0
	FLINE   = 0;21-27;24;28-30;14;15;2;5
	CTYPE   = f                !c                ! c  ! c
	HILO    =                  !  !  !
	HLSYM   =
	STNPLT  = 0
	
	list
	run

	exit
EOF

# $GEMEXE/gpend

../scripts/saveAVN.csh avn3 avnTEMP${date}${1} avnTEMP

############


rm -f avn5.gif
set device="GF|avn5.gif"


$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	GDFILE	= $grid
	GDATTIM	= $gdattim
	DEVICE	= $device 
	PANEL	= 0
	TEXT	= 1.2/21//hw
	CONTUR	= 1
	MAP     = 31/1/1
	CLEAR	= yes
	CLRBAR  = 31

	GAREA	= $garea
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
	TITLE	= 5/-2/ ~ AVN   850 HGHTS, DEW POINTS (C) AND WIND|^ 850 Z, TD, WIND!0
	SKIP	= /4;4 !
	FINT	= -20;-16;-12;-8;-4;0;4;8;10;12;14;16;18;20
	FLINE	= 0;26-16--1;14-8--2 !
	CTYPE	= c/f ! c
	HLSYM   = 
	HILO    = 
	STNPLT  = 0

	list
	run


	exit
EOF

# $GEMEXE/gpend
../scripts/saveAVN.csh avn5 avn85P${date}${1} avn85P

######################

$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	GAREA	= $garea
	PROJ	= lcc/25;-95;25
	CLRBAR  = 31

	GLEVEL	= 250  
	GVCORD	= pres !pres  !pres
	GFUNC	= sped !hght  !div(wnd)
	GVECT	= ! !
	CINT	= 10;20;30;40;50;60;70;80;90! 120 !2
	LINE	= 7/5/1/2           !31/1/2/2  !29/1/1/1
	TITLE	= 5/-2/ ~ AVN  250 MB HGHTS, WIND SPEED (M/S) AND DIV
	SCALE	= 0 ! 0 ! 5
	SKIP	= 0 ! 0 ! 0
	FINT    = 10;20;30;40;50;60;70;80;90!!
	FLINE	= 0;26-16--2;14-8--2 
	CTYPE	= f              !c
	HLSYM   = 
	HILO    = 
	STNPLT  = 0
	
	list
	run

	exit	
EOF

# $GEMEXE/gpend

../scripts/saveAVN.csh avn5 avn25P${date}${1} avn25P

############


$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	DEVICE	= $device 
	GAREA	= $garea
	PROJ	= lcc/25;-95;25
	CLRBAR  = 31

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
	TITLE	= 5/-2/ ~ AVN  700 HEIGHTS, RH and TEMP
	FINT	= 10;30;50;70;90
	FLINE	= 0;11;17-23-2
	CTYPE	= f ! c
	STNPLT  = 0
	\$mapfil=HIPOWO.GSF
	list
	run

	exit
EOF

# $GEMEXE/gpend

../scripts/saveAVN.csh avn5 avn70P${date}${1} avn70P

#############

rm -f avn6.gif
set device="GF|avn6.gif"

$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	GDFILE	= $grid
	GDATTIM	= $gdattim
	DEVICE	= $device 
	PANEL	= 0
	TEXT	= 1.2/21//hw
	CONTUR	= 1
	MAP     = 31/1/1
	CLEAR	= yes
	CLRBAR  = 31
	GAREA	= $garea
	PROJ	= lcc/25;-95;25
	LATLON	= 0

	GLEVEL  = 0                !2      !2
	GVCORD  = none             !hght   !hght
	GFUNC=quo(mul(cape,hlcy@3000:0%hght),160000.)!dwpf!tmpf
	GVECT   =                  !       !  
	WIND    =                  !       ! 
	SKIP    = 0                !       ! 
	SCALE   = 0 ! 0 ! 0
	CINT    = 0;0.5;1;1.5;2;3;4;5;6;7;8!45;50;55;60;65;70;75;80!60;70;75;80;85;90;95;100
	LINE    = 3/1/1/2           !15/1/2 ! 31/1/1/1
	TITLE   = 5/-2/ ~ AVN EHI, SFC T & DEW POINT   
	FINT    = 1;1.5;2;3;4;5;6;7;8!
	FLINE   = 0;26-16--2;14-8--2
	CTYPE   = f                !c ! c
	HILO    =                  !  ! 
	STNPLT  =0

	list
	run

	exit
EOF

# $GEMEXE/gpend

../scripts/saveAVN.csh avn6 avnEHI${date}${1} avnEHI

