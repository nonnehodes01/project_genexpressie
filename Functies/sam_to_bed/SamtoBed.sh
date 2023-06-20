#!/bin/bash
echo stap1 + stap2;

INPUTFILE=$1;
awk 'BEGIN {OFS="\t"} { if($2==0 && $3~/^chr[0-9XY]+$/) {print $3,$4, $4+length($10), "+"} 
else {if ($2==16 && $4 > length($10) && $3~/^chr[0-9XY]+$/) {print $3, $4-length($10), $4, "-"}}} ' $INPUTFILE |
awk '{print $0 >> $1".bed"}' - ;

#################################################

echo stap3;
ls chr*.bed > chrom-PG;

for chrom in $(cat ./chrom-PG)
do
sort -k1,1 -k2,2n -u $chrom > ${chrom}-PG.bed
echo $chrom is sorted
rm $chrom
done

############################################################

echo stap4;
cat chr*.bed > bed_files/sort-uniq-ext-${INPUTFILE}.bed;

rm chr*.bed;
rm chrom-PG;