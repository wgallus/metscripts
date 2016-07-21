# Save metfs1 produced gempak files to mtarchive
# called with number of days ago to run, usually 1

ddir="/isu/las/class/meteorology/mtarchive/data/"
date2=$(date -u --date "${1} days ago" +'%Y%m%d')
date1=$(date -u --date "${1} days ago" +'%Y/%m/%d')
www="http://metfs1.agron.iastate.edu/data/"

mygetter ()
{
	wget -q -O $2 $www/$1	
}

mkdir -p ${ddir}/${date1}/gempak/mos
mygetter gempak/mos/${date2}00_gmos.gem ${ddir}/${date1}/gempak/mos/${date2}00_gmos.gem
mygetter gempak/mos/${date2}12_gmos.gem ${ddir}/${date1}/gempak/mos/${date2}12_gmos.gem

mkdir -p ${ddir}/${date1}/gempak/model
mygetter gempak/model/nam/${date2}00_nam212.gem ${ddir}/${date1}/gempak/model/${date2}00_nam212.gem
mygetter gempak/model/nam/${date2}12_nam212.gem ${ddir}/${date1}/gempak/model/${date2}12_nam212.gem
mygetter gempak/model/nam/${date2}00_nam211.gem ${ddir}/${date1}/gempak/model/${date2}00_nam211.gem
mygetter gempak/model/nam/${date2}12_nam211.gem ${ddir}/${date1}/gempak/model/${date2}12_nam211.gem

mkdir -p ${ddir}/${date1}/gempak/surface/sao
mygetter gempak/surface/sao/${date2}_sao.gem ${ddir}/${date1}/gempak/surface/sao/${date2}_sao.gem

mkdir -p ${ddir}/${date1}/gempak/upperair
mygetter gempak/upperair/${date2}_upa.gem ${ddir}/${date1}/gempak/upperair/${date2}_upa.gem
 
mygetter gempak/model/ruc/${date2}00_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}00_ruc130.gem
mygetter gempak/model/ruc/${date2}03_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}03_ruc130.gem
mygetter gempak/model/ruc/${date2}06_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}06_ruc130.gem
mygetter gempak/model/ruc/${date2}09_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}09_ruc130.gem
mygetter gempak/model/ruc/${date2}12_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}12_ruc130.gem
mygetter gempak/model/ruc/${date2}15_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}15_ruc130.gem
mygetter gempak/model/ruc/${date2}18_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}18_ruc130.gem
mygetter gempak/model/ruc/${date2}21_ruc130.gem ${ddir}/${date1}/gempak/model/${date2}21_ruc130.gem

mygetter gempak/model/gfs/${date2}00_gfs215.gem ${ddir}/${date1}/gempak/model/${date2}00_gfs215.gem
mygetter gempak/model/gfs/${date2}12_gfs215.gem ${ddir}/${date1}/gempak/model/${date2}12_gfs215.gem

mygetter gempak/model/gfs/${date2}00_thin.gem ${ddir}/${date1}/gempak/model/${date2}00_thin.gem
mygetter gempak/model/gfs/${date2}12_thin.gem ${ddir}/${date1}/gempak/model/${date2}12_thin.gem

