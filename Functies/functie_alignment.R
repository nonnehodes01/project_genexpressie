align_with_minimap2 <- function(data_type, read_type, input_dir, reference_path, output_dir) {
  #berekening van minimap2 parameters op basis van het data- en read type
  if (tolower(data_type) == "dna") {
    if (tolower(read_type) == "long") {
      params <- "-ax map-ont"
    } else if (tolower(read_type) == "short") {
      params <- "-a"
    } else {
      stop("Ongeldig read_type. Kies 'long' of 'short'.")
    }
  } else if (tolower(data_type) == "rna") {
    if (tolower(read_type) == "long") {
      params <- "-ax splice"
    } else if (tolower(read_type) == "short") {
      params <- "-a"
    } else {
      stop("Ongeldig read_type. Kies 'long' of 'short'.")
    }
  } else {
    stop("Ongeldig data_type. Kies 'DNA' of 'RNA'.")
  }
  
  #maak een lijst van de invoerbestanden uit de input directory
  input_files <- list.files(input_dir, pattern = "*.fastq", full.names = TRUE)
  
  #Controleer of de output directory al bestaat, zo niet dan wordt deze aangemaakt
  if (!dir.exists(output_dir)) {
    dir.create(output_dir)
  }
  
  #loop over de invoerbestanden de minimap2-alignment uit voor elk bestand
  for (input_file in input_files) {
    #naamgeving maken voor het uitvoerbestand bij het huidige invoerbestand
    output_file <- file.path(output_dir, paste0("alignment_", basename(input_file), ".sam"))
    
    #commando voor het uitvoeren van het minimap2-alignment
    alignment_command <- paste0("minimap2", " ", params, " ", reference_path, " ", input_file, " > ", output_file)
    
    #uitvoeren van de minimap2-alignment
    system(alignment_command)
    
    cat("Alignment voltooid. Uitvoerbestand:", output_file, "\n")
  }
}

align_with_minimap2(data_type, read_type, input_dir, reference_path, output_dir)


# voorbeeldgebruik van de functie
# data_type <- "RNA" of "DNA"
# read_type <- "long" of "short"
# input_dir <- "/pad/naar/te/aligneren/bestanden"
# reference_path <- "/pad/naar/referentie/genoom"
# output_dir <- "/pad/naar/uitvoer/map"

