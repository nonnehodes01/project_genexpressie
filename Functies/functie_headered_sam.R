move_headered_sam_files <- function(input_dir, output_dir) {
  # Controleren of de output directory al bestaat, zo niet dan wordt deze aangemaakt
  if (!dir.exists(output_dir)) {
    dir.create(output_dir)
  }
  
  # Lijst van bestanden in de input directory die beginnen met "headered_" en eindigen op ".sam"
  input_files <- list.files(input_dir, pattern = "^headered_.*\\.sam$", full.names = TRUE)
  
  # Loop over de input bestanden en verplaats ze naar de output directory
  for (input_file in input_files) {
    output_file <- file.path(output_dir, basename(input_file))
    command <- paste0("mv ", input_file, " ", output_dir)
    system(command)
    cat("Bestand verplaatst:", output_file, "\n")
  }
}

move_headered_sam_files(input_dir = "~/project_genexpressie/filtered_SAM_files", output_dir = "~/project_genexpressie/headered_filtered_SAM_files")

# Voorbeeldgebruik: 
# input_dir <- "/pad/naar/filtered/sam/bestanden"
# output_dir <- "pad/naar/waar/ze/opgeslagen/moeten/worden"
