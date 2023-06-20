# importeer functie bestanden
source("functie_alignment.R")
source("functie_flags_filtering.R")
source("functie_check_filter.R")
source("functie_add_header.R")
source("functie_sam_to_bam.R")

# functie_alignment.R 
# data_type_alignment <- "RNA"
# read_type_alignment <- "long"
# input_dir_alignment <- "/home/data/projecticum/PFAS/raw_data"
# reference_path_alignment <- "/home/data/projecticum/PFAS/raw_data/GRCh38_latest_rna.fna.gz"
# output_dir_alignment <- "/home/data/projecticum/PFAS/SAM_files/aligned_sam_files"

# functie_flags_filtering.R
# input_directory_filtering <- "/home/data/projecticum/PFAS/SAM_files/aligned_sam_files"
# output_directory_filtering <- "/home/data/projecticum/PFAS/SAM_files/filtered_sam_files"
# flags_filtering <- c(0 16)

# functie_check_filter.R
# directory_check <- "/home/data/projecticum/PFAS/SAM_files/filtered_sam_files"

# functie_add_header.R 
# aligned_directory_add_header <- "/home/data/projecticum/PFAS/SAM_files/aligned_sam_files"
# filtered_directory_add_header <- "/home/data/projecticum/PFAS/SAM_files/filtered_sam_files"
# output_directory_add_header <- "/home/data/projecticum/PFAS/SAM_files/headered_filtered_sam_files"

# functie_sam_to_bam.R
# input_dir_sam_bam <- "/home/data/projecticum/PFAS/SAM_files/headered_filtered_sam_files"
# output_dir_sam_bam <- "/home/data/projecticum/PFAS/BAM_files"
