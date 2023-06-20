#!/bin/bash

ls *.bed > inputbedbestanden.txt;

for inputbed in $(cat ./inputbedbestanden.txt)
do
bash wigtobigwig_hg38.sh "$inputbed"
done
