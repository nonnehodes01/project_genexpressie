filter_samtools_flags <- function(input_dir, output_dir, keep_flags, remove_flags) {
  #controleren of de output file al bestaat, zo niet dan wordt deze aangemaakt
  if (!dir.exists(output_dir)) {
    dir.create(output_dir)
  }
  
  #aanmaken van een lijst voor de input bestanden in de input_dir
  input_files <- list.files(input_dir, pattern = "*.sam", full.names = TRUE)
  
  #functie om de input keep_flags en remove_flags lists om te zetten naar een string van samtools flags
  flags_to_string <- function(keep_flags, remove_flags) {
    keep_flags_str <- ""
    remove_flags_str <- ""
    
    if (length(keep_flags) > 0 && keep_flags[1] != "none") {
      for (i in seq_along(keep_flags)) {
        keep_flags_str <- paste0(keep_flags_str, " -f", keep_flags[i])
      }
    }
    
    if (length(remove_flags) > 0 && remove_flags[1] != "none") {
      for (i in seq_along(remove_flags)) {
        remove_flags_str <- paste0(remove_flags_str, " -F", remove_flags[i])
      }
    }
    
    flags_str <- paste0(keep_flags_str, remove_flags_str)
    return(flags_str)
  }
  #aanmaken van command 
  samtools_cmd <- function(flags_str, input_file, output_file) {
    samtools_cmd <- paste0("samtools view ", flags_str, " ", input_file, " -o ", output_file)
    return(samtools_cmd)
  }
  
  # Loop over elk invoerbestand
  for (input_file in input_files) {
    # Uitvoerbestand voor het huidige invoerbestand
    output_file <- file.path(output_dir, paste0("filtered_", basename(input_file)))
    
    # Bestandsnaam voor het header-bestand
    header_file <- file.path(output_dir, paste0("header_", basename(input_file), ".txt"))
    
    # Samtools filteren op basis van de opgegeven actie en flags
    samtools_cmd <- samtools_cmd(flags_to_string(keep_flags, remove_flags), input_file, output_file)
    
    # Naamgeving voor het headered sam-bestand
    headered_sam_file <- paste0(output_dir, "/headered_", basename(output_file), sep = "")
    
    # Header toevoegen aan het gefilterde bestand
    header_cmd <- paste0("cat ", header_file, " ", output_file, " > ", headered_sam_file)
    
    # Uitvoeren van de samtools- en header-commando's
    system(samtools_cmd)
    system(header_cmd)
    
    cat("Filtering voltooid. Uitvoerbestand:", headered_sam_file, "\n")
  }
}

input_dir <- "/pad/naar/gealigneerde/bestanden"
output_dir <- "/pad/naar/uitvoer"
keep_flags <- c(0, 3, 16)
remove_flags <- c(4, 256)

filter_samtools_flags(input_dir, output_dir, keep_flags, remove_flags)
