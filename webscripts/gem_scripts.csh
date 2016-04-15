#! /bin/csh


source ~/projects/metscripts/COMMON.csh

cp /data/gempak/mos/${date2}00_gmos.gem ${ddir}/${date1}/gempak/mos/${date2}00_gmos.gem
cp /data/gempak/mos/${date2}12_gmos.gem ${ddir}/${date1}/gempak/mos/${date2}12_gmos.gem

cp /data/gempak/model/nam/${date2}00_nam212.gem ${ddir}/${date1}/gempak/model/${date2}00_nam212.gem
cp /data/gempak/model/nam/${date2}12_nam212.gem ${ddir}/${date1}/gempak/model/${date2}12_nam212.gem
cp /data/gempak/model/nam/${date2}00_nam211.gem ${ddir}/${date1}/gempak/model/${date2}00_nam211.gem
cp /data/gempak/model/nam/${date2}12_nam211.gem ${ddir}/${date1}/gempak/model/${date2}12_nam211.gem

cp /data/gempak/surface/sao/${date2}_sao.gem ${ddir}/${date1}/gempak/surface/sao/${date2}_sao.gem
cp /data/gempak/upperair/${date2}_upa.gem ${ddir}/${date1}/gempak/upperair/${date2}_upa.gem
cp /data/gempak/nldn/${date2}*_nldn.gem ${ddir}/${date1}/gempak/nldn/
 
cp /data/gempak/model/ruc/${date2}00_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}00_ruc130.gem
cp /data/gempak/model/ruc/${date2}03_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}03_ruc130.gem
cp /data/gempak/model/ruc/${date2}06_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}06_ruc130.gem
cp /data/gempak/model/ruc/${date2}09_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}09_ruc130.gem
cp /data/gempak/model/ruc/${date2}12_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}12_ruc130.gem
cp /data/gempak/model/ruc/${date2}15_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}15_ruc130.gem
cp /data/gempak/model/ruc/${date2}18_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}18_ruc130.gem
cp /data/gempak/model/ruc/${date2}21_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}21_ruc130.gem

cp /data/gempak/model/gfs/${date2}00_gfs212.gem ${ddir}/${date1}/gempak/model/${date2}00_gfs212.gem
cp /data/gempak/model/gfs/${date2}12_gfs212.gem ${ddir}/${date1}/gempak/model/${date2}12_gfs212.gem

cp /data/gempak/model/gfs/${date2}00_thin.gem ${ddir}/${date1}/gempak/model/${date2}00_thin.gem
cp /data/gempak/model/gfs/${date2}12_thin.gem ${ddir}/${date1}/gempak/model/${date2}12_thin.gem
