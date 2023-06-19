# Dit is een functie voor het aligneren van fastq bestanden tegen een fasta bestand. de fasta is hier een genoom of transcriptoom en de fastq bestanden zullen hier tegen gealigneerd worden.
# Om deze functie te gebruiken heb je een directory nodig met daarin de fastq bestanden die je wilt aligneren, een transcriptoom of genoom nodig en moet je weten of je te maken hebt met DNA of RNA long of short read data. 
# In de functie kan je aangeven of het gaat om DNA of RNA long of short read data en zal aan de hand van de input de correcte terminal command runnen, deze functie zal dus ook in de terminal uitgevoerd moeten worden. 

align_with_minimap2 <- function(data_type, read_type, input_dir, reference_path, output_dir) {
  # Berekening van minimap2 parameters op basis van het data- en read type
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
  
  # Maak een lijst van de invoerbestanden uit de input directory
  input_files <- list.files(input_dir, pattern = "*.fastq.gz", full.names = TRUE)
  
  # Controleer of de output directory al bestaat, zo niet dan wordt deze aangemaakt
  if (!dir.exists(output_dir)) {
    dir.create(output_dir)
  }
  
  # Loop over de invoerbestanden en voer de minimap2-alignment uit voor elk bestand
  for (input_file in input_files) {
    # Verwijder de ".fastq.gz" extensie van de invoerbestandsnaam
    input_file_clean <- gsub(".fastq.gz$", "", basename(input_file))
    
    # Naamgeving maken voor het uitvoerbestand bij het huidige invoerbestand
    output_name <- paste0("aligned_", input_file_clean)
    
    # Voeg ".sam" toe aan de uitvoerbestandsnaam
    output_file <- file.path(output_dir, paste0(output_name, ".sam"))
    
    # Commando voor het uitvoeren van het minimap2-alignment
    alignment_command <- paste0("minimap2", " ", params, " ", reference_path, " ", input_file, " > ", output_file)
    
    # Uitvoeren van de minimap2-alignment
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

# Hoe te runnen in een conda-environment:
# 1) zorg dat je een conda-environment hebt waarin minimap2 en samtools geinstalleerd is
# 2) vul de data in --> zie "voorbeeld gebruik van de functie", vul deze in met de data van toepassing
# 3) activeer je conda-environment
# 4) ga in de terminal naar de locatie van dit script
# 5) run in de terminal de volgende command: Rscript functie_alignment.R
