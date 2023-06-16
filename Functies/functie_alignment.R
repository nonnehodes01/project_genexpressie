align_with_minimap2 <- function(data_type, input_dir, reference_path) {
  #berekening van minimap2-parameters op basis van het data_type (DNA of RNA)
  if (tolower(data_type) == "DNA") {
    params <- "-a"
  } else if (tolower(data_type) == "RNA") {
    params <- "-a -x splice"
  } else {
    stop("Ongeldig data_type. Kies 'DNA' of 'RNA'.")
  }
  
  #maak een lijst van de invoerbestanden in de input directory
  input_files <- list.files(input_dir, pattern = "*.fastq", full.names = TRUE)
  
  #loop over elk invoerbestand en voer Minimap2-alignment uit
  for (input_file in input_files) {
    #naamgevinf maken voor het uitvoerbestand bij het huidige invoerbestand
    output_file <- paste0("alignment_", basename(input_file), ".sam")
    
    #commando voor het uitvoeren van het Minimap2-alignment
    alignment_command <- paste0("minimap2", " ", params, " ", reference_path, " ", input_file, " > ", output_file)
    
    #uitvoeren van de Minimap2-alignment
    system2(alignment_command)
    
    cat("Alignment voltooid. Uitvoerbestand:", output_file, "\n")
  }
}

#voorbeeldgebruik van de functie
data_type <- "RNA"
input_dir <- "/pad/naar/te/aligneren/bestanden"
reference_path <- "/pad/naar/referentie/genoom"

align_with_minimap2(data_type, input_dir, reference_file)
