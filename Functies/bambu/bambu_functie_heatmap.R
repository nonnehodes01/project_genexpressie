library(bambu)
library(GenomicFeatures)

run_bambu_pipeline <- function(bam_folder, annotation_file, genome_file, output_folder) {
  # Get all BAM files
  bam_files <- list.files(bam_folder, pattern = "\\.bam$", full.names = TRUE)
  
  # Prepare annotations
  prepared_annotations <- prepareAnnotations(annotation_file)
  
  # Get summarised experiment object
  se_multisample <- bambu(reads = bam_files, annotations = prepared_annotations, genome = genome_file)
  
  # Write Bambu output
  writeBambuOutput(se_multisample, path = output_folder)
  
  # Plot Bambu heatmap
  plotBambu(se_multisample, type = "heatmap")
}

# Set file paths
#bam_folder <- "/home/data/projecticum/PFAS/BAM_files"
#annotation_file <- "~/project_genexpressie/annotation/GCA_000001405.15_GRCh38_full_analysis_set.refseq_annotation.gtf.gz"
#genome_file <- "/home/data/projecticum/PFAS/raw_data/GRCh38_latest_rna.fna.gz"
#output_folder <- "~/project_genexpressie/bambu"

# Run the Bambu pipeline
run_bambu_pipeline(bam_folder, annotation_file, genome_file, output_folder)
