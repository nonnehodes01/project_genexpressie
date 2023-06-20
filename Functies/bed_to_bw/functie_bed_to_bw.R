# Functie om auto_wigtobigwig_hg38.sh aan te roepen voor alle BED-bestanden
process_bed_files <- function(bed_dir, run_file) {
  # Lijst van BED-bestanden in de opgegeven map
  bed_files <- list.files(path = bed_dir, pattern = "\\.bed$", full.names = TRUE)
  
  # Loop over elk BED-bestand
  for (bed_file in bed_files) {
    # Controleren of het bestand een BED-bestand is
    if (file.exists(bed_file)) {
      # Aanroepen van auto_wigtobigwig_hg38.sh voor het huidige BED-bestand
      cat("Aanroepen van auto_wigtobigwig_hg38.sh voor:", bed_file, "\n")
      bash_command <- paste0("bash", " ", run_file, " ", shQuote(bed_file))
      system(bash_command)
      cat("Voltooid.\n\n")
    }
  }
}

# Pad naar de map met BED-bestanden
bed_dir <- "/pad/naar/bed/bestanden"
run_file <- "/pad/naar/auto_wigtobigwig_hg38.sh"
  
# Aanroepen van de functie om auto_wigtobigwig_hg38.sh aan te roepen voor alle BED-bestanden
process_bed_files(bed_dir, run_file)
