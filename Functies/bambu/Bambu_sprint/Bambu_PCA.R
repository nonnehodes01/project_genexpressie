library(bambu)
library(ggplot2)
library(GenomicFeatures)

# Set file paths
bam.folder <- "/home/data/projecticum/PFAS/BAM_files"
gff.file <- "~/GRCh38_latest_genomic.gff"
genome.file <- "~/GRCh38_latest_rna.fna"

# Get all .bam files in the BAM_filtered directory
bam.files <- list.files(bam.folder, pattern = "\\.bam$", full.names = TRUE)

# Import GFF file as a GRanges object
annotations <- import.gff(con = gff.file)

# Prepare annotations
prepared.annotations <- prepareAnnotations(annotations)

# Run bambu to get summarized experiment object
se.multiSample <- bambu(reads = bam.files, annotations = prepared.annotations, genome = genome.file)

# Write summarized experiment object to .gtf file
writeBambuOutput(se.multiSample, path = "~/project_genexpressie/bambu/")

# Plot the samples in PCA
plotBambu(se.multiSample, type = "pca")