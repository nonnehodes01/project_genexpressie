runBambuAnalysis <- function(bam.folder, annotation.file, genome.file) {
  # Load required packages
  library(bambu)
  library(ggplot2)
  library(GenomicFeatures)
  library(BiocParallel)
  library(circlize)
  library(ComplexHeatmap)
  
  # Set the number of threads for parallel processing
  register(SnowParam(8))
  
  # Get all .bam files in the BAM_filtered directory
  bam.files <- list.files(bam.folder, pattern = "\\.bam$", full.names = TRUE)
  
  # Prepare annotations
  prepared.annotations <- prepareAnnotations(annotation.file)
  
  # Run bambu to get summarized experiment object
  se.multiSample <- bambu(reads = bam.files, annotations = prepared.annotations, genome = genome.file)
  
  # Write summarized experiment object to .gtf file
  writeBambuOutput(se.multiSample, path = "~/project_genexpressie/bambu/")
  
  # Plot the samples in PCA
  plotBambu(se.multiSample, type = "pca")
  
  # Obtain gene expression estimates from transcript expression
  colData(se.multiSample)$condition <- as.factor(basename(bam.files))
  
  seGene.multiSample <- transcriptToGeneExpression(se.multiSample)
  
  # Set group variable for plotting
  colData(seGene.multiSample)$groupVar <- as.factor(basename(bam.files))
  
  # Plot gene expression heatmap
  plotBambu(seGene.multiSample, type = "heatmap")
}

# Voorbeeldgebruik van de functie:
bam.folder <- "~/Project_data/Filtered_BAM"
annotation.file <- "~/Project_data/Filtered_BAM/GCA_000001405.15_GRCh38_full_analysis_set.refseq_annotation.gtf."
genome.file <- "~/Project_data/Filtered_BAM/GRCh38_latest_rna.fa"

runBambuAnalysis(bam.folder, annotation.file, genome.file)
