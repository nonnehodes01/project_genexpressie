convert_sam_files_to_bam <- function(input_dir, output_dir) {
  #controleren of de output directory bestaat, anders maken we deze aan
  if (!dir.exists(output_dir)) {
    dir.create(output_dir)
  }
  
  #lijst van invoerbestanden in de input directory maken
  input_files <- list.files(input_dir, pattern = "*.sam$", full.names = TRUE)
  
  #loop over alle invoerbestanden
  for (input_file in input_files) {
    #uitvoerbestand maken voor het huidige invoerbestand
    output_file <- file.path(output_dir, paste0(basename(input_file), ".bam"))
    
    #samtools commando uitvoeren om het SAM-bestand om te zetten naar BAM-formaat
    samtools_cmd <- paste0("samtools view -bS ", input_file, " -o ", output_file)
    system(samtools_cmd)
    
    cat("SAM-bestand succesvol geconverteerd naar BAM-bestand:", output_file, "\n")
  }
  
  cat("Alle SAM-bestanden zijn succesvol geconverteerd naar BAM-bestanden in de directory:", output_dir, "\n")
}

# voorbeeldgebruik van de functie
# input_dir <- "/pad/naar/uitvoer/filtered_sam"!!!ZELFDE ALS output_dir IN filter_samtools_flags FUNCTION!!!
# output_dir <- "/pad/naar/uitvoer/map/bam"
