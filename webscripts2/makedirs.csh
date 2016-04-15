#! /bin/csh

set date1 = `date --date "${1} days" '+%Y/%m/%d'`
set ddir = "/mnt/mtarchive/data/"


# make directory for day
mkdir -p ${ddir}${date1}

# make directory and subdirectories for pix
mkdir -p ${ddir}${date1}/pix
mkdir -p ${ddir}${date1}/pix/rad
mkdir -p ${ddir}${date1}/pix/lapse
mkdir -p ${ddir}${date1}/pix/lapse/00z
mkdir -p ${ddir}${date1}/pix/lapse/12z
mkdir -p ${ddir}${date1}/pix/avn
mkdir -p ${ddir}${date1}/pix/avn/00z
mkdir -p ${ddir}${date1}/pix/avn/12z
mkdir -p ${ddir}${date1}/pix/ecm
mkdir -p ${ddir}${date1}/pix/eta
mkdir -p ${ddir}${date1}/pix/eta/00z
mkdir -p ${ddir}${date1}/pix/eta/12z
mkdir -p ${ddir}${date1}/pix/gemwx
mkdir -p ${ddir}${date1}/pix/ltg 
mkdir -p ${ddir}${date1}/pix/ltg/Midwest_lightning_past_hour
mkdir -p ${ddir}${date1}/pix/ltg/US_lightning_past_hour
mkdir -p ${ddir}${date1}/pix/mos
mkdir -p ${ddir}${date1}/pix/mos/00z
mkdir -p ${ddir}${date1}/pix/mos/12z
mkdir -p ${ddir}${date1}/pix/mrf
mkdir -p ${ddir}${date1}/pix/pro
mkdir -p ${ddir}${date1}/pix/pro/300mb_winds
mkdir -p ${ddir}${date1}/pix/pro/800m_winds
mkdir -p ${ddir}${date1}/pix/pro/850mb_700mb_500mb_winds
mkdir -p ${ddir}${date1}/pix/pro/1000m_winds
mkdir -p ${ddir}${date1}/pix/pro/Slater_time_series_profile
mkdir -p ${ddir}${date1}/pix/ruc
mkdir -p ${ddir}${date1}/pix/ruc/00z
mkdir -p ${ddir}${date1}/pix/ruc/01z
mkdir -p ${ddir}${date1}/pix/ruc/02z
mkdir -p ${ddir}${date1}/pix/ruc/03z
mkdir -p ${ddir}${date1}/pix/ruc/04z
mkdir -p ${ddir}${date1}/pix/ruc/05z
mkdir -p ${ddir}${date1}/pix/ruc/06z
mkdir -p ${ddir}${date1}/pix/ruc/07z
mkdir -p ${ddir}${date1}/pix/ruc/08z
mkdir -p ${ddir}${date1}/pix/ruc/09z
mkdir -p ${ddir}${date1}/pix/ruc/10z
mkdir -p ${ddir}${date1}/pix/ruc/11z
mkdir -p ${ddir}${date1}/pix/ruc/12z
mkdir -p ${ddir}${date1}/pix/ruc/13z
mkdir -p ${ddir}${date1}/pix/ruc/14z
mkdir -p ${ddir}${date1}/pix/ruc/15z
mkdir -p ${ddir}${date1}/pix/ruc/16z
mkdir -p ${ddir}${date1}/pix/ruc/17z
mkdir -p ${ddir}${date1}/pix/ruc/18z
mkdir -p ${ddir}${date1}/pix/ruc/19z
mkdir -p ${ddir}${date1}/pix/ruc/20z
mkdir -p ${ddir}${date1}/pix/ruc/21z
mkdir -p ${ddir}${date1}/pix/ruc/22z
mkdir -p ${ddir}${date1}/pix/ruc/23z
mkdir -p ${ddir}${date1}/pix/sat
mkdir -p ${ddir}${date1}/pix/sat/IR
mkdir -p ${ddir}${date1}/pix/sat/WV
mkdir -p ${ddir}${date1}/pix/sat/VIS
mkdir -p ${ddir}${date1}/pix/sfc/
mkdir -p ${ddir}${date1}/pix/sfc/dewpoint_winds
mkdir -p ${ddir}${date1}/pix/sfc/moisture_divergence
mkdir -p ${ddir}${date1}/pix/sfc/sfc_obs
mkdir -p ${ddir}${date1}/pix/sfc/temp_winds
mkdir -p ${ddir}${date1}/pix/sfc/theta_e
mkdir -p ${ddir}${date1}/pix/skew
mkdir -p ${ddir}${date1}/pix/skew/00z
mkdir -p ${ddir}${date1}/pix/skew/12z
mkdir -p ${ddir}${date1}/pix/tmp
mkdir -p ${ddir}${date1}/pix/ua
mkdir -p ${ddir}${date1}/pix/ukmet
mkdir -p ${ddir}${date1}/pix/ukmet/00z
mkdir -p ${ddir}${date1}/pix/ukmet/12z

# make directory and subdirectories for gempak files
mkdir -p ${ddir}${date1}/gempak
mkdir -p ${ddir}${date1}/gempak/model
mkdir -p ${ddir}${date1}/gempak/mos
mkdir -p ${ddir}${date1}/gempak/nldn
chmod 700 ${ddir}${date1}/gempak/nldn
mkdir -p ${ddir}${date1}/gempak/profiler
mkdir -p ${ddir}${date1}/gempak/surface
mkdir -p ${ddir}${date1}/gempak/surface/rwis
mkdir -p ${ddir}${date1}/gempak/surface/sao
mkdir -p ${ddir}${date1}/gempak/surface/snet
mkdir -p ${ddir}${date1}/gempak/upperair

# make directory and subdirectories for text data
mkdir -p ${ddir}${date1}/text
mkdir -p ${ddir}${date1}/text/Public
mkdir -p ${ddir}${date1}/text/Severe
mkdir -p ${ddir}${date1}/text/boy
mkdir -p ${ddir}${date1}/text/mod
mkdir -p ${ddir}${date1}/text/rad
mkdir -p ${ddir}${date1}/text/Climate
mkdir -p ${ddir}${date1}/text/records
mkdir -p ${ddir}${date1}/text/sao
mkdir -p ${ddir}${date1}/text/syn
mkdir -p ${ddir}${date1}/text/upa

