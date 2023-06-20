#!/bin/bash

awk '{print $0 >> $1".bed"}' $1;

#################################################################

awk 'BEGIN {OFS="\t"} { if ($3 < 248956422 ) {print $0}}' chr1.bed | sort -k1,1 -k2,2n -u > s-chr1.bed; mergeBed -i s-chr1.bed > merge-chr1.bed; echo 'chr1';
awk 'BEGIN {OFS="\t"} { if ($3 < 242193529 ) {print $0}}' chr2.bed | sort -k1,1 -k2,2n -u > s-chr2.bed; mergeBed -i s-chr2.bed > merge-chr2.bed; echo 'chr2';
awk 'BEGIN {OFS="\t"} { if ($3 < 198295559 ) {print $0}}' chr3.bed | sort -k1,1 -k2,2n -u > s-chr3.bed; mergeBed -i s-chr3.bed > merge-chr3.bed; echo 'chr3';
awk 'BEGIN {OFS="\t"} { if ($3 < 190214555 ) {print $0}}' chr4.bed | sort -k1,1 -k2,2n -u  > s-chr4.bed; mergeBed -i s-chr4.bed > merge-chr4.bed; echo 'chr4';
awk 'BEGIN {OFS="\t"} { if ($3 < 181538259 ) {print $0}}' chr5.bed | sort -k1,1 -k2,2n -u  > s-chr5.bed; mergeBed -i s-chr5.bed > merge-chr5.bed; echo 'chr5';
awk 'BEGIN {OFS="\t"} { if ($3 < 170805979 ) {print $0}}' chr6.bed | sort -k1,1 -k2,2n -u  > s-chr6.bed; mergeBed -i s-chr6.bed > merge-chr6.bed; echo 'chr6';
awk 'BEGIN {OFS="\t"} { if ($3 < 159345973 ) {print $0}}' chr7.bed | sort -k1,1 -k2,2n -u  > s-chr7.bed; mergeBed -i s-chr7.bed > merge-chr7.bed; echo 'chr7';
awk 'BEGIN {OFS="\t"} { if ($3 < 145138636 ) {print $0}}' chr8.bed | sort -k1,1 -k2,2n -u  > s-chr8.bed; mergeBed -i s-chr8.bed > merge-chr8.bed; echo 'chr8';
awk 'BEGIN {OFS="\t"} { if ($3 < 138394717 ) {print $0}}' chr9.bed | sort -k1,1 -k2,2n -u  > s-chr9.bed; mergeBed -i s-chr9.bed > merge-chr9.bed; echo 'chr9';
awk 'BEGIN {OFS="\t"} { if ($3 < 133797422 ) {print $0}}' chr10.bed |sort -k1,1 -k2,2n -u  > s-chr10.bed; mergeBed -i s-chr10.bed > merge-chr10.bed; echo 'chr10';
awk 'BEGIN {OFS="\t"} { if ($3 < 135086622 ) {print $0}}' chr11.bed |sort -k1,1 -k2,2n -u  > s-chr11.bed; mergeBed -i s-chr11.bed > merge-chr11.bed; echo 'chr11';
awk 'BEGIN {OFS="\t"} { if ($3 < 133275309 ) {print $0}}' chr12.bed |sort -k1,1 -k2,2n -u  > s-chr12.bed; mergeBed -i s-chr12.bed > merge-chr12.bed; echo 'chr12';
awk 'BEGIN {OFS="\t"} { if ($3 < 114364328 ) {print $0}}' chr13.bed |sort -k1,1 -k2,2n -u  > s-chr13.bed; mergeBed -i s-chr13.bed > merge-chr13.bed; echo 'chr13';
awk 'BEGIN {OFS="\t"} { if ($3 < 107043718 ) {print $0}}' chr14.bed |sort -k1,1 -k2,2n -u  > s-chr14.bed; mergeBed -i s-chr14.bed > merge-chr14.bed; echo 'chr14';
awk 'BEGIN {OFS="\t"} { if ($3 < 101991189 ) {print $0}}' chr15.bed |sort -k1,1 -k2,2n -u  > s-chr15.bed; mergeBed -i s-chr15.bed > merge-chr15.bed; echo 'chr15';
awk 'BEGIN {OFS="\t"} { if ($3 < 90338345 ) {print $0}}' chr16.bed |sort -k1,1 -k2,2n -u  > s-chr16.bed; mergeBed -i s-chr16.bed > merge-chr16.bed; echo 'chr16';
awk 'BEGIN {OFS="\t"} { if ($3 < 83257441 ) {print $0}}' chr17.bed |sort -k1,1 -k2,2n -u  > s-chr17.bed; mergeBed -i s-chr17.bed > merge-chr17.bed; echo 'chr17';
awk 'BEGIN {OFS="\t"} { if ($3 < 80373285 ) {print $0}}' chr18.bed |sort -k1,1 -k2,2n -u  > s-chr18.bed; mergeBed -i s-chr18.bed > merge-chr18.bed; echo 'chr18';
awk 'BEGIN {OFS="\t"} { if ($3 < 58617616 ) {print $0}}' chr19.bed |sort -k1,1 -k2,2n -u  > s-chr19.bed; mergeBed -i s-chr19.bed > merge-chr19.bed; echo 'chr19';
awk 'BEGIN {OFS="\t"} { if ($3 < 64444167 ) {print $0}}' chr20.bed |sort -k1,1 -k2,2n -u  > s-chr20.bed; mergeBed -i s-chr20.bed > merge-chr20.bed; echo 'chr20';
awk 'BEGIN {OFS="\t"} { if ($3 < 46709983 ) {print $0}}' chr21.bed |sort -k1,1 -k2,2n -u  > s-chr21.bed; mergeBed -i s-chr21.bed > merge-chr21.bed; echo 'chr21';
awk 'BEGIN {OFS="\t"} { if ($3 < 50818468 ) {print $0}}' chr22.bed |sort -k1,1 -k2,2n -u  > s-chr22.bed; mergeBed -i s-chr22.bed > merge-chr22.bed; echo 'chr22';
awk 'BEGIN {OFS="\t"} { if ($3 < 156040895 ) {print $0}}' chrX.bed | sort -k1,1 -k2,2n -u  > s-chrX.bed; mergeBed -i s-chrX.bed > merge-chrX.bed; echo 'chrX';
awk 'BEGIN {OFS="\t"} { if ($3 < 57227415 ) {print $0}}' chrY.bed | sort -k1,1 -k2,2n -u  > s-chrY.bed; mergeBed -i s-chrY.bed > merge-chrY.bed; echo 'chrY';
rm chr*.bed;
############################################################


