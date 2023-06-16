filter_samtools_flags <- function(input_dir, output_dir, keep_flags, remove_flags) {
  #controlleren of de output directory al bestaat, zo niet dan wordt deze aangemaakt
  if (!dir.exists(output_dir)) {
    dir.create(output_dir)
  }
  
  #aanmaken van lijst voor de input bestanden in de input_dir
  input_files <- list.files(input_dir, pattern = "*.sam", full.names = TRUE)
  
  # Functie om een lijst van flags om te zetten naar een string van samtools flags
  flags_to_string <- function(flags) {
    paste0("-f", unlist(lapply(flags, function(f) paste0(f, collapse = ","))), collapse = " ")
  }
  
  # Loop over elk invoerbestand
  for (input_file in input_files) {
    # Uitvoerbestand voor het huidige invoerbestand
    output_file <- file.path(output_dir, paste0("filtered_", basename(input_file)))
    
    # Bestandsnaam voor het header-bestand
    header_file <- file.path(output_dir, paste0("header_", basename(input_file), ".txt"))
    
    # Samtools filteren op basis van de opgegeven actie en flags
    samtools_cmd <- ""
    
    if (length(keep_flags) > 0 && keep_flags[[1]] != "none") {
      keep_flags_str <- flags_to_string(keep_flags)
      samtools_cmd <- paste0("samtools view -H ", input_file, " > ", header_file, " && samtools view -b ", keep_flags_str, " ", input_file)
      
      if (length(remove_flags) > 0 && remove_flags[[1]] != "none") {
        remove_flags_str <- flags_to_string(remove_flags)
        samtools_cmd <- paste0(samtools_cmd, " | samtools view -b ", remove_flags_str)
      }
      
      samtools_cmd <- paste0(samtools_cmd, " > ", output_file)
    } else if (length(remove_flags) > 0 && remove_flags[[1]] != "none") {
      remove_flags_str <- flags_to_string(remove_flags)
      samtools_cmd <- paste0("samtools view -H ", input_file, " > ", header_file, " && samtools view -b ", remove_flags_str, " ", input_file, " > ", output_file)
    } else {
      # Kopiëren van het oorspronkelijke bestand als er geen filtering nodig is
      file.copy(input_file, output_file)
      cat("Geen filtering uitgevoerd. Uitvoerbestand is een kopie van het oorspronkelijke bestand:", output_file, "\n")
      next
    }
    
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

    
    
    