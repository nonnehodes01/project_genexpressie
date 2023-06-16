convert_sam_files_to_bam <- function(input_dir, output_dir) {
  # Controleren of de output directory bestaat, anders maken we deze aan
  if (!dir.exists(output_dir)) {
    dir.create(output_dir)
  }
  
  # Lijst van invoerbestanden in de input directory
  input_files <- list.files(input_dir, pattern = "*.sam$", full.names = TRUE)
  
  # Loop over elk invoerbestand
  for (input_file in input_files) {
    # Uitvoerbestand voor het huidige invoerbestand
    output_file <- file.path(output_dir, paste0(basename(input_file), ".bam"))
    
    # Samtools commando om het SAM-bestand om te zetten naar BAM-formaat
    samtools_cmd <- paste0("samtools view -bS ", input_file, " -o ", output_file)
    system(samtools_cmd)
    
    cat("SAM-bestand succesvol geconverteerd naar BAM-bestand:", output_file, "\n")
  }
  
  cat("Alle SAM-bestanden zijn succesvol geconverteerd naar BAM-bestanden in de directory:", output_dir, "\n")
}
