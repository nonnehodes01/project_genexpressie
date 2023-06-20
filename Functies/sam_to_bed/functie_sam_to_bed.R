# Functie om SamtoBed.sh uit te voeren voor elk SAM-bestand
process_sam_files <- function(sam_dir, toBed_file) {
  # Lijst van SAM-bestanden in de opgegeven map
  sam_files <- list.files(path = sam_dir, pattern = "\\.sam$", full.names = TRUE)
  
  # Loop over elk SAM-bestand
  for (sam_file in sam_files) {
    # Controleren of het bestand een SAM-bestand is
    if (file.exists(sam_file)) {
      # Uitvoeren van SamtoBed.sh voor het huidige SAM-bestand
      cat("Uitvoeren van SamtoBed.sh voor:", sam_file, "\n")
      bash_cmd <- paste0("bash", " ", toBed_file, " ", shQuote(sam_file))
      system(bash_cmd)
      cat("Voltooid.\n\n")
    }
  }
}

# Pad naar de map met SAM-bestanden
sam_dir <- "/pad/naar/sam/bestanden"
toBed_file <- "/pad/naar/SamtoBed.sh"

# Aufrufen van de functie om SamtoBed.sh uit te voeren voor elk SAM-bestand
process_sam_files(sam_dir, toBed_file)
