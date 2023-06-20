# Pipeline voor het uitvoeren van de functies
run_pipeline <- function() {
  # Importeer functie bestanden
  source("~/HU_ILC_DS2/project_genexpressie/Functies/functie_alignment.R")
  source("~/HU_ILC_DS2/project_genexpressie/Functies/functie_flags_filtering.R")
  source("~/HU_ILC_DS2/project_genexpressie/Functies/functie_check_filter.R")
  source("~/HU_ILC_DS2/project_genexpressie/Functies/functie_add_header.R")
  source("~/HU_ILC_DS2/project_genexpressie/Functies/functie_sam_to_bam.R")
  
  # Functie_alignment.R
  data_type_alignment <- "RNA"
  read_type_alignment <- "long"
  input_dir_alignment <- "/home/data/projecticum/PFAS/raw_data"
  reference_path_alignment <- "/home/data/projecticum/PFAS/raw_data/GRCh38_latest_rna.fna.gz"
  output_dir_alignment <- "/home/data/projecticum/PFAS/SAM_files/aligned_sam_files"
  
  # Functie_flags_filtering.R
  input_directory_filtering <- "/home/data/projecticum/PFAS/SAM_files/aligned_sam_files"
  output_directory_filtering <- "/home/data/projecticum/PFAS/SAM_files/filtered_sam_files"
  flags_filtering <- c(0, 16)
  
  # Functie_check_filter.R
  directory_check <- "/home/data/projecticum/PFAS/SAM_files/filtered_sam_files"
  
  # Functie_add_header.R
  aligned_directory_add_header <- "/home/data/projecticum/PFAS/SAM_files/aligned_sam_files"
  filtered_directory_add_header <- "/home/data/projecticum/PFAS/SAM_files/filtered_sam_files"
  output_directory_add_header <- "/home/data/projecticum/PFAS/SAM_files/headered_filtered_sam_files"
  
  # Functie_sam_to_bam.R
  input_dir_sam_bam <- "/home/data/projecticum/PFAS/SAM_files/headered_filtered_sam_files"
  output_dir_sam_bam <- "/home/data/projecticum/PFAS/BAM_files"
  
  # Uitvoeren van de functies in de juiste volgorde
  alignment_function(data_type_alignment, read_type_alignment, input_dir_alignment, reference_path_alignment, output_dir_alignment)
  flags_filtering_function(input_directory_filtering, output_directory_filtering, flags_filtering)
  check_filter_function(directory_check)
  add_header_function(aligned_directory_add_header, filtered_directory_add_header, output_directory_add_header)
  sam_to_bam_function(input_dir_sam_bam, output_dir_sam_bam)
}

# Uitvoeren van de pipeline
run_pipeline()
