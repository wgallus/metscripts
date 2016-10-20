
source ../COMMON.csh

set date1 = `date --date "${1} days ago" '+%Y/%m/%d'`
set date2 = `date --date "${1} days ago" '+%Y%m%d'`
set date3 = `date --date "${1} days ago" '+%y%m%d'`
set date4 = `date --date "${1} days ago" '+%d'`


set h = ( 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 )

set cc = 1 
while ( $cc <= 24 )

cp /data/text/boy/${date3}${h[$cc]}.boy ${ddir}${date1}/text/boy/${date2}${h[$cc]}_boy.txt
cp /data/text/mod/${date3}${h[$cc]}.mod ${ddir}${date1}/text/mod/${date2}${h[$cc]}_mod.txt
cp /data/text/sao/${date3}${h[$cc]}.sao ${ddir}${date1}/text/sao/${date2}${h[$cc]}_sao.txt
cp /data/text/syn/${date3}${h[$cc]}.syn ${ddir}${date1}/text/syn/${date2}${h[$cc]}_syn.txt
cp /data/text/upa/${date3}${h[$cc]}.upa ${ddir}${date1}/text/upa/${date2}${h[$cc]}_upa.txt

@ cc = $cc + 1
end

cp /data/text/Public/Public.${date4} ${ddir}${date1}/text/Public/Public_${date4}.txt
cp /data/text/Severe/Severe.${date4} ${ddir}${date1}/text/Severe/Severe_${date4}.txt
cp /data/text/Record/Record.${date4} ${ddir}${date1}/text/records/Record_${date4}.txt
cp /data/text/Climate/Climate.${date4} ${ddir}${date1}/text/Climate/Climate_${date4}.txt
