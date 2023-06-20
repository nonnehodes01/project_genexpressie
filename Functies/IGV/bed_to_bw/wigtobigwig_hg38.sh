#!/bin/bash

bash merged-hg38.sh $1; 

#################################################################################################

echo "variableStep chrom=chr1 span=1" >> temp.wig;
coverageBed -a merge-chr1.bed -b s-chr1.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr1.bed; 
rm merge-chr1.bed;
echo "chr1 is completed";

#################################################################################################

echo "variableStep chrom=chr2 span=1" >> temp.wig;
coverageBed -a merge-chr2.bed -b s-chr2.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr2.bed; 
rm merge-chr2.bed;
echo "chr2 is completed";

#################################################################################################

echo "variableStep chrom=chr3 span=1" >> temp.wig;
coverageBed -a merge-chr3.bed -b s-chr3.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr3.bed; 
rm merge-chr3.bed;
echo "chr3 is completed";

#################################################################################################

echo "variableStep chrom=chr4 span=1" >> temp.wig;
coverageBed -a merge-chr4.bed -b s-chr4.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr4.bed; 
rm merge-chr4.bed;
echo "chr4 is completed";

#################################################################################################

echo "variableStep chrom=chr5 span=1" >> temp.wig;
coverageBed -a merge-chr5.bed -b s-chr5.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr5.bed; 
rm merge-chr5.bed;
echo "chr5 is completed";

#################################################################################################

echo "variableStep chrom=chr6 span=1" >> temp.wig;
coverageBed -a merge-chr6.bed -b s-chr6.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr6.bed; 
rm merge-chr6.bed;
echo "chr6 is completed";

#################################################################################################

echo "variableStep chrom=chr7 span=1" >> temp.wig;
coverageBed -a merge-chr7.bed -b s-chr7.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr7.bed; 
rm merge-chr7.bed;
echo "chr7 is completed";

#################################################################################################

echo "variableStep chrom=chr8 span=1" >> temp.wig;
coverageBed -a merge-chr8.bed -b s-chr8.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr8.bed; 
rm merge-chr8.bed;
echo "chr8 is completed";

#################################################################################################

echo "variableStep chrom=chr9 span=1" >> temp.wig;
coverageBed -a merge-chr9.bed -b s-chr9.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr9.bed; 
rm merge-chr9.bed;
echo "chr9 is completed";

#################################################################################################

echo "variableStep chrom=chr10 span=1" >> temp.wig;
coverageBed -a merge-chr10.bed -b s-chr10.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr10.bed; 
rm merge-chr10.bed;
echo "chr10 is completed";

#################################################################################################

echo "variableStep chrom=chr11 span=1" >> temp.wig;
coverageBed -a merge-chr11.bed -b s-chr11.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr11.bed; 
rm merge-chr11.bed;
echo "chr11 is completed";

#################################################################################################

echo "variableStep chrom=chr12 span=1" >> temp.wig;
coverageBed -a merge-chr12.bed -b s-chr12.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr12.bed; 
rm merge-chr12.bed;
echo "chr12 is completed";

#################################################################################################

echo "variableStep chrom=chr13 span=1" >> temp.wig;
coverageBed -a merge-chr13.bed -b s-chr13.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr13.bed; 
rm merge-chr13.bed;
echo "chr13 is completed";

#################################################################################################

echo "variableStep chrom=chr14 span=1" >> temp.wig;
coverageBed -a merge-chr14.bed -b s-chr14.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr14.bed; 
rm merge-chr14.bed;
echo "chr14 is completed";

#################################################################################################

echo "variableStep chrom=chr15 span=1" >> temp.wig;
coverageBed -a merge-chr15.bed -b s-chr15.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr15.bed; 
rm merge-chr15.bed;
echo "chr15 is completed";

#################################################################################################

echo "variableStep chrom=chr16 span=1" >> temp.wig;
coverageBed -a merge-chr16.bed -b s-chr16.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr16.bed; 
rm merge-chr16.bed;
echo "chr16 is completed";

#################################################################################################

echo "variableStep chrom=chr17 span=1" >> temp.wig;
coverageBed -a merge-chr17.bed -b s-chr17.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr17.bed; 
rm merge-chr17.bed;
echo "chr17 is completed";

#################################################################################################

echo "variableStep chrom=chr18 span=1" >> temp.wig;
coverageBed -a merge-chr18.bed -b s-chr18.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr18.bed; 
rm merge-chr18.bed;
echo "chr18 is completed";

#################################################################################################

echo "variableStep chrom=chr19 span=1" >> temp.wig;
coverageBed -a merge-chr19.bed -b s-chr19.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr19.bed; 
rm merge-chr19.bed;
echo "chr19 is completed";

#################################################################################################

echo "variableStep chrom=chr20 span=1" >> temp.wig;
coverageBed -a merge-chr20.bed -b s-chr20.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr20.bed; 
rm merge-chr20.bed;
echo "chr20 is completed";

#################################################################################################

echo "variableStep chrom=chr21 span=1" >> temp.wig;
coverageBed -a merge-chr21.bed -b s-chr21.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr21.bed; 
rm merge-chr21.bed;
echo "chr21 is completed";

#################################################################################################

echo "variableStep chrom=chr22 span=1" >> temp.wig;
coverageBed -a merge-chr22.bed -b s-chr22.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chr22.bed; 
rm merge-chr22.bed;
echo "chr22 is completed";

#################################################################################################

echo "variableStep chrom=chrX span=1" >> temp.wig;
coverageBed -a merge-chrX.bed -b s-chrX.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chrX.bed; 
rm merge-chrX.bed;
echo "chrX is completed";

#################################################################################################

echo "variableStep chrom=chrY span=1" >> temp.wig;
coverageBed -a merge-chrY.bed -b s-chrY.bed -d | awk ' BEGIN {OFS="\t"} {if($5>1) {print $2+$4, $5}}' - >> temp.wig; 
rm s-chrY.bed; 
rm merge-chrY.bed;
echo "chrY is completed";

#################################################################################################

echo "wig to bigwig begint nu";
wigToBigWig temp.wig mm10.chrom.sizes $1.bw;
rm temp.wig;
