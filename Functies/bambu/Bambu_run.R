library(bambu)

#prepare input files
bam.file <-
annotation.file <-
genome.file <-

#run the samples through bambu to get summarized experiment object
se.multiSample <- bambu(reads= c("~/project_genexpressie/Sprint_Bambu/BAM_filtered/filtered_nanopore_mcf7_11-01-2023.bam", "~/project_genexpressie/Sprint_Bambu/BAM_filtered/filtered_nanopore_mcf7_101315-06-2022.bam", "~/project_genexpressie/Sprint_Bambu/BAM_filtered/filtered_SGNex_MCF7_cDNA_replicate1_run3.bam", "~/project_genexpressie/Sprint_Bambu/BAM_filtered/filtered_SGNex_MCF7_cDNAStranded_replicate3_run2.bam") , annotations = "~/project_genexpressie/Sprint_Bambu/BAM_filtered/GCA_000001405.15_GRCh38_full_analysis_set.refseq_annotation.gtf",genome = "~/project_genexpressie/Sprint_Bambu/BAM_filtered/GRCh38_latest_rna.fna")

#write summarized experiment object to .gtf file
writeBambuOutput(se.multiSample, path = "./bambu/")

#plot the samples in PCA
library(ggplot2)
plotBambu(se.multiSample, type = "pca")

#heatmap
plotBambu(se.multiSample, type = "heatmap")
