## Er is gebruik gemaakt van de HU daur server omdat het installeren van miniconda3 niet lukte op mijn lokale desktop. 
# ik heb een nieuwe map aangemaakt voor het project genexpressie

##IN TERMINAL STAPPEN:

#aanmaken van een container voor project genexpressie (pg)
#conda create -n pg --clone=/home/nonne.hodes/miniconda3

#container activeren
#conda activate pg

#minimap2 geïnstalleerd
#conda install -c bioconda minimap2

#voer minimap2 commando uit in terminal
#minimap2 -a refgen_e_coli_144_NZ_CP028603.fa metagenome_e_coli_random_seq_ERR1713483.fastq.gz > test_alignment.sam
