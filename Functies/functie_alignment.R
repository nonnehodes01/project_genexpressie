align_with_minimap2 <- function(data_type_alignment, read_type_alignment, input_dir_alignment, reference_path_alignment, output_dir_alignment) {
  # Berekening van minimap2 parameters op basis van het data- en read type
  if (tolower(data_type_alignment) == "dna") {
    if (tolower(read_type_alignment) == "long") {
      params <- "-ax map-ont"
    } else if (tolower(read_type_alignment) == "short") {
      params <- "-a"
    } else {
      stop("Ongeldig read_type_alignment. Kies 'long' of 'short'.")
    }
  } else if (tolower(data_type_alignment) == "rna") {
    if (tolower(read_type_alignment) == "long") {
      params <- "-ax splice"
    } else if (tolower(read_type_alignment) == "short") {
      params <- "-a"
    } else {
      stop("Ongeldig read_type_alignment. Kies 'long' of 'short'.")
    }
  } else {
    stop("Ongeldig data_type_alignment. Kies 'DNA' of 'RNA'.")
  }
  
  # Maak een lijst van de invoerbestanden uit de input directory
  input_files <- list.files(input_dir_alignment, pattern = "*.fastq.gz", full.names = TRUE)
  
  # Controleer of de output directory al bestaat, zo niet dan wordt deze aangemaakt
  if (!dir.exists(output_dir_alignment)) {
    dir.create(output_dir_alignment)
  }
  
  # Loop over de invoerbestanden en voer de minimap2-alignment uit voor elk bestand
  for (input_file in input_files) {
    # Verwijder de ".fastq.gz" extensie van de invoerbestandsnaam
    input_file_clean <- gsub(".fastq.gz$", "", basename(input_file))
    
    # Naamgeving maken voor het uitvoerbestand bij het huidige invoerbestand
    output_name <- paste0("aligned_", input_file_clean)
    
    # Voeg ".sam" toe aan de uitvoerbestandsnaam
    output_file <- file.path(output_dir_alignment, paste0(output_name, ".sam"))
    
    # Commando voor het uitvoeren van het minimap2-alignment
    alignment_command <- paste0("minimap2", " ", params, " ", reference_path_alignment, " ", input_file, " > ", output_file)
    
    # Uitvoeren van de minimap2-alignment
    system(alignment_command)
    
    cat("Alignment voltooid. Uitvoerbestand:", output_file, "\n")
  }
}

align_with_minimap2(data_type_alignment, read_type_alignment, input_dir_alignment, reference_path_alignment, output_dir_alignment)
