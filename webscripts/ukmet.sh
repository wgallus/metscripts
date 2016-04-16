source ../COMMON.csh


setenv LOGFILE 	logs/www_ukmet.log

set device="GF|ukmet1.gif"
set grid=$MODEL/ukmet/${DATE}${1}_ukmet.gem
set dattim="f00-f72-6"


$GEMEXE/gdplot2_gf << EOF > $LOGFILE

        GDFILE  = $grid
        GDATTIM = ${dattim}
        DEVICE  = $device 
        PANEL   = 0
        TEXT    = 1.2/21//hw
        CONTUR  = 1
        MAP     = 31/1/1
        CLEAR   = yes
        CLRBAR  = 31

        GAREA   = US-
        PROJ    = LCC/25;-96;25
        LATLON  = 0

	GLEVEL	= 500
	GVCORD	= pres
	GDPFUN	= HGHT
	GVECT	=
	CINT	= 100
	LINE	= 20
	TITLE	= 5/-2/~ UKMET 500 mb Heights
	SCALE	= 0                
	SKIP	= 0
	FINT    = 
	FLINE   = 
	CTYPE	= C
	HILO    = 
	HLSYM   = 
	STNPLT  = 0
	\$mapfil=HIPOWO.GSF
	list
	run

	exit
EOF


~/bin/saveUKMet ukmet1 ukmet500${date}${1} ukmet500

exit

##########################################
# ETA Prec Water, Lifted Index, Helicity

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
	GDFILE	= $grid
	GDATTIM = ${dattim}
	DEVICE  = $device
	GLEVEL  = 0                !180:0           !3000:0
	GVCORD  = eatm             !pagl            !hagl
	GFUNC   = (quo(pwtr,25.4)) !lft4            !hlcy
	GVECT   =
	CINT    = .5;.75;1.0;1.25;1.5;1.75;2.0!-14.;-12.;-10.;-8.;-6.;-4.;-2.;0.;2.!150.;250.;300.;400.;600.
	LINE    = 0              !15/1/2          ! 30/5/2
	TITLE   = 5/-2/ ~ ETA  PWTR,LI AND HELICITY    |^ PREC.WATER, LI, HELICITY  !0
	SCALE   = 0
	SKIP    = 0
	FINT    = .5;.75;1.0;1.25;1.5;1.75;2.0
	FLINE   = 0;21-25;28-30;14;15;2;5
	CTYPE   = c/f              !c                !c
	HILO    =                  !                 !
	HLSYM   =
	STNPLT =0
	\$mapfil=HIPOWO.GSF
	list
	run

	exit
EOF


~/bin/saveEta eta1 etaHEL${date}${1} etaHEL


#########################################################
# ETA CAPE, CIN, 850 Wind

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
	GDFILE	= $grid
	GDATTIM	= ${dattim}
	DEVICE	= $device 
	PANEL	= 0
	TEXT	= 1.2/21//hw
	CONTUR	= 1
	MAP     = 31/1/1
	CLEAR	= yes
	CLRBAR  = 31
	GAREA	= 17;-122;53;-60
	PROJ	= lcc/25;-95;25
	LATLON	= 0


	GLEVEL  = 0                !0      !  850
	GVCORD  = none             !none   !  pres
	GFUNC   = cape             !cins
	GVECT   =                  !       !  wind@850%pres
	WIND    =                  !       !  bk31//1
	SKIP    = 0                !       ! /4
	CINT    = 500!-300.;-200.;-160.;-120.;-80.;-40.;0.
	LINE    = 3/1/1/2           !15/1/2
	TITLE   = 5/-2/ ~ ETA  CAPE,CIN AND 850 WIND   |^ CAPE,CIN,850 WIND ! 0
	SKIP    = /2;2
	FINT    = 500;1000;1500;2000;2500;3000;3500;4000;5000;6000
	FLINE   = 0;26-16--2;14-8--2
	CTYPE   = c/f                !c
	HILO    =                  !
	\$mapfil=HIPOWO.GSF
	list
	run

	exit
EOF



~/bin/saveEta eta1 etaCCW${date}${1} etaCCW

##############################################################
# ETA temps

$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	GDFILE	= $grid
	GDATTIM	= ${dattim}
	DEVICE	= $device 
	PANEL	= 0
	TEXT	= 1.2/21//hw
	CONTUR	= 1
	MAP     = 31/1/1
	CLEAR	= yes
	CLRBAR  = 31
	GAREA	= 17;-122;53;-60
	PROJ	= lcc/25;-95;25
	LATLON	= 0

	GLEVEL  = 0                !850              ! 700  !2
	GVCORD  = pres             !pres             !pres  !hagl
	GFUNC   = (quo(p06m,25.4)) !(tmpc) ! (tmpc)! (tmpc)
	GVECT   =
	CINT    = 0.10;0.25;0.50;0.75;1.0;1.25;1.5;2.0!-5.0;0.0;2.0!-2.0;0.0;2.0 !-5.;0.;2.
	LINE    = 20//2/0           !6/1/2          ! 7/1/2  ! 2/4/2
	TITLE   = 5/-2/ ~ ETA 2M(RED),850MB(BLUE),700 MB T(C)|^ 2M,850,700 MB TMPC, PREC !0!0
	SCALE   = 0
	SKIP    = 0
	FINT    = 0.01;0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0
	FLINE   = 0;21-27;24;28-30;14;15;2;5
	CTYPE   = f                !c                ! c  ! c
	HILO    =                  !  !  !
	HLSYM   =
	STNPLT=0
	\$mapfil=HIPOWO.GSF
	list
	run

	exit
EOF


~/bin/saveEta eta1 etaTEMP${date}${1} etaTEMP


########################################################
# ETA 850 hPa Heights, Dew Points, Winds

$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	GDFILE	= $grid
	GDATTIM	= ${dattim}
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
	TITLE	= 5/-2/ ~ ETA   850 HGHTS, DEW POINTS (C) AND WIND|^ 850 Z, TD, WIND!0
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


~/bin/saveEta eta1 eta85P${date}${1} eta85P

###################################################
# ETA 250 hPa plot

$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	GAREA	= grid
	PROJ	= lcc/25;-95;25
	CLRBAR  = 31

	GLEVEL	= 250  
	GVCORD	= pres !pres  !pres
	GFUNC	= sped !hght  !div(wnd)
	GVECT	= ! !
	CINT	= 10;20;30;40;50;60;70;80;90! 120 !2
	LINE	= 7/5/1/2           !31/1/2/2  !29/1/1/1
	TITLE	= 5/-2/ ~ ETA  250 MB HGHTS, WIND SPEED (M/S) AND DIV
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


~/bin/saveEta eta1 eta25P${date}${1} eta25P

################################################
# ETA 700 hPa Plots

$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	DEVICE	= $device 
	GAREA	= grid
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
	TITLE	= 5/-2/ ~ ETA  700 HEIGHTS, RH and TEMP|^ 700 HGHT, RH AND TEMP!0!0
	FINT	= 10;30;50;70;90
	FLINE	= 0;11;17-23-2
	CTYPE	= f ! c
	STNPLT  = 0
	\$mapfil=HIPOWO.GSF
	list
	run

	exit
EOF


~/bin/saveEta eta1 eta70P${date}${1} eta70P

########################################################
# ETA EHI, Surface Temp and Dew Point


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

	GDFILE	= $grid
	GDATTIM	= ${dattim}
	DEVICE	= $device 
	PANEL	= 0
	TEXT	= 1.2/21//hw
	CONTUR	= 1
	MAP     = 31/1/1
	CLEAR	= yes
	CLRBAR  = 31
	GAREA	= 17;-122;53;-60
	PROJ	= lcc/25;-95;25
	LATLON	= 0

	GLEVEL  = 0                !2      !2
	GVCORD  = none             !hagl   !hagl
	GFUNC=quo(mul(cape,hlcy@3000:0%hagl),160000.)!dwpf!tmpf
	GVECT   =                  !       !  
	WIND    =                  !       ! 
	SKIP    = 0                !       ! 
	SCALE   = 0 ! 0 ! 0
	CINT    = 0;0.5;1;1.5;2;3;4;5;6;7;8!45;50;55;60;65;70;75;80!60;70;75;80;85;90;95;100
	LINE    = 3/1/1/2           !15/1/2 ! 31/1/1/1
	TITLE   = 5/-2/ ~ ETA EHI, SFC T & DEW POINT   |^ EHI, SFC T & DEW POINT ! 0
	FINT    = 1;1.5;2;3;4;5;6;7;8!
	FLINE   = 0;26-16--2;14-8--2
	CTYPE   = f                !c ! c
	HILO    =                  !  ! 
	STNPLT  =0
	\$mapfil=HIPOWO.GSF
	list
	run

	exit
EOF



~/bin/saveEta eta1 etaEHI${date}${1} etaEHI


echo "Completetion of ETA script at `date` " 
